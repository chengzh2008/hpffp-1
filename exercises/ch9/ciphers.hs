module Ciphers
  ( caesar
  , unCaesar
  ) where

import Data.Bool (bool)
import Data.Char

lowerFirst = 97

upperFirst = 65

caesar' :: String -> (Int -> Int) -> String
caesar' [] _ = []
caesar' (x:xs) f = chr idx : caesar' xs f
  where
    start = bool lowerFirst upperFirst (isUpper x)
    idx = start + mod (f (ord x - start)) 26

caesar :: String -> Int -> String
caesar xs sh = caesar' xs (sh +)

unCaesar :: String -> Int -> String
unCaesar xs sh = caesar' xs (subtract sh)
