/* Copyright Statement:
 *
 * This software/firmware and related documentation ("MediaTek Software") are
 * protected under relevant copyright laws. The information contained herein is
 * confidential and proprietary to MediaTek Inc. and/or its licensors. Without
 * the prior written permission of MediaTek inc. and/or its licensors, any
 * reproduction, modification, use or disclosure of MediaTek Software, and
 * information contained herein, in whole or in part, shall be strictly
 * prohibited.
 *
 * MediaTek Inc. (C) 2014. All rights reserved.
 *
 * BY OPENING THIS FILE, RECEIVER HEREBY UNEQUIVOCALLY ACKNOWLEDGES AND AGREES
 * THAT THE SOFTWARE/FIRMWARE AND ITS DOCUMENTATIONS ("MEDIATEK SOFTWARE")
 * RECEIVED FROM MEDIATEK AND/OR ITS REPRESENTATIVES ARE PROVIDED TO RECEIVER
 * ON AN "AS-IS" BASIS ONLY. MEDIATEK EXPRESSLY DISCLAIMS ANY AND ALL
 * WARRANTIES, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE IMPLIED
 * WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE OR
 * NONINFRINGEMENT. NEITHER DOES MEDIATEK PROVIDE ANY WARRANTY WHATSOEVER WITH
 * RESPECT TO THE SOFTWARE OF ANY THIRD PARTY WHICH MAY BE USED BY,
 * INCORPORATED IN, OR SUPPLIED WITH THE MEDIATEK SOFTWARE, AND RECEIVER AGREES
 * TO LOOK ONLY TO SUCH THIRD PARTY FOR ANY WARRANTY CLAIM RELATING THERETO.
 * RECEIVER EXPRESSLY ACKNOWLEDGES THAT IT IS RECEIVER'S SOLE RESPONSIBILITY TO
 * OBTAIN FROM ANY THIRD PARTY ALL PROPER LICENSES CONTAINED IN MEDIATEK
 * SOFTWARE. MEDIATEK SHALL ALSO NOT BE RESPONSIBLE FOR ANY MEDIATEK SOFTWARE
 * RELEASES MADE TO RECEIVER'S SPECIFICATION OR TO CONFORM TO A PARTICULAR
 * STANDARD OR OPEN FORUM. RECEIVER'S SOLE AND EXCLUSIVE REMEDY AND MEDIATEK'S
 * ENTIRE AND CUMULATIVE LIABILITY WITH RESPECT TO THE MEDIATEK SOFTWARE
 * RELEASED HEREUNDER WILL BE, AT MEDIATEK'S OPTION, TO REVISE OR REPLACE THE
 * MEDIATEK SOFTWARE AT ISSUE, OR REFUND ANY SOFTWARE LICENSE FEES OR SERVICE
 * CHARGE PAID BY RECEIVER TO MEDIATEK FOR SUCH MEDIATEK SOFTWARE AT ISSUE.
 *
 * The following software/firmware and/or related documentation ("MediaTek
 * Software") have been modified by MediaTek Inc. All revisions are subject to
 * any receiver's applicable license agreements with MediaTek Inc.
 */
#define LOG_TAG	       "libbt-vendor"

#include <errno.h>
#include <fcntl.h>
#include <cutils/log.h>
#include <sys/sysmacros.h>
#include <sys/socket.h>
#include <sys/stat.h>
#include <sys/un.h>

#include "bt_vendor_lib.h"

#define LOG_DBG(f, ...)	ALOGD("%s: " f,  __FUNCTION__, ##__VA_ARGS__)
#define LOG_TRC(f)	ALOGI("%s #%d", __FUNCTION__, __LINE__)

// Functions in libbluetooth_mtk
void set_callbacks(const bt_vendor_callbacks_t* p_cb);
void clean_callbacks(void);
int init_uart(void);
void close_uart(void);
int mtk_fw_cfg(void);
int mtk_sco_cfg(void);
int mtk_prepare_off(void);
void clean_resource(void);

static const char combo_bt_port[] = "/dev/stpbt";
static int bt_fd = -1;
//===============	I N T E R F A C E S      =======================

static int mtk_bt_init(const bt_vendor_callbacks_t* p_cb, unsigned char *local_bdaddr)
{
    LOG_TRC();
    set_callbacks(p_cb);
    return 0;
}

static int mtk_bt_op(bt_vendor_opcode_t opcode, void *param)
{
    int ret = 0,i,j;

    switch(opcode)
    {
      case BT_VND_OP_POWER_CTRL:
	LOG_DBG("BT_VND_OP_POWER_CTRL %d\n", *((int*)param));
	/* DO NOTHING on combo chip */
	break;

      case BT_VND_OP_USERIAL_OPEN:
        LOG_DBG("BT_VND_OP_USERIAL_OPEN\n");
        ((int*)param)[0] = init_uart();
        ret = 1; // CMD/EVT/ACL-In/ACL-Out via the same fd
	break;

      case BT_VND_OP_USERIAL_CLOSE:
	LOG_DBG("BT_VND_OP_USERIAL_CLOSE\n");
	close_uart();
	break;

      case BT_VND_OP_FW_CFG:
	LOG_DBG("BT_VND_OP_FW_CFG\n");
	ret = mtk_fw_cfg();
	break;

      case BT_VND_OP_SCO_CFG:
	LOG_DBG("BT_VND_OP_SCO_CFG\n");
	ret = mtk_sco_cfg();
	break;

      case BT_VND_OP_GET_LPM_IDLE_TIMEOUT:
	LOG_DBG("BT_VND_OP_GET_LPM_IDLE_TIMEOUT\n");
	*((uint32_t*)param) = 5000; //ms
	break;

      case BT_VND_OP_LPM_SET_MODE:
	LOG_DBG("BT_VND_OP_LPM_SET_MODE %d\n", *((uint8_t*)param));
	break;

      case BT_VND_OP_LPM_WAKE_SET_STATE:
	LOG_DBG("BT_VND_OP_LPM_WAKE_SET_STATE\n");
	break;

      case BT_VND_OP_EPILOG:
	LOG_DBG("BT_VND_OP_EPILOG\n");
	ret = mtk_prepare_off();
	break;
/*
      case BT_VND_OP_DRV_READ:
	LOG_DBG("BT_VND_OP_DRV_READ\n");
	i = *((uint16_t*)param);
	ret = TEMP_FAILURE_RETRY(read(bt_fd, param, i));
	break;

      case BT_VND_OP_DRV_WRITE:
	LOG_DBG("BT_VND_OP_DRV_WRITE\n");
	tx_buf_t *t = (tx_buf_t*)param;
	ret = TEMP_FAILURE_RETRY(write(bt_fd, t->data, t->length));
	break;
*/
      default:
	LOG_DBG("Unknown operation %d\n", opcode);
	ret = -1;
	break;
    }

    return ret;
}

static void mtk_bt_cleanup()
{
    LOG_TRC();
    clean_resource();
    clean_callbacks();
    return;
}

const bt_vendor_interface_t BLUETOOTH_VENDOR_LIB_INTERFACE = {
    sizeof(bt_vendor_interface_t),
    mtk_bt_init,
    mtk_bt_op,
    mtk_bt_cleanup
};
