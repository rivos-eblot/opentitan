// Copyright lowRISC contributors.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0
//
// tl_main package generated by `tlgen.py` tool

package tl_main_pkg;

  localparam logic [31:0] ADDR_SPACE_RV_DM__REGS          = 32'h 41200000;
  localparam logic [31:0] ADDR_SPACE_RV_DM__MEM           = 32'h 00010000;
  localparam logic [31:0] ADDR_SPACE_ROM_CTRL0__ROM       = 32'h 00008000;
  localparam logic [31:0] ADDR_SPACE_ROM_CTRL0__REGS      = 32'h 411e0000;
  localparam logic [31:0] ADDR_SPACE_ROM_CTRL1__ROM       = 32'h 00050000;
  localparam logic [31:0] ADDR_SPACE_ROM_CTRL1__REGS      = 32'h 41210000;
  localparam logic [1:0][31:0] ADDR_SPACE_PERI                 = {
    32'h 40400000,
    32'h 40000000
  };
  localparam logic [31:0] ADDR_SPACE_SPI_HOST0            = 32'h 40300000;
  localparam logic [31:0] ADDR_SPACE_SPI_HOST1            = 32'h 40310000;
  localparam logic [31:0] ADDR_SPACE_USBDEV               = 32'h 40320000;
  localparam logic [31:0] ADDR_SPACE_FLASH_CTRL__CORE     = 32'h 41000000;
  localparam logic [31:0] ADDR_SPACE_FLASH_CTRL__PRIM     = 32'h 41008000;
  localparam logic [31:0] ADDR_SPACE_FLASH_CTRL__MEM      = 32'h 20000000;
  localparam logic [31:0] ADDR_SPACE_HMAC                 = 32'h 41110000;
  localparam logic [31:0] ADDR_SPACE_KMAC                 = 32'h 41120000;
  localparam logic [31:0] ADDR_SPACE_AES                  = 32'h 41100000;
  localparam logic [31:0] ADDR_SPACE_ENTROPY_SRC          = 32'h 41160000;
  localparam logic [31:0] ADDR_SPACE_CSRNG                = 32'h 41150000;
  localparam logic [31:0] ADDR_SPACE_EDN0                 = 32'h 41170000;
  localparam logic [31:0] ADDR_SPACE_EDN1                 = 32'h 41180000;
  localparam logic [31:0] ADDR_SPACE_RV_PLIC              = 32'h 48000000;
  localparam logic [31:0] ADDR_SPACE_OTBN                 = 32'h 41130000;
  localparam logic [31:0] ADDR_SPACE_KEYMGR               = 32'h 41140000;
  localparam logic [31:0] ADDR_SPACE_RV_CORE_IBEX__CFG    = 32'h 411f0000;
  localparam logic [31:0] ADDR_SPACE_SRAM_CTRL_MAIN__REGS = 32'h 411c0000;
  localparam logic [31:0] ADDR_SPACE_SRAM_CTRL_MAIN__RAM  = 32'h 10000000;
  localparam logic [31:0] ADDR_SPACE_SRAM_CTRL_MBOX__REGS = 32'h 411d0000;
  localparam logic [31:0] ADDR_SPACE_SRAM_CTRL_MBOX__RAM  = 32'h 11000000;

  localparam logic [31:0] ADDR_MASK_RV_DM__REGS          = 32'h 00000003;
  localparam logic [31:0] ADDR_MASK_RV_DM__MEM           = 32'h 00000fff;
  localparam logic [31:0] ADDR_MASK_ROM_CTRL0__ROM       = 32'h 00007fff;
  localparam logic [31:0] ADDR_MASK_ROM_CTRL0__REGS      = 32'h 0000007f;
  localparam logic [31:0] ADDR_MASK_ROM_CTRL1__ROM       = 32'h 0000ffff;
  localparam logic [31:0] ADDR_MASK_ROM_CTRL1__REGS      = 32'h 0000007f;
  localparam logic [1:0][31:0] ADDR_MASK_PERI                 = {
    32'h 003fffff,
    32'h 001fffff
  };
  localparam logic [31:0] ADDR_MASK_SPI_HOST0            = 32'h 0000003f;
  localparam logic [31:0] ADDR_MASK_SPI_HOST1            = 32'h 0000003f;
  localparam logic [31:0] ADDR_MASK_USBDEV               = 32'h 00000fff;
  localparam logic [31:0] ADDR_MASK_FLASH_CTRL__CORE     = 32'h 000001ff;
  localparam logic [31:0] ADDR_MASK_FLASH_CTRL__PRIM     = 32'h 0000007f;
  localparam logic [31:0] ADDR_MASK_FLASH_CTRL__MEM      = 32'h 000fffff;
  localparam logic [31:0] ADDR_MASK_HMAC                 = 32'h 00000fff;
  localparam logic [31:0] ADDR_MASK_KMAC                 = 32'h 00000fff;
  localparam logic [31:0] ADDR_MASK_AES                  = 32'h 000000ff;
  localparam logic [31:0] ADDR_MASK_ENTROPY_SRC          = 32'h 000000ff;
  localparam logic [31:0] ADDR_MASK_CSRNG                = 32'h 0000007f;
  localparam logic [31:0] ADDR_MASK_EDN0                 = 32'h 0000007f;
  localparam logic [31:0] ADDR_MASK_EDN1                 = 32'h 0000007f;
  localparam logic [31:0] ADDR_MASK_RV_PLIC              = 32'h 07ffffff;
  localparam logic [31:0] ADDR_MASK_OTBN                 = 32'h 0000ffff;
  localparam logic [31:0] ADDR_MASK_KEYMGR               = 32'h 000000ff;
  localparam logic [31:0] ADDR_MASK_RV_CORE_IBEX__CFG    = 32'h 000007ff;
  localparam logic [31:0] ADDR_MASK_SRAM_CTRL_MAIN__REGS = 32'h 0000001f;
  localparam logic [31:0] ADDR_MASK_SRAM_CTRL_MAIN__RAM  = 32'h 0000ffff;
  localparam logic [31:0] ADDR_MASK_SRAM_CTRL_MBOX__REGS = 32'h 0000001f;
  localparam logic [31:0] ADDR_MASK_SRAM_CTRL_MBOX__RAM  = 32'h 00000fff;

  localparam int N_HOST   = 3;
  localparam int N_DEVICE = 28;

  typedef enum int {
    TlRvDmRegs = 0,
    TlRvDmMem = 1,
    TlRomCtrl0Rom = 2,
    TlRomCtrl0Regs = 3,
    TlRomCtrl1Rom = 4,
    TlRomCtrl1Regs = 5,
    TlPeri = 6,
    TlSpiHost0 = 7,
    TlSpiHost1 = 8,
    TlUsbdev = 9,
    TlFlashCtrlCore = 10,
    TlFlashCtrlPrim = 11,
    TlFlashCtrlMem = 12,
    TlHmac = 13,
    TlKmac = 14,
    TlAes = 15,
    TlEntropySrc = 16,
    TlCsrng = 17,
    TlEdn0 = 18,
    TlEdn1 = 19,
    TlRvPlic = 20,
    TlOtbn = 21,
    TlKeymgr = 22,
    TlRvCoreIbexCfg = 23,
    TlSramCtrlMainRegs = 24,
    TlSramCtrlMainRam = 25,
    TlSramCtrlMboxRegs = 26,
    TlSramCtrlMboxRam = 27
  } tl_device_e;

  typedef enum int {
    TlRvCoreIbexCorei = 0,
    TlRvCoreIbexCored = 1,
    TlRvDmSba = 2
  } tl_host_e;

endpackage
