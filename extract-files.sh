#!/bin/sh
#
# Copyright (C) 2017 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

VENDOR=google
DEVICE=sprout

BASE=../../../vendor/$VENDOR/$DEVICE/proprietary
rm -rf $BASE/*

if [ -z "$2" ]; then
    ZIPFILE=../../../${DEVICE}_update.zip
else
    ZIPFILE=$2
fi

if [ "$1" = "unzip" -a ! -e $ZIPFILE ]; then
    echo $ZIPFILE does not exist.
else
    for FILE in `cat proprietary-files.txt | grep -v ^# | grep -v ^$`; do
        DIR=`dirname $FILE`
	if [ ! -d $BASE/$DIR ]; then
            mkdir -p $BASE/$DIR
	fi
	if [ "$1" = "unzip" ]; then
            unzip -j -o $ZIPFILE $FILE -d $BASE/$DIR
	else
            adb pull $FILE $BASE/$FILE
	fi
    done
fi
./setup-makefiles.sh
