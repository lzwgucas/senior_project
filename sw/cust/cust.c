// Copyright lowRISC contributors.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0

#include <stdint.h>

static int custom(unsigned int a1, unsigned int a2) {
  static int a0;
  asm volatile(
	".insn r CUSTOM_0, 0x7, 0, %0, %1, %2  \n"   // Bu bir r tipi custom0_rd_rs1_rs2 instruction tanımı. 
						    // (func3 = 0x7 ataması "_rd_rs1_rs2" kısmını belirtiyor.)
						   // (func7 kısmı belirtilen tipte 2^7 farklı instruction tanımlayabilmemizi sağlıyor.)
						  //  R type: .insn r opcode, func3, func7, rd, rs1, rs2
	: "=r"(a0)				 // designation register => a0 variable'ına atılacak
	: "r"(a1), "r"(a2)			// a1 ve a2 variable'ları compiler tarafından uygun register'lara atılacak

  );
return a0;
}

int main() {


uint64_t   a = 3994674403;
uint64_t   b = 3132440345;
uint64_t   c = 1234567123;
uint64_t   m = 43931;


volatile unsigned int  *var = (volatile unsigned int  *) 0x0000c010;


uint64_t x;

uint64_t  i = 1;
uint64_t  k = 1;
uint64_t  j = 1;


// (A*B) % MOD = ((A % MOD) * (B % MOD)) % MOD


i = custom(a,m);
 *var = i;	// 28573
//printf("i= " "%" PRIu64 "\n",i);


k = custom(b,m);	// 28252
 *var = k;
//printf("k=" "%" PRIu64 "\n",k);

j= custom(c,m);	// 18161
 *var = j;
//printf("j=" "%" PRIu64 "\n",j);


x = custom((custom(i*k,m)*j),m);	// 35599
*var = x;
//printf("a*b*c mod m = " "%" PRIu64 "\n",x);

*var = 0;

i = a % m;
*var = i;	// 28573

k = b % m;	// 28252
*var = k;

j= c % m;	// 18161
*var = j;

x = (((i*k)%m)*j)%m; // 35599
*var = x;

return 0;
}


