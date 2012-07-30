#include <iostream>
#include <cmath>
#include <vector>

using namespace std;

typedef long long int lli;
typedef vector<bool> table;

lli compFactor(lli num);
lli firstFactor(lli num, table &lookup);
void buildTable(lli cap, table &lookup);

int main() {
  lli bignum = 600851475143;
  cout << "ANSWER: " << compFactor(bignum) << endl;
  return 0;
}

lli compFactor(lli num) {
  table lookup;
  buildTable(sqrt(num), lookup);
  lli ans = 1;
  lli current = num;
  while(ans = firstFactor(current,lookup)) {
    current = current / ans;
  }
  return current;
}

lli firstFactor(lli num, table &lookup) {
  lli cap = sqrt(num);
  for(lli i = 3; i < cap; i += 2) {
    if (lookup[i] && (num % i == 0)) {
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
    if(lookup[i]) {
      for(lli j = i * 2; j < cap; j += i) {
        lookup[j] = false;
      }
    }
  }
}
