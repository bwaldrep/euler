-- Project euler problems in Haskell

module Euler where

import Data.Array
import Data.Char
import Data.List
import qualified Data.Map as Map

-- Problem 48
p48 :: Int -> Int
p48 n = sum $ map (\x -> x ^ x) [1..n]

-- Problem 16
-- split an integer into a list of its digits in base 10
splitInt :: Int -> [Int]
splitInt n = map digitToInt $ show n

p16 :: Int -> Int
p16 n = sum $ splitInt (2^n)

-- Problem 34
fact :: Int -> Int
fact n = product [1..n]

-- compute the sum of the factorial of each digit in n
sumfact :: Int -> Bool
sumfact n = n == (sum $ map fact $ splitInt n)

p34 :: Int -> Int
p34 n = sum $ filter sumfact [4..n]

-- Problem 21
-- compute the list of proper divisors of n
divisors :: Int -> [Int]
divisors n = filter (\x -> 0 == rem n x) [1.. div n 2]

-- creates an array of size n, where the i'th value is the sum of i's divisors
divarray :: Int -> Array Int Int
divarray n = array (1,n) [(i,(sum . divisors) i) | i <- [1..n]]

-- sum all amicable pairs less than n
p21 n = sum [a + b | a <- [2..n-1], let b = divs ! a, amicable a b]
      where divs = divarray n
            amicable a b = a < b && b < n && divs ! b == a

-- Problem 12
-- Far too slow, need to redo
-- list of all triangle numbers
--trinums = scanl (+) 1 [2..]

--p12 = head $ filter (\x -> (length . divisors) x > 500) trinums
