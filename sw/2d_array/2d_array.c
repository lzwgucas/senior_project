#include <stdint.h>

// declaration of the global arrays
int line[6][10] ;
int product[10];

//the function for custom instruction (with additional precomputing commands)

/*
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

}*/

void two_d_array(int* a1, int mod, int length){
	int i;
	for(i = 0; i<length;i++){
		a1[i] = a1[i]%mod;
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

//volatile unsigned int  *var = (volatile unsigned int  *) 0x0000c010;

int size_b = 6;
int size_a = 5; 

//*var = 0xDC;
int i,j;

 for (i = 0; i < size_b; ++i){
        for(j = 0; j < size_a + size_b -1; ++j){
            line[i][j] = i*j;
            product[j] = j;
        }
    }

for(i = 0; i<size_b; i++)
   {
     printf("\n");
     for(j = 0; j<size_b+size_a-1; j++)
     {
       printf("%d\t", line[i][j]);
     }
   }

for(i =0; i<size_b;++i){
two_d_array(line[i],3,size_a+size_b-1);
}
printf("------------------------------------------------------------");
for(i = 0; i<size_b; i++)
   {
     printf("\n");
     for(j = 0; j<size_b+size_a-1; j++)
     {
       printf("%d\t", line[i][j]);
     }
   }
return 0;
}
