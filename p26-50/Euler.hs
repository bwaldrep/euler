-- Project euler problems in Haskell

module Euler where

import EUtil
import Data.Array
import Data.Char
import Data.List
import qualified Data.Map as Map

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

-- Problem 34
p34 :: Int -> Int
p34 n = sum $ filter sumDigitFact [4..n]

-- Problem 45
p45 :: Int
p45 = head $ filter (> 40755) combo
    where combo = infintersect trinums combo2
          combo2 = infintersect pennums hexnums

-- Problem 48
p48 :: Int -> Int
p48 n = sum $ map (\x -> x ^ x) [1..n]
