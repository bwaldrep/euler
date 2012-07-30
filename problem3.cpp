#include <iostream>
#include <cmath>
#include <vector>

using namespace std;

typedef long long int lli;

lli compFactor(lli num);
void buildTable(lli cap, vector<bool> &lookup);

int main() {
  lli bignum = 600851475143;
  cout << "ANSWER: " << compFactor(bignum) << endl;
  return 0;
}

lli compFactor(lli num) {
  // Composite numbers have at least one prime factor
  // less than their square root
  lli cap = sqrt(num);
  // Initialize lookup table
  vector<bool> lookup;
  buildTable(cap,lookup);
  // Find the first prime factor, divide it from the starting
  // number and repeat. If the result is composite it will also
  // have at least one prime factor less than cap. If it doesn't
  // then it is prime and we are done.
  lli current = num;
  for(lli i = 2; i < cap; i++) {
    if(lookup[i] && (i < current) && (current % i == 0)) {
      current = current / i;
      i--; //the sequence of prime factors may contain repeats
    }
  }
  return current;
}

void buildTable(lli cap, vector<bool> &lookup) {
  // Build a lookup table of all primes less
  // than cap using a basic sieve
  lookup.resize(cap);
  lookup[0] = lookup[1] = false;
  for(lli i = 2; i < cap; i++) {
    lookup[i] = true;
  }
  for(lli i = 2; i < cap; i++) {
    if(lookup[i]) {
      for(lli j = i * 2; j < cap; j += i) {
        lookup[j] = false;
      }
    }
  }
}
