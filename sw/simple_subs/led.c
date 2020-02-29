// Copyright lowRISC contributors.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0

#include <stdint.h>

int main(int argc, char **argv) {


uint64_t   a = 3994674403;
uint64_t   b = 3132440345;

volatile unsigned int  *var = (volatile unsigned int  *) 0x0000c010;

*var = a-b;  //Subs

return 0;
}
