module Util.Digit where

import Data.Char (digitToInt)

toDigits :: Integer -> [Integer]
toDigits = map (toInteger . digitToInt) . show

fromDigits :: [Integer] -> Int
fromDigits = read . foldr ((++) . show) ""