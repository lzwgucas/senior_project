#include <stdint.h>

// declaration of the global arrays
int array1[6] = {1,2,3,4,5,6};
int array2[6] = {2,4,6,8,10,12};
int array3[5];

//the function for custom instruction (with additional precomputing commands)
void array_mul(int *a1, int *a2) {

//static unsigned int *a0;

//not: bu instructionda işleme girecek arraylerin boyutlarının eşit ve önceden bilindiği varsayılmaktadır...

  asm volatile(
	".insn r CUSTOM_0, 0x7, 1, %0, %1, %2  \n"   // Bu bir r tipi custom0_rd_rs1_rs2 instruction tanımı. 
						    // (func3 = 0x7 ataması "_rd_rs1_rs2" kısmını belirtiyor.)
						   // (func7 kısmı belirtilen tipte 2^7 farklı instruction tanımlayabilmemizi sağlıyor.)
						  //  R type: .insn r opcode, func3, func7, rd, rs1, rs2
	: "=r"(&a1[0])				 // designation register => a0 variable'ına atılacak
	: "r"(&a1[0]), "r"(&a2[0])			// a1 ve a2 variable'ları compiler tarafından uygun register'lara atılacak

  );
return;
}


void instr_add(unsigned int *a1, unsigned int *a2){


//static unsigned int *a0;

//not: bu instructionda işleme girecek arraylerin boyutlarının eşit ve önceden bilindiği varsayılmaktadır...

    asm volatile(
    ".insn r CUSTOM_0, 0x7, 3, %0, %1, %2  \n"   // Bu bir r tipi custom0_rd_rs1_rs2 instruction tanımı.
    // (func3 = 0x7 ataması "_rd_rs1_rs2" kısmını belirtiyor.)
    // (func7 kısmı belirtilen tipte 2^7 farklı instruction tanımlayabilmemizi sağlıyor.)
    //  R type: .insn r opcode, func3, func7, rd, rs1, rs2
    : "=r"(&a1[0])				 // designation register => a0 variable'ına atılacak
    : "r"(&a1[0]), "r"(&a2[0])			// a1 ve a2 variable'ları compiler tarafından uygun register'lara atılacak

    );
    return;


}
void array_add(int *a1, int *a2, int length) {
int i =0;
    for(i=0;i<(length/3);i++) {
        instr_add((unsigned int*)&a1[3 * i], (unsigned int*)&a2[3*i]);
    }
}

void instr_sub(unsigned int *a1, unsigned int *a2) {

//static unsigned int *a0;

//not: bu instructionda işleme girecek arraylerin boyutlarının eşit ve önceden bilindiği varsayılmaktadır...

    asm volatile(
    ".insn r CUSTOM_0, 0x7, 4, %0, %1, %2  \n"   // Bu bir r tipi custom0_rd_rs1_rs2 instruction tanımı.
    // (func3 = 0x7 ataması "_rd_rs1_rs2" kısmını belirtiyor.)
    // (func7 kısmı belirtilen tipte 2^7 farklı instruction tanımlayabilmemizi sağlıyor.)
    //  R type: .insn r opcode, func3, func7, rd, rs1, rs2
    : "=r"(&a1[0])				 // designation register => a0 variable'ına atılacak
    : "r"(&a1[0]), "r"(&a2[0])			// a1 ve a2 variable'ları compiler tarafından uygun register'lara atılacak

    );
    return;
}
void array_sub(int *a1, int *a2, int length){
int i =0;
    for(i=0;i<(length/3);i++) {
        instr_sub((unsigned int*)&a1[3 * i], (unsigned int*)&a2[3*i]);
    }
}

void instr_equ(unsigned int *a1, unsigned int *a2){

//static unsigned int *a0;

//not: bu instructionda işleme girecek arraylerin boyutlarının eşit ve önceden bilindiği varsayılmaktadır...

    asm volatile(
    ".insn r CUSTOM_0, 0x7, 5, %0, %1, %2  \n"   // Bu bir r tipi custom0_rd_rs1_rs2 instruction tanımı.
    // (func3 = 0x7 ataması "_rd_rs1_rs2" kısmını belirtiyor.)
    // (func7 kısmı belirtilen tipte 2^7 farklı instruction tanımlayabilmemizi sağlıyor.)
    //  R type: .insn r opcode, func3, func7, rd, rs1, rs2
    : "=r"(&a1[0])				 // designation register => a0 variable'ına atılacak
    : "r"(&a1[0]), "r"(&a2[0])			// a1 ve a2 variable'ları compiler tarafından uygun register'lara atılacak

    );
    return;

}
void array_equ(int *a1,int *a2,int length) {
int i = 0;
    for(i=0;i<(length/3);i++) {
        instr_equ((unsigned int*)&a1[3 * i],(unsigned int*) &a2[3*i]);
    }
}

void instr_mod(unsigned int *a1, unsigned int mod) {

    asm volatile(
    ".insn r CUSTOM_0, 0x7, 6, %0, %1, %2  \n"   // Bu bir r tipi custom0_rd_rs1_rs2 instruction tanımı.
    // (func3 = 0x7 ataması "_rd_rs1_rs2" kısmını belirtiyor.)
    // (func7 kısmı belirtilen tipte 2^7 farklı instruction tanımlayabilmemizi sağlıyor.)
    //  R type: .insn r opcode, func3, func7, rd, rs1, rs2
    : "=r"(&a1[0])				 // designation register => a0 variable'ına atılacak
    : "r"(&a1[0]), "r"(mod)			// a1 ve a2 variable'ları compiler tarafından uygun register'lara atılacak

    );
    return;
}
void array_mod(int *a1, int mod,int length){

    ////// bu kod arrayin uzunlugunu ücüncü instruction operand olarak gonderemedigimiz icin var. //////////
    ////// üc sayisi custom modülün dondürdügü eleman sayisindan geliyor. bizim ebob'umuz 3 oldugu icin 3 secildi./////
    ///// ebob(54(N+1),105(N+N-1)) = 3
int i = 0;

    for(i=0;i<(length/3);i++) {
        instr_mod((unsigned int*)&a1[3 * i], (unsigned int)mod);
    }

}

/////////////////////////////////////////////////




int main() {



 //volatile unsigned int  *var = (volatile unsigned int  *) 0x0000c010;

// amacım iki array'i alıp elemental çarpım yapmak! 
// ama arraylerin hepsini register'larda tutmak istemiyorum aslında çünkü çok yer tutuyorlar!
// ideal olan şey iki array'in başlangıç adresini gönderip sonuç arrayinin başlangıç adresini de sonuç olarak göndermek olurdu!

//for(int i=0;i<5;i++){

//array1[i]=array1[i]*array2[i];

//}

volatile unsigned int  *var = (volatile unsigned int  *) 0x0000c010;

*var = 0xDC;

array_add(array1,array2,6); // array1 = {3,6,9,12,15,18}

*var = 0xCC;

array_equ(array1,array2,6); // array1 = {2,4,6,8,10,12}

*var = 0xCB;

array_mul(array1,array2); // array1 = {4,16,36,8,10,12}

*var = 0xBB;

array_sub(array1,array2,6); //  array1 = {2,12,30,0,0,0}

*var = 0xBA;

array_mod(array1,7,6);  // array1 = {2,5,2,0,0,0}

*var = 0xAA;

return 0;
}
