module Util.Digit where

import Data.Char (digitToInt)

type Digits = [Integer]

toDigits :: Integer -> Digits
toDigits = map (toInteger . digitToInt) . show

fromDigits :: Digits -> Int
fromDigits = read . foldr ((++) . show) ""