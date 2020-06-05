# Copyright (C) 2009 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

import common
import re

def FullOTA_InstallEnd(info):
  PatchOEM(info)
  return

def IncrementalOTA_InstallEnd(info):
  PatchOEM(info)
  return

def PatchOEM(info):
  info.script.AppendExtra('mount("ext4", "EMMC", "/dev/block/platform/mtk-msdc.0/by-name/oem", "/oem");')
  info.script.AppendExtra('delete_recursive("/oem/app");')
  info.script.AppendExtra('unmount("/oem");')
  return