-- Project euler problems in Haskell

module Euler where

import Data.Char
import Data.List

-- Problem 48
p48 :: Int -> Int
p48 n = sum $ map (\x -> x ^ x) [1..n]

-- Problem 16
splitInt :: Int -> [Int]
splitInt n = map digitToInt $ show n

p16 :: Int -> Int
p16 n = sum $ splitInt (2^n)

-- Problem 34
fact :: Int -> Int
fact n = product [1..n]

sumfact :: Int -> Bool
sumfact n = n == (sum $ map fact $ splitInt n)

p34 :: Int -> Int
p34 n = sum $ filter sumfact [4..n]

-- Problem 21

-- compute the list of proper divisors of n
divisors :: Int -> [Int]
divisors n = filter (\x -> rem n x == 0) [1.. div n 2]

amicable :: (Int, Int) -> Bool
amicable (a,b) = (sum (divisors a)) == (sum ( divisors b))

split :: (Int, Int) -> [Int]
split (a,b) = [a,b]

getamicable :: Int -> [Int]
getamicable n = nub . concat . map split $ filter amicable [(a,b) | a <- [1..n], b <- [1..n], a<b]

p21 :: Int -> Int
p21 = sum . getamicable