-- Project euler problems in Haskell

module Euler where

import EUtil
import Data.Array
import Data.Char
import Data.List
import qualified Data.Map as Map

-- Problem 55
lychrel :: Integer -> Integer -> Bool
lychrel 0 _ = True
lychrel i n = (not . palindrome) n && lychrel (i-1) (n + revnum n)

p55 :: Integer -> Int
p55 n = length $ filter lwrap [1..n]
    where lwrap n = lychrel 50 (n + revnum n)
