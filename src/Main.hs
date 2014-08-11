module Main where

import Data.List (sort, nub, subsequences)
import Util.Digit

type Clause = Digits -> Bool

topRow = [1, 2, 3]

clauses :: [Clause]
clauses = [firstIsLargerThanSecond, secondIsTwiceTheThird, thirdIsSmallerThanFirst, 
    fourthIsHalfOfTheFirst, notRepeated, threeAreNotInTopRow]
    where
    firstIsLargerThanSecond digits = digits !! 0 > digits !! 1
    secondIsTwiceTheThird   digits = digits !! 1 == 2 * digits !! 2
    thirdIsSmallerThanFirst digits = digits !! 2 < digits !! 0
    fourthIsHalfOfTheFirst  digits = 
        let dm = digits !! 0 `divMod` 2 
        in digits !! 3 == fst dm && snd dm == 0
    notRepeated             digits = sort digits == (sort $ nub digits)
    threeAreNotInTopRow     digits = 
        let filterLength n = filter ((== n) . length)
            subs = filterLength 3 $ subsequences digits
            inTopRow = (flip elem) topRow
        in any (\xs -> all (not . inTopRow) xs) subs

main = 
    let hasZeros = elem 0
        seq = filter (not . hasZeros) $ map toDigits [1111..9999]
        applyClauses x = and $ map ($ x) clauses
        filtered = filter snd $ zip seq $ map applyClauses seq
        res = map (fromDigits . fst) filtered
    in print res
