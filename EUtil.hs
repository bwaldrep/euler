-- Project euler problems in Haskell

module EUtil where

import Data.Array
import Data.Char
import Data.List
import qualified Data.Map as Map

-- split an integer into a list of its digits in base 10
splitInt n = map digitToInt $ show n

-- compute the sum of the factorial of each digit in n
sumDigitFact :: Int -> Bool
sumDigitFact n = n == (sum $ map fact $ splitInt n)
  where fact x = product [1..x]

-- compute the list of proper divisors of n
divisors :: Int -> [Int]
divisors n = filter (\x -> 0 == rem n x) [1.. div n 2]

-- creates an array of size n, where the i'th value is the sum of i's divisors
divarray :: Int -> Array Int Int
divarray n = array (1,n) [(i,(sum . divisors) i) | i <- [1..n]]

-- Useful infinite lists
fibs :: [Int]
fibs = 0 : 1 : zipWith (+) fibs (tail fibs)
trinums :: [Int]
trinums = map (\n -> round((n * (n+1))/2)) [1..]
pennums :: [Int]
pennums = map (\n -> round((n * ((3*n)-1))/2)) [1..]
hexnums :: [Int]
hexnums = map (\n -> round(n*((2*n)-1))) [1..]

-- lazy intersection that works with sorted infinite lists
infintersect :: [Int] -> [Int] -> [Int]
infintersect (a:as) (b:bs) = if a == b then a : infintersect as bs else 
                             if a < b then infintersect as (b:bs)
                             else infintersect (a:as) bs
infintersect _ _ = []

-- reverse the digits of an integer
revnum :: Integer -> Integer
revnum n = read $ reverse . show $ n

-- returns true if integer is a palindrome
palindrome :: Integer -> Bool
palindrome n = n == revnum n
