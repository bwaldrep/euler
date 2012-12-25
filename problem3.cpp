#include <iostream>
#include <stdio.h>
#include <cmath>
#include <vector>
#include <map>

using namespace std;

typedef long long int lli;
typedef long int li;
typedef vector<bool> table;

lli compFactor(lli num);
void buildTable(lli cap, table &lookup);
lli firstFactor(lli num);

int main() {

  lli bignum = 600851475143;

  cout << "ANSWER: " << compFactor(bignum) << endl;
  return 0;
}

lli compFactor(lli num) {
  lli prev, ans, current;
  current = num;
  prev = ans = 1;
  while(true) {
    prev = ans;
    ans = firstFactor(current);
    if(!ans) {
      break;
    }
    current = current / ans;
//    printf("num: %lld  current: %lld  ans: %lld  prev: %lld\n", num, current, ans, prev);
  }

  return current;
}


lli firstFactor(lli num) {
  table lookup;
  buildTable(sqrt(num),lookup);
  lli size = lookup.size();
  for(lli i = 3; i < size; i += 2) {
    if(lookup[i] && (num % i == 0)) {
      return i;
    }
  }
  return 0;
}

void buildTable(lli cap, table &lookup) {
  lookup.resize(cap);
  lookup[0] = lookup[1] = false;
  for(lli i = 2; i < cap; i++) {
      lookup[i] = true;
  }
  for(lli i = 2; i < cap; i++) {
      if (lookup[i]) {
        for(lli j = 2 * i; j < cap; j += i) {
            lookup[j] = false;
        }
      }
  }
  return;
}

bool isPrime(lli num, table lookup) {
  lli size = lookup.size();
  if (num < size) {
    return lookup[num];
  }

  lli stop = sqrt(num);
  for(lli i = 3; i < stop; i += 2) {
      if (lookup[i] && (num % i == 0)) {
         return false;
      }
  }
  return true;
}
