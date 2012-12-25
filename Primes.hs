-- Project euler problems in Haskell

module Primes where

primes :: [Int]
primes = 2 : 3 : 5 : filter isPrime [7..]
    where isPrime :: Int -> Bool
          isPrime n = 0 == ( length ( filter (\c -> gcd n c > 1) (candidates n) ) )
          candidates :: Int -> [Int]
          candidates n = takeWhile (< ((sqrt . fromIntegral) n)) primes
