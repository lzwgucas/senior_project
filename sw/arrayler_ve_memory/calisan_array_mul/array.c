#include <stdint.h>

// declaration of the global arrays
unsigned int array1[5] = {1,2,3,4,5};
unsigned int array2[5] = {2,4,6,8,10};
unsigned int array3[5];

//the function for custom instruction (with additional precomputing commands)
void array_mul(unsigned int *a1, unsigned int *a2) {

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



int main() {



 //volatile unsigned int  *var = (volatile unsigned int  *) 0x0000c010;

// amacım iki array'i alıp elemental çarpım yapmak! 
// ama arraylerin hepsini register'larda tutmak istemiyorum aslında çünkü çok yer tutuyorlar!
// ideal olan şey iki array'in başlangıç adresini gönderip sonuç arrayinin başlangıç adresini de sonuç olarak göndermek olurdu!

//for(int i=0;i<5;i++){

//array1[i]=array1[i]*array2[i];

//}

array_mul(array1,array2);

return 0;
}
