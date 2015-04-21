/*
 * Copyright (C) 2014 The CyanogenMod Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package com.android.internal.telephony;

import static com.android.internal.telephony.RILConstants.*;
import android.content.Context;
import android.os.AsyncResult;
import android.os.HandlerThread;
import android.os.Message;
import android.os.Parcel;
import android.os.SystemProperties;
import android.telephony.Rlog;
import android.telephony.SignalStrength;

import com.android.internal.telephony.uicc.IccConstants;
import com.android.internal.telephony.uicc.IccIoResult;

public class SproutRIL extends RIL implements CommandsInterface {

    public SproutRIL(Context context, int networkMode, int cdmaSubscription) {
	    super(context, networkMode, cdmaSubscription, null);
    }

    public SproutRIL(Context context, int networkMode, int cdmaSubscription, Integer instanceId) {
	    super(context, networkMode, cdmaSubscription, instanceId);
    }

    private byte[] stringToBcd(String input) {
    int len = input.length();
    byte[] result = new byte[(len + 1) / 2];
    int pos = 0;
    for (int i = 0; i < len; i++) {
        int value = ((int) input.charAt(i)) - '0';
        if ((i & 1) != 0) {
            int temp = (result[pos] & 0xf) | ((value & 0xf) << 4);
            result[pos] = (byte)temp;
            pos++;
        } else {
            int temp = (0xf0 | (value & 0xf));
            result[pos] = (byte)temp;
        }
    }
    return result;
}

    @Override
    public void
    iccIOForApp (int command, int fileid, String path, int p1, int p2, int p3,
            String data, String pin2, String aid, Message result) {
        if (fileid == IccConstants.EF_ICCID) {
            String iccId = SystemProperties.get("ril.iccid.sim" + (mInstanceId + 1));
            byte lenLow = (byte) (iccId.length() >> 8);
            byte lenHigh = (byte) (iccId.length() & 0xff);
            byte[] payload = {0, 0, lenHigh, lenLow, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0};
                if(p3==0)
                    AsyncResult.forMessage(result, new IccIoResult(0x90, 0, payload), null);
                else
                    AsyncResult.forMessage(result, new IccIoResult(0x90, 0, stringToBcd(iccId)), null);
            result.sendToTarget();
            return;
        }
        //Note: This RIL request has not been renamed to ICC,
        //       but this request is also valid for SIM and RUIM
        RILRequest rr
                = RILRequest.obtain(RIL_REQUEST_SIM_IO, result);

        rr.mParcel.writeInt(command);
        rr.mParcel.writeInt(fileid);
        rr.mParcel.writeString(path);
        rr.mParcel.writeInt(p1);
        rr.mParcel.writeInt(p2);
        rr.mParcel.writeInt(p3);
        rr.mParcel.writeString(data);
        rr.mParcel.writeString(pin2);
        rr.mParcel.writeString(aid);

        if (RILJ_LOGD) riljLog(rr.serialString() + "> iccIO: "
                + requestToString(rr.mRequest)
                + " 0x" + Integer.toHexString(command)
                + " 0x" + Integer.toHexString(fileid) + " "
                + " path: " + path + ","
                + p1 + "," + p2 + "," + p3
                + " aid: " + aid);

        send(rr);
    }	
}
