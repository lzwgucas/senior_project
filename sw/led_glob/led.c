// Copyright lowRISC contributors.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0

#include <stdint.h>
#define CLK_FIXED_FREQ_HZ (50ULL * 1000 * 1000)
int glob_array[1];

/**
 * Delay loop executing within 8 cycles on ibex
 */
static void delay_loop_ibex(unsigned long loops) {
  int out; /* only to notify compiler of modifications to |loops| */
  asm volatile(
      "1: nop             \n" // 1 cycle
      "   nop             \n" // 1 cycle
      "   nop             \n" // 1 cycle
      "   nop             \n" // 1 cycle
      "   addi %1, %1, -1 \n" // 1 cycle
      "   bnez %1, 1b     \n" // 3 cycles
      : "=&r" (out)
      : "0" (loops)
  );
}

static int usleep_ibex(unsigned long usec) {
  unsigned long usec_cycles;
  usec_cycles = CLK_FIXED_FREQ_HZ * usec / 1000 / 1000 / 8;

  delay_loop_ibex(usec_cycles);
  return 0;
}

static int usleep(unsigned long usec) {
  return usleep_ibex(usec);
}

int main(int argc, char **argv) {
  // Any data written to the stack segment will connect the lowest four bits to
  // the board leds


  while (1) {
    glob_array[0] = 0xa;
    *var = glob_array[0];
    usleep(1000 * 1000); // 1000 ms
    glob_array[0] = 0x5;
    *var = glob_array[0];
    usleep(1000 * 1000); // 1000 ms
  }
}