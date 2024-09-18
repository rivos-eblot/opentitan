// Copyright lowRISC contributors (OpenTitan project).
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0
//
// Device table API auto-generated by `dtgen`
<%
    from topgen.lib import Name

    device_name = helper.ip.name

    include_guard = "OPENTITAN_DT_{}_H_".format(device_name.upper())
%>\

#ifndef ${include_guard}
#define ${include_guard}

#include "dt/dt_api.h"
#include <stdint.h>

/**
 * List of register blocks.
 *
 * Register blocks are guaranteed to start at 0 and to be consecutively numbered.
 */
${helper.reg_block_enum.render()}

/** Primary register block (associated with the "primary" set of registers that control the IP). */
<%
  default_reg_block_name = (helper.reg_block_enum.name + Name(["primary"])).as_c_enum()
  default_reg_block_value = (helper.reg_block_enum.name + Name.from_snake_case(helper.default_node)).as_c_enum()
%>\
static const ${helper.reg_block_enum.name.as_c_type()} ${default_reg_block_name} = ${default_reg_block_value};

% if helper.has_irqs():
/**
 * List of IRQs.
 *
 * IRQs are guaranteed to be numbered consecutively from 0.
 */
${helper.irq_enum.render()}

% endif
% if helper.has_clocks():
/**
 * List of clock ports.
 *
 * Clock ports are guaranteed to be numbered consecutively from 0.
 */
${helper.clock_enum.render()}

% endif
% if helper.has_signals():
/**
 * List of signals.
 *
 * Signals are guaranteed to be numbered consecutively from 0.
 */
${helper.signal_enum.render()}

% endif
/**
 * Description of an instance.
 *
 * This structure is opaque and should not be accessed directly.
 */
${helper.inst_struct.render()}

/**
 * Get the instance ID of an instance.
 *
 * @param dt Pointer to an instance of ${device_name}.
 * @return The instance ID of that instance.
 */
static inline dt_instance_id_t dt_${device_name}_instance_id(
    const dt_${device_name}_t *dt) {
  return dt->__internal.inst_id;
}

/**
 * Get the register base address of an instance.
 *
 * @param dt Pointer to an instance of ${device_name}.
 * @param reg_block The register block requested.
 * @return The register base address of the requested block.
 */
static inline uint32_t dt_${device_name}_reg_block(
    const dt_${device_name}_t *dt,
    dt_${device_name}_reg_block_t reg_block) {
  return dt->__internal.base_addr[reg_block];
}

/**
 * Get the primary register base address of an instance.
 *
 * This is just a convenience function, equivalent to
 * `dt_${device_name}_reg_block(dt, ${default_reg_block_value})`
 *
 * @param dt Pointer to an instance of ${device_name}.
 * @return The register base address of the primary register block.
 */
static inline uint32_t dt_${device_name}_primary_reg_block(
    const dt_${device_name}_t *dt) {
  return dt->__internal.base_addr[${default_reg_block_value}];
}

% if helper.has_irqs():
/**
 * Get the PLIC ID of a ${device_name} IRQ for a given instance.
 *
 * If the instance is not connected to the PLIC, this function
 * will return `kDtPlicIrqIdNone`.
 *
 * @param dt Pointer to an instance of ${device_name}.
 * @param irq_type A ${device_name} IRQ.
 * @return The PLIC ID of the IRQ of this instance.
 */
static inline dt_plic_irq_id_t dt_${device_name}_irq_to_plic_id(
    const dt_${device_name}_t *dt,
    dt_${device_name}_irq_t irq) {
  if (dt->__internal.first_irq == kDtPlicIrqIdNone) {
    return kDtPlicIrqIdNone;
  }
  return (dt_plic_irq_id_t)((uint32_t)dt->__internal.first_irq + (uint32_t)irq);
}

/**
 * Convert a global IRQ ID to a local ${device_name} IRQ type.
 *
 * @param dt Pointer to an instance of ${device_name}.
 * @param irq A PLIC ID that belongs to this instance.
 * @return The ${device_name} IRQ, or `${helper.irq_enum.name.as_c_enum()}Count`.
 *
 * NOTE This function assumes that the PLIC ID belongs to the instance
 * of ${device_name} passed in parameter. In other words, it must be the case that
 * `dt_${device_name}_instance_id(dt) == dt_plic_id_to_instance_id(irq)`. Otherwise, this function
 * will return `${helper.irq_enum.name.as_c_enum()}Count`.
 */
static inline dt_${device_name}_irq_t dt_${device_name}_irq_from_plic_id(
    const dt_${device_name}_t *dt,
    dt_plic_irq_id_t irq) {
  dt_${device_name}_irq_t count = ${helper.irq_enum.name.as_c_enum()}Count;
  if (irq < dt->__internal.first_irq || irq >= dt->__internal.first_irq + (dt_plic_irq_id_t)count) {
    return count;
  }
  return (dt_${device_name}_irq_t)(irq - dt->__internal.first_irq);
}

%endif
% if helper.has_signals():
/**
 * Get the signal description of an instance.
 *
 * @param dt Pointer to an instance of ${device_name}.
 * @param sig Requested signal.
 * @return Description of the requested signal for this instance.
 */
static inline dt_signal_t dt_${device_name}_signal(
    const dt_${device_name}_t *dt,
    dt_${device_name}_signal_t sig) {
  return dt->__internal.signal[sig];
}
% endif
#endif  // ${include_guard}
