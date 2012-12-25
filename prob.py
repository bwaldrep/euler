# Player A: 9 4-sided die
# Player B: 6 6-sided die

# compute the probability of the sum of player A's die
# being higher than the sum of player B's die

print (9**4) * (6**6)
print (4**9) * (6**6)

def compA():
  A = [0 for k in range(36)]
  for n in xrange(len(A)):
    for a in xrange(1,5):
      for b in xrange(1,5):
        for c in xrange(1,5):
          for d in xrange(1,5):
            for e in xrange(1,5):
              for f in xrange(1,5):
                for g in xrange(1,5):
                  for h in xrange(1,5):
                    val = n + 1 - a - b - c - d - e - f - g - h
                    if (val > 0) and (val < 5):
                      A[n] += 1
  return A

A = compA()
s = float(sum(A))
for i, item in enumerate(A):
	A[i] = item / s

def compB():
  B = [0 for k in range(36)]
  for n in xrange(len(A)):
    for a in xrange(1,7):
      for b in xrange(1,7):
        for c in xrange(1,7):
          for d in xrange(1,7):
            for e in xrange(1,7):
              val = n + 1 - a - b - c - d - e
              if (val > 0) and (val < 7):
              	B[n] += 1
  return B

B = compB()
s = float(sum(B))
for i, item in enumerate(B):
  B[i] = item / s

# compute answer

a = 0.0
for i in range(36):
  for j in range(i):
  	a += A[i] * B[j]
print a

b = 0.0
for i in range(36):
  for j in range(i):
  	b += A[j] * B[i]
print b

t = 0.0
for i in range(36):
  t += A[i] * B[i]
print t

print a + b + t
