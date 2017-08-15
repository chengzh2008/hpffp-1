module Ciphers
  ( caesar
  , unCaesar
  , vig
  , unvig
  ) where

import Data.Bool (bool)
import Data.Char

lowerFirst = 97

upperFirst = 65

alphaLen = 26

caesar' :: String -> (Int -> Int) -> String
caesar' [] _ = []
caesar' (x:xs) f = chr idx : caesar' xs f
  where
    start = bool lowerFirst upperFirst (isUpper x)
    idx = start + mod (f (ord x - start)) alphaLen

caesar :: String -> Int -> String
caesar xs sh = caesar' xs (sh +)

unCaesar :: String -> Int -> String
unCaesar xs sh = caesar' xs (subtract sh)

idx :: Char -> Int -> (Int -> Int -> Int) -> Int
idx x y f = start + mod ((ord x - start) `f` y) alphaLen
  where
    start = bool lowerFirst upperFirst (isUpper x)

vig' :: String -> String -> (Int -> Int -> Int) -> String
vig' key msg f =
  map (\(x, y) -> chr $ idx x y f) $ zip msg $ map shift (go key msg)
  where
    go _ [] = []
    go [] m = go key m
    go (k:ks) (_:ms) = k : go ks ms
    shift x = ord x - bool lowerFirst upperFirst (isUpper x)

vig :: String -> String -> String
vig key msg = vig' key msg (+)

unvig :: String -> String -> String
unvig key msg = vig' key msg (-)
