// Copyright lowRISC contributors.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0

#include <stdint.h>
#include<stdio.h>

#define CLK_FIXED_FREQ_HZ (50ULL * 1000 * 1000)

int main(int argc, char **argv) {


volatile unsigned int  *var = (volatile unsigned int  *) 0x0000c010;

uint64_t  k = 6941;
uint64_t  j = 1455;


// (A*B) % MOD = ((A % MOD) * (B % MOD)) % MOD

 *var = k*j;	


return 0;
}
