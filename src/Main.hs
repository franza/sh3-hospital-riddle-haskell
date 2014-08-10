module Main where

import Data.List (sort, nub, subsequences)
import Util.Digit

type Clause = [Integer] -> Bool

topRow = [1, 2, 3]

clauses :: [Clause]
clauses = [firstIsLargerThanSecond, secondIsTwiceTheThird, thirdIsSmallerThanFirst, 
  fourthIsHalfOfTheFirst, notRepeated, threeAreNotInTopRow]
  where
  firstIsLargerThanSecond digits = digits !! 0 > digits !! 1
  secondIsTwiceTheThird   digits = digits !! 1 == 2 * digits !! 2
  thirdIsSmallerThanFirst digits = digits !! 2 < digits !! 0
  fourthIsHalfOfTheFirst  digits = digits !! 3 == digits !! 0 `div` 2
  notRepeated             digits = sort digits == (sort $ nub digits)
  threeAreNotInTopRow     digits = 
    let subs = filter (\xs -> length xs == 3) $ subsequences digits
        inTopRow = (flip elem) topRow
    in all (\xs -> not $ all inTopRow xs) subs

reject :: (a -> Bool) -> [a] -> [a]
reject f = filter (not . f)

main = 
  let sequence = reject (elem 0) $ map toDigits [1111..9999]
      allClausesApplied = map (\x -> and $ map ($ x) clauses) sequence
      filtered = filter snd $ zip sequence allClausesApplied
      res = map fromDigits $ map fst filtered
  in print res