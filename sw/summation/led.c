// Copyright lowRISC contributors.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0

#include <stdint.h>
#include<stdio.h>

#define CLK_FIXED_FREQ_HZ (50ULL * 1000 * 1000)

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
      "   bnez %1, 1b           \n" // 3 cycles
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


uint64_t   a = 3994674403;
uint64_t   b = 3132440345;
uint64_t   c = 1234567123;
uint64_t   m = 1000000007;

volatile unsigned int  *var = (volatile unsigned int  *) 0x0000c010;

uint64_t x;

uint64_t  i = 1;
uint64_t  k = 1;
uint64_t  j = 1;


// (A*B) % MOD = ((A % MOD) * (B % MOD)) % MOD

usleep(100);
i = (a%m);
 *var = i;	// 994674382
//printf("i= " "%" PRIu64 "\n",i);


usleep(100);
k = (b%m);	// 132440324
 *var = k;
//printf("k=" "%" PRIu64 "\n",k);

usleep(100);
j= (c%m);	// 234567116
 *var = j;
//printf("j=" "%" PRIu64 "\n",j);


usleep(100);

x = ((((i*k)%m))*j)%m;	// 479501638
*var = x+j;  //SUMMATION

//printf("a*b*c mod m = " "%" PRIu64 "\n",x);

return 0;
}
