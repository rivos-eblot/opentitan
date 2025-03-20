# Copyright lowRISC contributors (OpenTitan project).
# Licensed under the Apache License, Version 2.0, see LICENSE for details.
# SPDX-License-Identifier: Apache-2.0

package(default_visibility = ["//visibility:public"])

cc_library(
    name = "usbdev_stream",
    srcs = [
        "stream_test.cc",
        "usb_device.cc",
        "usbdev_int.cc",
        "usbdev_iso.cc",
        "usbdev_serial.cc",
        "usbdev_stream.cc",
        "usbdev_utils.cc",
    ],
    hdrs = [
        "stream_test.h",
        "usb_device.h",
        "usbdev_int.h",
        "usbdev_iso.h",
        "usbdev_serial.h",
        "usbdev_stream.h",
        "usbdev_utils.h",
    ],
    # Not a local define since targets that depend on this need to use
    # the same configuration.
    # pkg-config [--cflags|--libs] libusb-1.0
    defines = [
        "STREAMTEST_LIBUSB=1", "_BAZEL\\ -I/opt/homebrew/opt/libusb/include"
    ],
    linkopts = ["-L/opt/homebrew/opt/libusb/lib", "-lusb-1.0"],
)

cc_binary(
    name = "stream_test",
    srcs = ["stream_test.cc"],
    deps = [
        ":usbdev_stream",
    ],
)
