# Copyright lowRISC contributors (OpenTitan project).
# Licensed under the Apache License, Version 2.0, see LICENSE for details.
# SPDX-License-Identifier: Apache-2.0

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def _lowrisc_repos():
    # BEWARE this toolchain is a bit older than the Linux one (needs to be rebuilt for macOS)
    http_archive(
        name = "lowrisc_rv32imcb_toolchain",
        url = "https://github.com/rivos-eblot/lowrisc-toolchains/releases/download/macos-20250319-1/lowrisc-toolchain-rv32imcb-darwin-arm64-macos-20250319-1.tar.xz",
        strip_prefix = "lowrisc-toolchain-rv32imcb-darwin-arm64-macos-20250319-1",
        build_file = ":BUILD.lowrisc_rv32imcb_toolchain.bazel",
    )

lowrisc_rv32imcb_toolchain = module_extension(
    implementation = lambda _: _lowrisc_repos(),
)
