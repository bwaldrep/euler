-- Project euler problems in Haskell

module Euler where

import Data.Char

-- Problem 48
p48 :: Int -> Int
p48 n = sum $ map (\x -> x ^ x) [1..n]

-- Problem 16
splitInt :: Int -> [Int]
splitInt n = map ((\x -> x - 48) . ord) $ show n

p16 :: Int -> Int
p16 n = sum $ splitInt (2^n)

-- Problem 34
fact :: Int -> Int
fact n = product [1..n]

sumfact :: Int -> Bool
sumfact n = n == (sum $ map fact $ splitInt n)

p34 :: Int -> Int
p34 n = sum $ filter sumfact [4..n]
