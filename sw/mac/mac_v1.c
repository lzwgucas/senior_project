// Copyright lowRISC contributors.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0

#include <stdint.h>

static int custom(unsigned int a1, unsigned int a2, unsigned int a3) {
 static int a0;
   uintptr_t *addr_1 =  &a1;
   uintptr_t *addr_2 = &a2;
   uintptr_t *addr_3 =  &a3;
   uintptr_t *global_array[3] = {addr_1,addr_2,addr_3};
   uintptr_t **array_addr = &global_array[0];
 static int length = sizeof(global_array)/4;

  asm volatile(
	".insn r CUSTOM_0, 0x7, 1, %0, %1, %2  \n"   // Bu bir r tipi custom0_rd_rs1_rs2 instruction tanımı. 
						    // (func3 = 0x7 ataması "_rd_rs1_rs2" kısmını belirtiyor.)
						   // (func7 kısmı belirtilen tipte 2^7 farklı instruction tanımlayabilmemizi sağlıyor.)
						  //  R type: .insn r opcode, func3, func7, rd, rs1, rs2
	: "=r"(a0)				 // designation register => a0 variable'ına atılacak
	: "r"(array_addr), "r"(length)			// a1 ve a2 variable'ları compiler tarafından uygun register'lara atılacak

  );
return a0;
}


unsigned int   a = 39467;
unsigned int   b = 31325;
unsigned int   c = 12313;

uintptr_t *global_array[3];

int main() {



volatile unsigned int  *var = (volatile unsigned int  *) 0x0000c010;


// (a+b)*c :: HEDEF! cevap = 871661896

// unsigned int sonuc = a+b+c;
*var = custom(a,b,c);


return 0;
}


