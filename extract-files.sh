#!/bin/bash
#
# Copyright (C) 2016 The CyanogenMod Project
# Copyright (C) 2017-2020 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

function blob_fixup() {
    case "${1}" in
        vendor/lib/hw/audio.primary.kona.so)
            # Before
            # 07 ad 01 eb  # bl         __android_log_print
            # 52 b0 01 eb  # bl         send_haptic_data_to_xlog
            # After
            # 07 ad 01 eb  # bl         __android_log_print
            # 00 f0 20 e3  # nop
            sed -i 's|\x07\xad\x01\xeb\x52\xb0\x01\xeb|\x07\xad\x01\xeb\x00\xf0\x20\xe3|g' "${2}"

            # Before
            # 53 b0 01 eb  # bl         send_EarsCompensation_dailyuse_to_xlog
            # 56 b0 01 eb  # bl         send_EarsCompensation_to_xlog
            # After
            # 00 f0 20 e3  # nop
            # 00 f0 20 e3  # nop
            sed -i 's|\x53\xb0\x01\xeb\x56\xb0\x01\xeb|\x00\xf0\x20\xe3\x00\xf0\x20\xe3|g' "${2}"

            # Before
            # 04 10 a0 e1  # cpy        r1,r4
            # 57 b0 01 eb  # bl         send_music_playback_to_xlog
            # After
            # 04 10 a0 e1  # cpy        r1,r4
            # 00 f0 20 e3  # nop
            sed -i 's|\x04\x10\xa0\xe1\x57\xb0\x01\xeb|\x04\x10\xa0\xe1\x00\xf0\x20\xe3|g' "${2}"

            # Before
            # 18 10 90 e5  # ldr        r1,[r0,#0x18]
            # 58 b0 01 eb  # bl         send_misound_data_to_xlog
            # After
            # 18 10 90 e5  # ldr        r1,[r0,#0x18]
            # 00 f0 20 e3  # nop
            sed -i 's|\x18\x10\x90\xe5\x58\xb0\x01\xeb|\x18\x10\x90\xe5\x00\xf0\x20\xe3|g' "${2}"
            ;;
    esac
}

# If we're being sourced by the common script that we called,
# stop right here. No need to go down the rabbit hole.
if [ "${BASH_SOURCE[0]}" != "${0}" ]; then
    return
fi

set -e

export DEVICE=lmi
export DEVICE_COMMON=sm8250-common
export VENDOR=xiaomi

"./../../${VENDOR}/${DEVICE_COMMON}/extract-files.sh" "$@"
