#include <stdio.h>

int main() {
  int primes[2000000];
  int x,i,j,k,acc;

  primes[0] = 1;
  primes[1] = 0;
  for(i = 0; i < 2000000; i++) {
    if(!primes[i]) {
      printf("found prime %d\n", i+1);
      for(j = 1+(2*i); j < 2000000; j +=(i+1)) {
	primes[j] = 1;
      }
    }
  }

  acc = 0;
  for(k = 0; k < 2000000; k++) {
    if(!primes[k])
      acc += (k+1);
  }

  printf("The sum of all primes less than 2,000,000: %d\n", acc);
  return 1;
}
