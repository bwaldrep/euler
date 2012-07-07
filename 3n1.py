#!/usr/bin/python

import time
A = {1:1}

def step(n):
    if n not in A:
        if n % 2 == 0:
            A[n] = 1 + step(n/2)
        else:
            A[n] = 1 + step((3*n)+1)
    return A[n]

def maxseq(k):
    A = {}
    A[1] = 1
    max = 0
    ans = 1
    for i in range(1,k+1):
        p = step(i)
        if p > max:
            max = p
            answer = i
    return answer

while(True):
    print("Please enter a maximum value: ")
    k = input()
    t0 = time.time()
    print "Answer: " + str(maxseq(k)) + "  Time: " + str((time.time()-t0))
