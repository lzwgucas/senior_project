#include <stdio.h>
#include <time.h>
#include <stdlib.h>


static int product[150];
static int product2[150];
static int result[150];
static int ti_2[100];
static int random_keys[318];
volatile int resultkon[1];
//536
int *polymult( *a, int size_a, int *b, int size_b, int mod, int star_mult){


    int line[size_b][size_a + size_b];
    int i,j,k;
    int *return_address1;
    int pola[size_a];
    int polb[size_b];

    //make all line vectors zero
    for (i = 0; i < size_b; ++i){
        for(j = 0; j < size_a + size_b -1; ++j){
            line[i][j] = 0;
            product[j] = 0;
        }
    }

    // make mod calculations
    for (i = 0; i < size_a; ++i){
        pola[i] = a[i];
        while (pola[i] < 0){
            pola[i] = pola[i] + mod;
        }
        pola[i] = pola[i] % mod;
    }


    for (i = 0; i < size_b; ++i){
        polb[i] = b[i];
        while (polb[i] < 0){
            polb[i] = polb[i] + mod;                    ////// burayı yaptıktan sonra moda gerek yok
        }
        polb[i] = polb[i] % mod;
    }

    // make calculations for partial products, if need add mod calculations
    if(star_mult == 1){ 
        for (j = size_b -1; j >= 0; j = j-1){ //0
            for (k = size_a-1; k >= 0; k = k-1 ){
                line[size_b-1-j][k] = pola[k]*polb[j];
            }
        }
    }
    else{
        for (j = size_b -1; j >= 0; j = j-1){ //536
            for (k = size_a-1; k >= 0; k = k-1 ){
                line[size_b-1-j][k + j] = pola[k]*polb[j];
            }
        }
    }

    //mod calculations
    for (i = 0; i < size_b; ++i){
        for(j = 0; j < size_a + size_b -1; ++j){
            line[i][j] = line[i][j] % mod;
        }
    }

    // construct product
    for(j = 0; j < size_a + size_b -1; ++j){
        for(i = 0; i < size_b; ++i){
            product[j] += line[i][j];
        }
    }

    //mod calculations
    for(j = 0; j < size_a + size_b -1; ++j){
        product[j] = product[j] % mod;
    }

    return_address1 = &product[0];

    return return_address1;
}

int *polymult2(int *a, int size_a, int *b, int size_b, int star_mult){//3

    int line[size_b][size_a + size_b];
    int i,j,k;
    int *return_address2;
    int pola[size_a];
    int polb[size_b];

    //make all line vectors zero
    for (i = 0; i < size_b; ++i){
        for(j = 0; j < size_a + size_b -1; ++j){
            line[i][j] = 0;
            product2[j] = 0;
        }
    }

    for(i = 0; i < size_a; ++i){
        pola[i] = a[i];
    }


    for(i = 0; i < size_b; ++i){
        polb[i] = b[i];
    }


    // make calculations for partial products, if need add mod calculations
    if(star_mult == 1){
        for (j = size_b -1; j >= 0; j = j-1){//0
            for (k = size_a-1; k >= 0; k = k-1 ){
                line[size_b-1-j][k] = pola[k]*polb[j];
            }
        }
    }
    else{
        for (j = size_b -1; j >= 0; j = j-1){//3
            for (k = size_a-1; k >= 0; k = k-1 ){
                line[size_b-1-j][k + j] = pola[k]*polb[j];
            }
        }
    }

    // construct product
    for(j = 0; j < size_a + size_b -1; ++j){
        for(i = 0; i < size_b; ++i){
            product2[j] += line[i][j];
        }
    }


    return_address2 = &product2[0];

    return return_address2;
}

int *polydiv(int *num, int size_N, int*denum, int size_D, int mod){ //136

    int u,d,d2,i,b_N,r_d;
    int *return_address3;

    int v[size_N];
    int q[size_N];
    int *product;
    int num_temp[size_N];
    int denum_temp[size_D];


    // make mod calculation for coefficents
    for (i = 0; i < size_N; ++i){
        num_temp[i] = num[i];
        while (num_temp[i] < 0) {
            num_temp[i] = num_temp[i] + mod;
        }
        num_temp[i] = num_temp[i] % mod;
    }


    // make mod calculation for coefficents
    for (i = 0; i < size_D; ++i) {
        denum_temp[i] = denum[i];
        while (denum_temp[i] < 0) {
            denum_temp[i] = denum_temp[i] + mod;
        }
        denum_temp[i] = denum_temp[i] % mod;
    }

    for (i = 0; i < size_N; ++i){
        q[i] = 0;
        v[i] = 0;
    }

    //find b_N (denum) and degree denum
    for (i = size_D-1; i >= 0; i = i-1){
        if( denum_temp[i] != 0 )
            break;
    }
    d2 = i; //f'in derecesi
    b_N = denum_temp[i];

    // Set u := (b_N)^–1 mod p (denum) //
    for (u = 0; u < mod; ++u){
        if ( (b_N*u)%mod == 1 )
            break;
    }

    // find degree num and r_d
    for (i = size_N-1; i >= 0; i = i-1){
        if( num_temp[i] != 0 )
            break;
    }
    d = i;

    r_d = num_temp[d];

    //printf("\nSİL-3\n");
    //printf("\nd2 = %d, d = %d\n",d2,d);

    // While-1 deg num >= deg denum do
    while (d >= d2){ //136

        // Set v := u × r_d × X^(d–N)
        v[(d-d2)] = u*r_d;

        for (i = 0; i < size_N; ++i){
            v[i] = v[i] % mod;
        }

        // v*b
        product = polymult(denum_temp,size_D,v,size_D,mod,0);

        // make mod calculation for coefficents
        for (i = 0; i < size_N; ++i){
            while (product[i] < 0) {
                product[i] = product[i] + mod;
            }
            product[i] = product[i] % mod;
        }

        //r = r- v*b
        for (i = 0; i < size_N; ++i){
            num_temp[i] = num_temp[i] - product[i];
        }

        // make mod calculation for coefficents
        for (i = 0; i < size_N; ++i){
            while (num_temp[i] < 0){
                num_temp[i] = num_temp[i] + mod;
            }
            num_temp[i] = num_temp[i] % mod;
        }

        // q = q + v;
        for(i = 0; i < size_N; ++i){
            q[i] = q[i] + v[i];
            q[i] = q[i] % mod;
        }

        // Set d := deg r(X) (num)
        for (i = size_N-1; i >= 0; i = i-1){
            if( num_temp[i] != 0 )
                break;
        }
        d = i;
        r_d = num_temp[d];

        // make zero for next calculations
        for (i = 0; i < size_N; ++i){
            v[i] = 0;
        }


    } //End While-1

    for(i = 0; i < size_N; ++i){
        result[i] = q[i];
    }
    for(i = size_N; i < (2*size_N); ++i){
        result[i] = num_temp[i-size_N];
    }

    return_address3 = &result[0];

    return return_address3;
}


int* ext_euclid(int* polyR, int* polyf, int size, int mod) {//2

    int *return_address4;
    int N, i, j;
    int ri_2[size]; // MX-ring poly, a
    int ri_1[size]; // f-random poly, f[N] = 0, b
    int ri[size];

    int ti_1[size]; // ti_1[0] = 1
    int ti[size];
    int qi_1[size];
    int temp[size];
    int *res;
    int *res1;
    int *res2;
    int controlR = 1;

    N = size - 1;
    for (i = 0; i < size; ++i) {
        ri_2[i] = polyR[i];
        ri_1[i] = polyf[i];
        ti_2[i] = 0;
        ti_1[i] = 0;
    }
///// ri_2 = polyR      ///////
///// ri_1 = f         //////////
///// ti_2 = ti_1 = 0 /////////

    ti_1[0] = 1;


    while (controlR != 0) {
        //66
        controlR = 0;
        // make mod for ri_2
        for (i = 0; i < N + 1; ++i) {
            while (ri_2[i] < 0) {
                ri_2[i] = ri_2[i] + mod;
            }
            ri_2[i] = ri_2[i] % mod;
        }


        // make mod for ri_1
        for (i = 0; i < N + 1; ++i) {
            while (ri_1[i] < 0) {
                ri_1[i] = ri_1[i] + mod;
            }
            ri_1[i] = ri_1[i] % mod;
        }


        res = polydiv(ri_2, N + 1, ri_1, N + 1, mod);
        for (i = N + 1; i < (2 * N + 2); ++i) {
            ri[i - (N + 1)] = res[i];
        }

/// qi_1 = (ri_2 - ri)/ri_1; ///

        for (i = 0; i < N + 1; ++i) {
            temp[i] = ri_2[i] - ri[i];
        }

        //make mod calc
        for (i = 0; i < N + 1; ++i) {
            while (temp[i] < 0) {
                temp[i] = temp[i] + mod;
            }
            temp[i] = temp[i] % mod;
        }


        res1 = polydiv(temp, N + 1, ri_1, N + 1, mod);
        for (i = 0; i < N + 1; ++i) {
            qi_1[i] = res1[i];
        }


        //make mod calc
        for (i = 0; i < N + 1; ++i) {
            while (qi_1[i] < 0) {
                qi_1[i] = qi_1[i] + mod;
            }
            qi_1[i] = qi_1[i] % mod;
        }


/// ti = ti_2 - qi_1*ti_1; ///

        res2 = polymult(qi_1, N + 1, ti_1, N + 1, mod, 0);
        for (i = 0; i < N + 1; ++i) {
            temp[i] = res2[i];
        }
        // make mod calculations
        for (i = 0; i < N + 1; ++i) {
            while (temp[i] < 0) {
                temp[i] = temp[i] + mod;
            }
            temp[i] = temp[i] % mod;
        }


        for (i = 0; i < N + 1; ++i) {
            ti[i] = ti_2[i] - temp[i];
        }

        for (i = 0; i < N + 1; ++i) {
            while (ti[i] < 0) {
                ti[i] = ti[i] + mod;
            }
            ti[i] = ti[i] % mod;
        }

/// ri_2 = ri_1; ri_1 = ri; ti_2 = ti_1; ti_1 = ti; ///

        for (i = 0; i < N + 1; ++i) {
            ri_2[i] = ri_1[i];
            ri_1[i] = ri[i];
            ti_2[i] = ti_1[i];
            ti_1[i] = ti[i];
            qi_1[i] = 0;
            controlR += ri[i];
        }
    }


        for (j = 0; j < mod; ++j) {
            if (((ri_2[0] * j) % mod) == 1)
                break;
        }


        for (i = 1; i < N; ++i) {
            if (ri_2[i] != 0)
                //	printf("**** GCD of SECRET POL and POLYR is not 1 !! OPERATION INVALID!! PICK ANOTHER RANDOM VALUE !! *****\n");
                break;
        }

        for (i = 0; i < N + 1; ++i) {
            ti_2[i] = (ti_2[i] * j) % mod;        // ti_2[i]*j vardı..
        }


        return_address4 = &ti_2[0];
        return return_address4;
    }




int* generate_keys(int N, int p, int q){ //1

    int f[55] = {-1, 1, 1, 0, -1, 0, 1, 0, 0, 1, -1, -1, 0, 1, 0, -1, 0, 1, 1, 0, 0,  -1, 0, 1, 0, 0, 1, 1, 1,  -1, 0, 1, 0, 0, 1, 1, 1,    -1, 0, 1, 0, 0, 1, 1, 1};
    int g[55] = {-1, 0, 1, 1, 0, 1, 0, 0, -1, 0, -1, -1, 0, 1, 0, -1, 0, 1, 0, 0, 1, -1, 0, 1, 0, 0, 1, -1, 0, 1, 0, 0, 1, -1, 0, 1, 0, 1,   1, 0, 0, 1, -1, 0, 1, 0, 1};

    int *fp;
    int *fq;
    int *fg;
    int *pk;
    int polyR[N+1];
    int i;
    int* return_address5;


    polyR[N] = 1;
    polyR[0] = -1;

    for(i = 1; i < N; ++i){
        polyR[i] = 0;
    }



    for (i = N; i < 55; ++i ){
        f[i] = 0;
        g[i] = 0;
    }
///// F VE G ARRAYLERİNİN SONLARI SIFIRLANDI //////


    for(i = 0; i < N; ++i){
        random_keys[i] = f[i];
    }
    ////RANDOM_KEYS 0-52 ARASI F////

    for(i = N; i < (2*N); ++i){
        random_keys[i] = g[i-N];
    }
    ////RANDOM_KEYS 53-105 ARASI G////

    fp = ext_euclid(polyR, f, (N+1), p);
    ////FP HESAPLANDI////

    for(i = (2*N); i < (3*N); ++i){
        random_keys[i] = fp[i-(2*N)];
    }
    ////RANDOM_KEYS 106-158 ARASI FP////


    fq = ext_euclid(polyR, f, (N+1), q);
    ////FQ HESAPLANDI ////


    for(i = (3*N); i < (4*N); ++i){
        random_keys[i] = fq[i-(3*N)];
    }
    ////RANDOM KEYS 159-211 ARASI FQ ////

    fg = polymult2(fq, N, g, N, 0);
    //// FG HESAPLANDI ////

    for(i = 0; i < (2*N-1); ++i){
        fg[i] = fg[i]*p;
    }

    //// FG = 3FG ////

    pk = polydiv(fg, (2*N-1), polyR, (N+1), q);

    ////PK HESAPLANDI////

    for(i = (4*N); i < (5*N); ++i){
        random_keys[i] = pk[i-(4*N)+(2*N-1)];
    }
    //////// RANDOM KEYS SONU PK  ////////

    for(i = (5*N); i < (6*N+1); ++i){
        random_keys[i] = polyR[i-(5*N)];
    }
    //////// RANDOM KEYS TAŞTI? ARRAY 300LÜK YERE SAHİP AMA 318'E KADAR DOLDURULUYOR? ///////


    return_address5 = &random_keys[0];

    return return_address5;
}


int* ntru_encyrpt(int N, int q, int* message, int* public_key, int* polyR){//1

    int *return_address6;
    int *CT;

    int random_val[48] = { 1, -1, 0, 1, -1, 1, -1, 0,1, 1, 0, -1, 1, -1, 1, 0,1, 1, 0, -1, 1, -1, 1, 0,1, 1, 0, 1, -1, 1, -1, 0, 1, -1, 0, 1, -1, 1, -1, 0,1, 1, 0, -1, 1, -1, 1, 0};
    int *temp;
    int i;


    temp = polymult(public_key,N,random_val,48,q,0);

    /////// PUBLIC_KEY*RANDOM_VALUE ///////

    for(i = 0; i < 48; ++i){
        temp[i] = temp[i] + message[i];
    }

    ////// PUBLIC_KEY*RANDOM_VALUE + MESSAGE ///////

    CT = polydiv(temp,(2*N),polyR,(N+1),q);

    for(i = (2*N); i < (3*N); ++i){
        CT[i-(2*N)] = CT[i];
    }

    ///// YUKARIDAKI IKI ISLEM MODULO OPERASYONU YAPIYOR /////


    return_address6 = &CT[0];
    return return_address6;
}


int* ntru_deceypt(int N, int p, int q, int* secret_key_f, int* secret_key_fp, int* Enc_Message, int* polyR)//1

    int* return_address7;
    int* a;
    int* a2;
    int* c;
    int* c2;
    int i;

    // a = f.e mod q
    a = polymult2(secret_key_f,N,Enc_Message,N,0);
////////	printf("Vector a (f.e) = ");	////////


    a2 = polydiv(a,(2*N),polyR,(N+1),q);
/////////// Vector a2 (f.e modq) /////////

    for(i = (2*N); i < ((2*N)+N); ++i){
        a2[i-(2*N)] = a2[i];
    }

    //centerlifting a2
    for (i = 0; i < N; ++i){
        if(a2[i] <= q/2)//53
            a2[i] = a2[i];
        else//10
            a2[i] = (-1)*(q-a2[i]);
    }


    c = polymult2(secret_key_fp,N,a2,N,0);
/////////"Vector c(fp*a2)//////////


    c2 = polydiv(c,(2*N),polyR,(N+1),p);
    for(i = (2*N); i < ((2*N)+N); ++i){
        c2[i-(2*N)] = c2[i];
    }
    ////////"Vector c2 (decrypted message)/////////

    return_address7 = &c2[0];
    return return_address7;
}

int main(){

    int* Enc_Message;
    int* Dec_Message;
    int* keys;
    int N = 53;
    int p = 3;
    int q = 101;

    int message[48] = {1, 1, 2, 1, 1, 1, 1, 2,1, 1, 0, 1, 1, 2, 1, 0,1, 2, 0, 1, 1, 1, 1, 0,1, 1, 0, 2, 1, 2, 1, 0, 1, 1, 2, 1, 1, 1, 1, 2, 1, 1, 2, 1, 1, 1, 1, 2};
    int public_key[N];
    int secret_key_f[N];
    int secret_key_g[N];	//kullanilmiyor diyor
    int secret_key_fp[N];
    int secret_key_fq[N];	//kullanilmiyor diyor
    int ring_poly[N+1];
    int i;

    clock_t start, end;
    double cpu_time_used;

    // Alice generates public key from her randomly created secret keys.
  //  printf("\nKEY GENERATION STARTED \n");

    resultkon[0] = 0xA;

    start = clock();
    keys = generate_keys(N, p, q);


   // printf("Secret Key f = ");
    for(i = 0; i < N; ++i){
  //      printf(" %d ", keys[i]);
        secret_key_f[i] = keys[i];
    }
  //  printf("\n");

 //   printf("Secret Key g = ");
    for(i = N; i < (2*N); ++i){
 //       printf(" %d ", keys[i]);
        secret_key_g[i-N] = keys[i];
    }
  //  printf("\n");

  //  printf("Secret Key fp = ");
    for(i = (2*N); i < (3*N); ++i){
  //      printf(" %d ", keys[i]);
        secret_key_fp[i-(2*N)] = keys[i];
    }
  //  printf("\n");

 //   printf("Secret Key fq = ");
    for(i = (3*N); i < (4*N); ++i){
 //       printf(" %d ", keys[i]);
        secret_key_fq[i-(3*N)] = keys[i];
    }
 //   printf("\n");

//    printf("Public Key h = ");
    for(i = (4*N); i < (5*N); ++i){
//        printf(" %d ", keys[i]);
        public_key[i-(4*N)] = keys[i];
    }
 //   printf("\n");

 //   printf("Ring Poly = ");
    for(i = (5*N); i < (6*N+1); ++i){
  //      printf(" %d ", keys[i]);
        ring_poly[i-(5*N)] = keys[i];
    }
 //   printf("\nKEY GENERATION FINISHED \n");

    // Bob encrypts message using Alice's public key and sends it to Alice.
  //  printf("\nENCRYPTION STARTED\n");
    Enc_Message = ntru_encyrpt(N, q, message, public_key, ring_poly);
 //   printf("Encyrpted Message = ");
//   for(i = 0; i < N; ++i){
 //       printf(" %d ", Enc_Message[i]);
 //   }
//    printf("\nENCRYPTION FINISHED\n");

    // Alice decrypts the message using her secret keys.
 //   printf("\nDECRYPTION STARTED\n");
    Dec_Message = ntru_deceypt(N, p, q, secret_key_f, secret_key_fp, Enc_Message, ring_poly);
//    printf("Decyrpted Message = ");
//    for(i = 0; i < N; ++i){
//        printf(" %d ", Dec_Message[i]);
//    }
 //   printf("\nDECRYPTION FINISHED\n");

    end = clock();

    cpu_time_used = ((double) (end - start))/CLOCKS_PER_SEC;


    // Comparison and Proof
  //  printf("\nVERIFYING THE OPERATION\n");
   // printf("Original Message = ");
 //   for(i = 0; i < 32; ++i){
//        printf(" %d ", message[i]);
//    }
 //   printf("\n");
    for(i = 0; i < 32; ++i){
        if(!(message[i] == Dec_Message[i])){
 //           printf("!!ERROR!!\n");
            resultkon[0] = 0xB;
            break;	}
        else{
  //          printf("**OPERATION SUCCCESSFUL**\n");
            resultkon[0] = 0xC;}
    }

    printf("RESULT = %d\n",resultkon[0]);
    printf("Time Result = %f clocks\n",cpu_time_used);


    return 0;
}

