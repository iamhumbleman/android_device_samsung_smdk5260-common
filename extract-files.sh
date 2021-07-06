#!/bin/bash
#
# Copyright (C) 2016 The CyanogenMod Project
# Copyright (C) 2018-2021 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

set -e

export DEVICE=m2a3g
export VENDOR=samsung

# for GALAXY S5 only
# function blob_fixup() {
#     case "${1}" in
#         vendor/lib/libsec-ril.*) #GSM 310
#             "${PATCHELF}" --replace-needed libcutils.so libcutils-v29.so \
#                 --replace-needed libprotobuf-cpp-full.so libprotobuf-cpp-full-v23.so \  #radio 299 
#                 --replace-needed libprotobuf-cpp-haxx.so libprotobuf-cpp-full-v23.so \
#                 "${2}"
#             ;;
#     esac
# }

# Load extract_utils and do some sanity checks
MY_DIR="${BASH_SOURCE%/*}"
if [[ ! -d "${MY_DIR}" ]]; then MY_DIR="${PWD}"; fi

LINEAGE_ROOT="${MY_DIR}/../../.."

HELPER="${LINEAGE_ROOT}/vendor/lineage/build/tools/extract_utils.sh"
if [ ! -f "${HELPER}" ]; then
    echo "Unable to find helper script at ${HELPER}"
    exit 1
fi
source "${HELPER}"

if [ $# -eq 0 ]; then
    SRC=adb
else
    if [ $# -eq 1 ]; then
        SRC=$1
    else
        echo "$0: bad number of arguments"
        echo ""
        echo "usage: $0 [PATH_TO_EXPANDED_ROM]"
        echo ""
        echo "If PATH_TO_EXPANDED_ROM is not specified, blobs will be extracted from"
        echo "the device using adb pull."
        exit 1
    fi
fi
export SRC

setup_vendor "${DEVICE}" "${VENDOR}" "${LINEAGE_ROOT}" true 

extract "$MY_DIR"/proprietary-files.txt "$SRC"

"${MY_DIR}/setup-makefiles.sh"
