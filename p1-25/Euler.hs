-- Project euler problems in Haskell

module Euler where

import EUtil
import Data.Array
import Data.Char
import Data.List
import qualified Data.Map as Map

-- Problem 1
p1 :: Int
p1 = sum $ takeWhile stopcond vals
  where stopcond x = 1000 > x
        vals = filter isMult [1..1000]
        isMult n = mod n 3 == 0 || mod n 5 == 0

-- Problem 2
p2 :: Int
p2 = sum $ takeWhile (\x -> x < 4000000) vals
  where vals = filter (\x -> x `mod` 2 == 0) fibs

-- Problem 12
p12 n = head $ filter (\x -> (divcount x) > 500) [1..n]
    where divcount x = (divs ! x) * (divs ! (x+1))
          divs = divarray n

-- Problem 16
--p16 :: Int -> Int
p16 n = sum $ splitInt (2^n)

-- Problem 21
-- sum all amicable pairs less than n
p21 n = sum [a + b | a <- [2..n-1], let b = divs ! a, amicable a b]
      where divs = divarray n
            amicable a b = a < b && b < n && divs ! b == a
