module WordNumber where

import Data.List (intercalate)

digitToWord :: Int -> String
digitToWord n =
  let words = ["zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]
  in words !! n

digits :: Int -> [Int]
digits n
  | n > 10 = digits (n `div` 10) ++ [n `mod` 10]
  | otherwise = [n `mod` 10]

wordNumber :: Int -> String
wordNumber i = intercalate "-" . map digitToWord $ digits i
