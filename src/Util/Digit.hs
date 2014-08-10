module Util.Digit where

import Data.Char (digitToInt)

toDigits :: Integer -> [Int]
toDigits = map digitToInt . show

fromDigits :: [Int] -> Int
fromDigits = read . foldr ((++) . show) ""