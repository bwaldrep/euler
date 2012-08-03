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
p12 n = head $ filter (\x -> (divcount x) > 500) [1..n]
    where divcount x = (divs ! x) * (divs ! (x+1))
          divs = divarray n

-- Problem 28
p28 :: Integer -> Integer
p28 n = 1 + ( sum ( map getbox [1..(n-3)] ))
      where getbox x = (4 * (oddsquare x)) - (12 * x)
            oddsquare x = ((2 * x) + 1) ^ 2

-- Problem 29
p29 = length . nub $ [a^b | a <- [2..100], b <- [2..100]]

-- Problem 30
p30 n = sum $ filter cond [2..n]
    where cond n = n == sum  (map (\x -> x^5)  (splitInt n))

-- Problem 45
trinums = map (\n -> round((n * (n+1))/2)) [1..]
pennums = map (\n -> round((n * ((3*n)-1))/2)) [1..]
hexnums = map (\n -> round(n*((2*n)-1))) [1..]

-- lazy intersection that works with sorted infinite lists
infintersect :: [Int] -> [Int] -> [Int]
infintersect (a:as) (b:bs) = if a == b then a : infintersect as bs else 
                             if a < b then infintersect as (b:bs)
                             else infintersect (a:as) bs
infintersect _ _ = []

p45 :: Int
p45 = head $ filter (> 40755) combo
    where combo = infintersect trinums combo2
          combo2 = infintersect pennums hexnums

-- Problem 55
revnum :: Integer -> Integer
revnum n = read $ reverse . show $ n

palindrome :: Integer -> Bool
palindrome n = n == revnum n

lychrel :: Integer -> Integer -> Bool
lychrel 0 _ = True
lychrel i n = (not . palindrome) n && lychrel (i-1) (n + revnum n)

p55 :: Integer -> Int
p55 n = length $ filter lwrap [1..n]
    where lwrap n = lychrel 50 (n + revnum n)
