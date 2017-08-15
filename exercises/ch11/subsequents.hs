module Subsequents where

import Data.Char (toUpper)

isSubsequenceOf :: (Eq a) => [a] -> [a] -> Bool
isSubsequenceOf [] _ = True
isSubsequenceOf _ [] = False
isSubsequenceOf xs@(x:xs') (y:ys) =
  if x == y
    then isSubsequenceOf xs' ys
    else isSubsequenceOf xs ys

capitalizeWords :: String -> [(String, String)]
capitalizeWords xs = map (\ys@(y:ys') -> (ys, toUpper y : ys')) (words xs)
