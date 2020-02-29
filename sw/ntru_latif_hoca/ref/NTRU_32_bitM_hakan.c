#include <stdio.h>
#include <time.h>
#include <stdlib.h>


static int product[150];
static int product2[150];
static int result[150];
static int ti_2[100];
static int random_keys[300];
volatile int resultkon = 2;
int *polymult(int *a, int size_a, int *b, int size_b, int mod, int star_mult){

//static int product[100]; //must be constant for now because of local return value resctriction, but will chage in the code..
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

	for(i = 0; i < size_a; ++i){
		pola[i] = a[i];
	}

	for(i = 0; i < size_b; ++i){
		polb[i] = b[i];
	}
/*	printf("pola = ");
	for(i = 0; i < size_a; ++i){
		printf(" %d ",pola[i]);
	}
	printf("\n");
	printf("polb = ");
	for(i = 0; i < size_b; ++i){
		printf(" %d ",polb[i]);
	}
	printf("\n");*/

	// make mod calculations
	for (i = 0; i < size_a; ++i){
		while (pola[i] < 0){
			pola[i] = pola[i] + mod;
		}
	}

	for (i = 0; i < size_a; ++i){
		pola[i] = pola[i] % mod;
	}

	for (i = 0; i < size_b; ++i){
		while (polb[i] < 0){
			polb[i] = polb[i] + mod;
		}
	}

	for(i = 0; i < size_b; ++i){
		polb[i] = polb[i] % mod;
	}

	// make calculations for partial products, if need add mod calculations
	if(star_mult == 1){
		for (j = size_b -1; j >= 0; j = j-1){
			for (k = size_a-1; k >= 0; k = k-1 ){
				line[size_b-1-j][k] = pola[k]*polb[j];
			}
		}
	}
	else{
		for (j = size_b -1; j >= 0; j = j-1){
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

/*	printf("\nproduct = [");
	for(i = 0; i< size_a+size_b-1; ++i){
		printf(" %d ",product[i]);
	}
	printf(" ];\n"); */

	return_address1 = &product[0];

return return_address1;
}

int *polymult2(int *a, int size_a, int *b, int size_b, int star_mult){

//static int product2[100]; //must be constant for now because of local return value resctriction, but will chage in the code..
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
	/*//sil
	printf("pola = \n");
	for(i = 0; i < size_a; ++i){
		printf(" %d ",pola[i]);
	}
	printf("\n");*/

	for(i = 0; i < size_b; ++i){
		polb[i] = b[i];
	}
	/*//sil
	printf("polb = \n");
	for(i = 0; i < size_b; ++i){
		printf(" %d ",polb[i]);
	}
	printf("\n");*/

	// make calculations for partial products, if need add mod calculations
	if(star_mult == 1){
		for (j = size_b -1; j >= 0; j = j-1){
			for (k = size_a-1; k >= 0; k = k-1 ){
				line[size_b-1-j][k] = pola[k]*polb[j];
			}
		}
	}
	else{
		for (j = size_b -1; j >= 0; j = j-1){
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

	/*printf("\nproduct2 = [");
	for(i = 0; i< size_a+size_b-1; ++i){
		printf(" %d ",product2[i]);
	}
	printf(" ];\n");*/

	return_address2 = &product2[0];

return return_address2;
}

int *polydiv(int *num, int size_N, int*denum, int size_D, int mod){

int u,d,d2,i,b_N,r_d;
int *return_address3;
//static int result[100];
int v[size_N];
int q[size_N];
int *product;
int numm[size_N];
int denumm[size_D];

	for (i = 0; i < size_N; ++i){
		numm[i] = num[i];
	}

	/*printf("\n");
	printf("num =");
	for (i = 0; i < size_N; ++i){
		printf(" % d",numm[i]);
	}
	printf("\n");	*/

	// make mod calculation for coefficents
	for (i = 0; i < size_N; ++i){
		while (numm[i] < 0)
			numm[i] = numm[i] + mod;
	}
	for (i = 0; i < size_N; ++i){
		numm[i] = numm[i] % mod;
	}

	for (i = 0; i < size_D; ++i){
		denumm[i] = denum[i];
	}

	/*printf("\n");
	printf("denum =");
	for (i = 0; i < size_D; ++i){
		printf(" % d",denumm[i]);
	}
	printf("\n");*/


	// make mod calculation for coefficents
	for (i = 0; i < size_D; ++i){
		while (denumm[i] < 0)
			denumm[i] = denumm[i] + mod;
	}
	for (i = 0; i < size_D; ++i){
		denumm[i] = denumm[i] % mod;
	}

	for (i = 0; i < size_N; ++i){
		q[i] = 0;
	}
	for (i = 0; i < size_N; ++i){
		v[i] = 0;
	}

	//find b_N (denum) and degree denum
	for (i = size_D-1; i >= 0; i = i-1){
		if( !(denumm[i] == 0) )
			break;
	}
	d2 = i;
	b_N = denumm[i];

	// Set u := (b_N)^–1 mod p (denum) //
	for (u = 0; u < mod; ++u){
		if ( (b_N*u)%mod == 1 )
			break;
	}

	// find degree num and r_d
	for (i = size_N-1; i >= 0; i = i-1){
		if( !(numm[i] == 0) )
			break;
	}
	d = i;

	r_d = numm[d];

	//printf("\nSİL-3\n");
	//printf("\nd2 = %d, d = %d\n",d2,d);

	// While-1 deg num >= deg denum do
	while (d >= d2){

		// Set v := u × r_d × X^(d–N)
		v[(d-d2)] = u*r_d;

		for (i = 0; i < size_N; ++i){
			v[i] = v[i] % mod;
		}

		// v*b
		product = polymult(denumm,size_D,v,size_D,mod,0);

		// make mod calculation for coefficents
		for (i = 0; i < size_N; ++i){
			while (product[i] < 0)
				product[i] = product[i] + mod;
		}

		for (i = 0; i < size_N; ++i){
			product[i] = product[i] % mod;
		}

		//r = r- v*b
		for (i = 0; i < size_N; ++i){
			numm[i] = numm[i] - product[i];
		}

		// make mod calculation for coefficents
		for (i = 0; i < size_N; ++i){
			while (numm[i] < 0)
				numm[i] = numm[i] + mod;
		}

		for (i = 0; i < size_N; ++i){
			numm[i] = numm[i] % mod;
		}

		// q = q + v;
		for(i = 0; i < size_N; ++i){
			q[i] = q[i] + v[i];
		}

		for(i = 0; i < size_N; ++i){
			q[i] = q[i] % mod;
		}

		// Set d := deg r(X) (num)
		for (i = size_N-1; i >= 0; i = i-1){
			if( !(numm[i] == 0) )
				break;
		}
		d = i;
		r_d = numm[d];

		// make zero for next calculations
		for (i = 0; i < size_N; ++i){
			v[i] = 0;
		}


	} //End While-1

	for(i = 0; i < size_N; ++i){
		result[i] = q[i];
	}
	for(i = size_N; i < (2*size_N); ++i){
		result[i] = numm[i-size_N];
	}
	/*printf("RESULT = ");
	for(i = 0; i < (2*size_N); ++i){
		printf(" %d ",result[i]);
	}
	printf("\n");*/
	return_address3 = &result[0];

	return return_address3;
}


int* ext_euclid(int* polyR, int* polyf, int size, int mod){

  int* return_address4;
  int N,i,j;
  int ri_2[size]; // MX-ring poly, a
  int ri_1[size]; // f-random poly, f[N] = 0, b
  int ri[size];
//  static int ti_2[100]; // Fp-inverse of f modulo p, Fp[N] = 0 at start
  int ti_1[size]; // ti_1[0] = 1
  int ti[size];
  int qi_1[size];
  int temp[size];
  int *res;
  int *res1;
  int *res2;
  int controlR = 1;

	N = size-1;
	for (i = 0; i < size; ++i){
		ri_2[i] = polyR[i];
	}

	for (i = 0; i < size; ++i){
		ri_1[i] = polyf[i];
	}

	for (i = 0; i < size; ++i){
		ti_2[i] = 0;
	}

	for (i = 1; i < size; ++i){
		ti_1[i] = 0;
	}
	ti_1[0] = 1;


while(!(controlR == 0)){

	controlR = 0;
	// make mod for ri_2
	for(i = 0; i < N+1; ++i){
		while(ri_2[i] < 0){
			ri_2[i] = ri_2[i] +mod;
		}
	}

	for(i = 0; i < N+1; ++i){
		ri_2[i] = ri_2[i] % mod;
	}

	// make mod for ri_1
	for(i = 0; i < N+1; ++i){
		while(ri_1[i] < 0){
			ri_1[i] = ri_1[i] +mod;
		}
	}

	for(i = 0; i < N+1; ++i){
		ri_1[i] = ri_1[i] % mod;
	}

	//printf("\nSİL-1\n");

	//ri = ri_2 % ri_1;
	res = polydiv(ri_2, N+1, ri_1, N+1, mod);
	for(i = N+1; i < (2*N+2); ++i){
		ri[i-(N+1)] = res[i];
	}

	//printf("\nSİL-2\n");

/// qi_1 = (ri_2 - ri)/ri_1; ///

	for(i = 0; i < N+1; ++i){
		temp[i] = ri_2[i] - ri[i];
	}

	//make mod calc
	for(i = 0; i < N+1; ++i){
		while(temp[i] < 0){
			temp[i] = temp[i] + mod;
		}
	}

	for(i = 0; i < N+1; ++i){
		temp[i] = temp[i] % mod;
	}

	res1 = polydiv(temp, N+1, ri_1, N+1, mod);
	for(i = 0; i < N+1; ++i){
		qi_1[i] = res1[i];
	}

	//make mod calc
	for(i = 0; i < N+1; ++i){
		while ( qi_1[i] < 0){
			qi_1[i] = qi_1[i] + mod;
		}
	}

	for(i = 0; i < N+1; ++i){
		qi_1[i] = qi_1[i] % mod;
	}

/// ti = ti_2 - qi_1*ti_1; ///

	res2 = polymult(qi_1,N+1,ti_1,N+1,mod,0);
	for(i = 0; i < N+1; ++i){
		temp[i] = res2[i];
	}

/*	// if deg(qi_1*ti_1) > = deg (ri_2) then qi_1*ti_1 = qi_1*ti_1 % ri_2
	if(!(temp[N] == 0)){
		printf("!!!! WARNING !!!!\n");
	}	*/

	// make mod calculations
	for(i = 0; i < N+1; ++i){
		while ( temp[i] < 0){
			temp[i] = temp[i] + mod;
		}
	}

	for(i = 0; i < N+1; ++i){
		temp[i] = temp[i] % mod;
	}

	for(i = 0; i < N+1; ++i){
		ti[i] = ti_2[i] - temp[i];
	}

	for(i = 0; i < N+1; ++i){
		while ( ti[i] < 0){
			ti[i] = ti[i] + mod;
		}
	}

	for(i = 0; i < N+1; ++i){
		ti[i] = ti[i] % mod;
	}

/// ri_2 = ri_1; ri_1 = ri; ti_2 = ti_1; ti_1 = ti; ///

	for(i = 0; i < N+1; ++i){
		ri_2[i] = ri_1[i];
	}
	for(i = 0; i < N+1; ++i){
		ri_1[i] = ri[i];
	}

	for(i = 0; i < N+1; ++i){
		ti_2[i] = ti_1[i];
	}
	for(i = 0; i < N+1; ++i){
		ti_1[i] = ti[i];
	}

	for(i = 0; i < N+1; ++i){
		qi_1[i] = 0;
	}

	for(i = 0; i < N+1; ++i){
		controlR += ri[i];
	}
}

	for (j = 0; j < mod; ++j){
		if(((ri_2[0]*j) % mod) ==1)
		break;
	}

/*	printf("ri_2 = ");
	for(i = 0; i < N; ++i){
		printf(" %d ",ri_2[i]);
	}
	printf("\n");*/

	for(i = 1; i < N; ++i){
		if(!(ri_2[i] == 0))
		//	printf("**** GCD of SECRET POL and POLYR is not 1 !! OPERATION INVALID!! PICK ANOTHER RANDOM VALUE !! *****\n");
			break;
	}

	for(i = 0; i < N+1; ++i){
		ti_2[i] = (ti_2[i]*j) % mod;
	}
    //sil
   /* printf("ti2 =");
    for(i = 0; i < N+1; ++i){
        printf(" %d ",ti_2[i]);
    }
    printf("\n");*/


    return_address4 = &ti_2[0];
    return return_address4;
}


int* generate_keys(int N, int p, int q){

int f[38] = {-1, 1, 1, 0, -1, 0, 1, 0, 0, 1, -1, -1, 0, 1, 0, -1, 0, 1, 1, 0, 0, -1, 0, 1, 1, 0, 1};
int g[38] = {-1, 0, 1, 1, 0, 1, 0, 0, -1, 0, -1, -1, 0, 1, 0, -1, 0, 1, 0, 0, 1,  1, 0, 1, 0, 1, 1};
//int ff[N];
//int gg[N];
int *fp;
int *fq;
int *fg;
int *pk;
int polyR[N+1];
int i;
int* return_address5;
int val,k;
//static int random_keys[300];

	polyR[N] = 1;
	polyR[0] = -1;

	for(i = 1; i < N; ++i){
		polyR[i] = 0;
	}

/////SONRADAN GELENLER AKLIMA/////
/*for (i = N; i < 38; ++i ){
		f[i] = 0;
		g[i] = 0;
}*/


//////////////////////////////////

	//generate a random value determined by user
/*	printf("Enter a random value very larger than N(%d): \n",N);
	scanf("%d",&val);
	printf("random value = %d\n",val);

	//or use rand function
 // val = rand()%1000;*/
/*	val = 969;

	for(i = 0; i < N; ++i){
		k = (val/(i+1)) % (N+i);
		if(k <= (N+i)/3){
			f[i] =  0;
			g[i] = -1;
		}
		if(k >= (2*(N+i))/3){
			f[i] = 1;
			g[i] = 1;
		}
		else if (k < ((2*(N+i))/3) && k > ((N+i)/3)) {
			f[i] = -1;
			g[i] =  0;
		}
		printf("fi = %d gi = %d\n",f[i],g[i]);
	}
	printf("f = ");
	for(i = 0; i < N; ++i){
		printf(" %d ",f[i]);
	}
	printf("\n");
	printf("g = ");
	for(i = 0; i < N; ++i){
		printf(" %d ",g[i]);
	}
	printf("\n");	*/


	for(i = 0; i < N; ++i){
		random_keys[i] = f[i];
		random_keys[N+i] = g[i];
	}

	fp = ext_euclid(polyR, f, (N+1), p);
	for(i = (2*N); i < (3*N); ++i){
		random_keys[i] = fp[i-(2*N)];
	}

	fq = ext_euclid(polyR, f, (N+1), q);
	for(i = (3*N); i < (4*N); ++i){
		random_keys[i] = fq[i-(3*N)];
	}

   /* //sil
    printf("fq =");
    for(i = 0; i < 11; ++i){
        printf(" %d ", fq[i]);
    }
    printf("\n");
    // sil*/

	fg = polymult2(fq, N, g, N, 0);
	for(i = 0; i < (2*N-1); ++i){
		fg[i] = fg[i]*p;
	}
   /* //sil
    printf("fg =");
    for(i = 0; i < 21; ++i){
        printf(" %d ", fg[i]);
    }
    printf("\n");
    printf("polyr =");
    for(i = 0; i < 12; ++i){
        printf(" %d ", polyR[i]);
    }
    printf("\n");
    // sil*/

	pk = polydiv(fg, (2*N-1), polyR, (N+1), q);
	for(i = (4*N); i < (5*N); ++i){
		random_keys[i] = pk[i-(4*N)+(2*N-1)];
	}
   /* //sil
    printf("pk =");
    for(i = 0; i < 55; ++i){
       // printf(" %d i=%d",pk[i-(4*N)+(2*N-1)],(i-(4*N)+(2*N-1)));
        printf(" %d ", pk[i]);
    }
    printf("\n");
    // sil*/
	for(i = (5*N); i < (6*N+1); ++i){
		random_keys[i] = polyR[i-(5*N)];
	}

	return_address5 = &random_keys[0];
	return return_address5;
}


int* ntru_encyrpt(int N, int q, int* message, int* public_key, int* polyR){

int *return_address6;
int *CT;
//int random_val[N] ;
//int random_val[4] = {-1, -1, 1, 1};
int random_val[32] = { 1, -1, 0, 1, -1, 1, -1, 0,1, 1, 0, -1, 1, -1, 1, 0,1, 1, 0, -1, 1, -1, 1, 0,1, 1, 0, 1, -1, 1, -1, 0};
int *temp;
int i,val,k;

/*	val = rand()%1000;

	for(i = 0; i < N; ++i){
		k = (val/(i+1)) % (N+i);
		if(k <= (N+i)/3){
			random_val[i] =  0;
		}
		if(k >= (2*(N+i))/3){
			random_val[i] =  1;
		}
		else if (k < ((2*(N+i))/3) && k > ((N+i)/3)) {
			random_val[i] = -1;
		}
	//	printf("random_val[i]= %d\n",random_val[i]);
	}*/

	//random_val[4] = {-1, -1, 1, 1};

	temp = polymult(public_key,N,random_val,32,q,0);
	/*printf("PublicKey*Rand = ");
	for(i = 0; i < (2*N); ++i){
		printf(" %d ",temp[i]);
	}
	printf("\n");*/

	for(i = 0; i < 32; ++i){
		temp[i] = temp[i] + message[i];
	}

	/*printf("temp (PK*Rand + M) = ");
	for(i = 0; i < (2*N); ++i){
		printf(" %d ",temp[i]);
	}
	printf("\n");*/

	CT = polydiv(temp,(2*N),polyR,(N+1),q);
	for(i = (2*N); i < (3*N); ++i){
		CT[i-(2*N)] = CT[i];
	}

	return_address6 = &CT[0];
	return return_address6;
}


int* ntru_deceypt(int N, int p, int q, int* secret_key_f, int* secret_key_fp, int* Enc_Message, int* polyR){

int* return_address7;
int* a;
int* a2;
int* c;
int* c2;
int i;

	// a = f.e mod q
	a = polymult2(secret_key_f,N,Enc_Message,N,0);
/*	printf("Vector a (f.e) = ");
	for(i = 0; i < (2*N); ++i){
		printf(" %d ",a[i]);
	}
	printf("\n");*/

	a2 = polydiv(a,(2*N),polyR,(N+1),q);
	//printf("Vector a2 (f.e modq) = ");
	for(i = (2*N); i < ((2*N)+N); ++i){
		a2[i-(2*N)] = a2[i];
	}
	/*for(i = 0; i < N; ++i){
		printf(" %d ",a2[i]);
	}
	printf("\n");*/

	//centerlifting a2
	for (i = 0; i < N; ++i){
		if(a2[i] <= q/2)
			a2[i] = a2[i];
		else
			a2[i] = (-1)*(q-a2[i]);
	}

	/*printf("Vector a2 centerlifted = ");
	for(i = 0; i < N; ++i){
		printf(" %d ",a2[i]);
	}
	printf("\n");*/

	c = polymult2(secret_key_fp,N,a2,N,0);
/*	printf("Vector c(fp*a2) = ");
	for(i = 0; i < (2*N); ++i){
		printf(" %d ",c[i]);
	}
	printf("\n");*/

	c2 = polydiv(c,(2*N),polyR,(N+1),p);
	for(i = (2*N); i < ((2*N)+N); ++i){
		c2[i-(2*N)] = c2[i];
	}
	/*printf("Vector c2 (decrypted message) = ");
	for(i = 0; i < N; ++i){
		printf(" %d ",c2[i]);
	}
	printf("\n");*/

	return_address7 = &c2[0];
	return return_address7;
}

int main(){

int* Enc_Message;
int* Dec_Message;
int* keys;
int N = 37;
int p = 3;
int q = 41;
//int message[11] = {1, 1, 0, 1, 1, 1, 1, 0, 1, 0, 1};
//int message[7] = {1, 0, 1, 0, 1, 1, 1};
int message[32] = {1, 1, 2, 1, 1, 1, 1, 2,1, 1, 0, 1, 1, 2, 1, 0,1, 2, 0, 1, 1, 1, 1, 0,1, 1, 0, 2, 1, 2, 1, 0};
int public_key[N];
int secret_key_f[N];
int secret_key_g[N];
int secret_key_fp[N];
int secret_key_fq[N];
int ring_poly[N+1];
int i;

	// Alice generates public key from her randomly created secret keys.
	printf("\nKEY GENERATION STARTED \n");
	keys = generate_keys(N, p, q);
	printf("Secret Key f = ");
	for(i = 0; i < N; ++i){
		printf(" %d ", keys[i]);
		secret_key_f[i] = keys[i];
	}
 	printf("\n");

	printf("Secret Key g = ");
	for(i = N; i < (2*N); ++i){
		printf(" %d ", keys[i]);
		secret_key_g[i-N] = keys[i];
	}
	printf("\n");

	printf("Secret Key fp = ");
	for(i = (2*N); i < (3*N); ++i){
		printf(" %d ", keys[i]);
		secret_key_fp[i-(2*N)] = keys[i];
	}
	printf("\n");

	printf("Secret Key fq = ");
	for(i = (3*N); i < (4*N); ++i){
		printf(" %d ", keys[i]);
		secret_key_fq[i-(3*N)] = keys[i];
	}
	printf("\n");

	printf("Public Key h = ");
	for(i = (4*N); i < (5*N); ++i){
		printf(" %d ", keys[i]);
		public_key[i-(4*N)] = keys[i];
	}
 	printf("\n");

	printf("Ring Poly = ");
	for(i = (5*N); i < (6*N+1); ++i){
		printf(" %d ", keys[i]);
		ring_poly[i-(5*N)] = keys[i];
	}
	printf("\nKEY GENERATION FINISHED \n");

	// Bob encrypts message using Alice's public key and sends it to Alice.
	printf("\nENCRYPTION STARTED\n");
	Enc_Message = ntru_encyrpt(N, q, message, public_key, ring_poly);
	printf("Encyrpted Message = ");
	for(i = 0; i < N; ++i){
		printf(" %d ", Enc_Message[i]);
	}
	printf("\nENCRYPTION FINISHED\n");

	// Alice decrypts the message using her secret keys.
	printf("\nDECRYPTION STARTED\n");
	Dec_Message = ntru_deceypt(N, p, q, secret_key_f, secret_key_fp, Enc_Message, ring_poly);
	printf("Decyrpted Message = ");
	for(i = 0; i < N; ++i){
		printf(" %d ", Dec_Message[i]);
	}
	printf("\nDECRYPTION FINISHED\n");

	// Comparison and Proof
	printf("\nVERIFYING THE OPERATION\n");
	printf("Original Message = ");
	for(i = 0; i < 32; ++i){
		printf(" %d ", message[i]);
	}
	printf("\n");
	for(i = 0; i < 32; ++i){
		if(!(message[i] == Dec_Message[i])){
			printf("!!ERROR!!\n");
			resultkon = 0;
			break;	}
		else{
			printf("**OPERATION SUCCCESSFUL**\n");
			resultkon = 1;}
	}

	printf("RESULT = %d\n",resultkon);

    return 0;
}
