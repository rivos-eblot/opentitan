# OpenTitan

![OpenTitan logo](https://docs.opentitan.org/doc/opentitan-logo.png)

## About the project

[OpenTitan](https://opentitan.org) is an open source silicon Root of Trust
(RoT) project.  OpenTitan will make the silicon RoT design and implementation
more transparent, trustworthy, and secure for enterprises, platform providers,
and chip manufacturers.  OpenTitan is administered by [lowRISC
CIC](https://www.lowrisc.org) as a collaborative project to produce high
quality, open IP for instantiation as a full-featured product. See the
[OpenTitan site](https://opentitan.org/) and [OpenTitan
docs](https://opentitan.org/book) for more information about the project.

## About this repository

This repository contains hardware, software and utilities written as part of the
OpenTitan project. It is structured as monolithic repository, or "monorepo",
where all components live in one repository. It exists to enable collaboration
across partners participating in the OpenTitan project.

## Documentation

The project contains comprehensive documentation of all IPs and tools. You can
access it [online at docs.opentitan.org](https://docs.opentitan.org/).

## How to contribute

Have a look at [CONTRIBUTING](CONTRIBUTING.md) and our [documentation on
project organization and processes](./doc/project_governance/README.md)
for guidelines on how to contribute code to this repository.

## Licensing

Unless otherwise noted, everything in this repository is covered by the Apache
License, Version 2.0 (see [LICENSE](https://github.com/lowRISC/opentitan/blob/master/LICENSE) for full text).

## MacOS dependencies

### from AppStore

- [Xcode][1] (full IDE version).
  Unfortunately, Command Line Tools are not enough, as a bug in GoogleTest selects a very old Mac
  toolchain version which seems to lack proper C++ headers.

### Homebrew

#### Install brew

````sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
````

#### Install packages

````sh
brew install gcc gnu-tar libelf libftdi llvm make ncurses pkg-config srecord verilator wget
````
- `make` is used with FuseSoc
- `llvm` is used as the main native toolchain, as the version that comes with LLVM has a specific
  C preprocessor that is incompatible with Bazel rules used in this project,
- `srecord` is used to generate VMEM files from ELF files,
- `verilator` is used for simulation and wave generation. Homebrew uses current c5 series, which is
  compatible with minor command line changes with the old 4.x series used in this project,
- `libftdi` is used to communicate with FTDI devices from the `opentitantool`.

### macOS quircks

For some reason, `sha256sum` utility is stored in the `/sbin` directory, so we either need to create
a symlink to `/sbin/sha256sum` from a user-reachable directory or add `/sbin` to the PATH
environment variable.

````sh
sudo ln -s /sbin/sha256sum /usr/local/bin/sha256sum
````

### Bazel

##### Install bazelisk

````sh
wget https://github.com/bazelbuild/bazelisk/releases/download/v1.25.0/bazelisk-darwin-arm64
sudo mv bazelisk-darwin-arm64 /usr/local/bin/bazelisk
sudo chmod +x /usr/local/bin/bazelisk
````

### Rust

(I'm not sure if this step is required)

#### Install rust

````sh
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
````

### Building

When building tests, etc. bitstream generation needs to be disabled, as Vivado tools are not
available on macOS.

The following option needs to be added to the bazel command line: `--define bitstream=skip`

### Test

#### Build a test application for simulation and verilate it

````sh
bazelisk test -s //sw/device/tests:spi_host_irq_test_sim_verilator \
    --test_output=streamed --test_timeout=10000 --test_verbose_timeout_warnings\
    --verbose_failures --cache_test_results=no \
    --//hw:make_options=-j,12
````

- `make_options` is only used to speed up the build process and takes advantage of the multiple
  cores available on the Mac machine. The best value can be retrieved with `sysctl -n hw.ncpu`.
