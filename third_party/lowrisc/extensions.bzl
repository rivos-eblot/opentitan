# Copyright lowRISC contributors (OpenTitan project).
# Licensed under the Apache License, Version 2.0, see LICENSE for details.
# SPDX-License-Identifier: Apache-2.0

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def _lowrisc_repos():
    http_archive(
        name = "lowrisc_rv32imcb_toolchain",
        url = "file:///Volumes/CaseSensitive/lowrisc-toolchain-gcc-rv32imcb-latest.tar.xz",
        strip_prefix = "lowrisc-toolchain-gcc-rv32imcb-HEAD",
        build_file = ":BUILD.lowrisc_rv32imcb_toolchain.bazel",
    )

lowrisc_rv32imcb_toolchain = module_extension(
    implementation = lambda _: _lowrisc_repos(),
)
