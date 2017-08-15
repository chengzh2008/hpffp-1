module Language where

import Data.Char (toUpper)

capitalizeWord :: String -> String
capitalizeWord (x:xs) = toUpper x : xs

capitalizePara :: String -> String
capitalizePara xs = unwords $ go (words xs) True
  where
    go [] _ = []
    go (y:ys) cap =
      (if cap
         then capitalizeWord y
         else y) :
      (if last y == '.'
         then go ys True
         else go ys False)
