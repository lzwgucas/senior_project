#include <stdint.h>

// declaration of the global arrays
unsigned int array1[5] = {1,2,3,4,5};
unsigned int array2[5] = {2,4,6,8,10};
unsigned int array3[5];


int main() {



volatile unsigned int  *var = (volatile unsigned int  *) 0x0000c010;

// amacım iki array'i alıp elemental çarpım yapmak! 
// ama arraylerin hepsini register'larda tutmak istemiyorum aslında çünkü çok yer tutuyorlar!
// ideal olan şey iki array'in başlangıç adresini gönderip sonuç arrayinin başlangıç adresini de sonuç olarak göndermek olurdu!

for(int i=0;i<5;i++){

*var = array1[i]+array2[i];

}

return 0;
}
