module Fibs
  ( fibsTil
  , fibsLt
  , fibsN
  ) where

fibs' :: [Integer]
fibs' = 1 : scanl (+) 1 fibs'

fibsTil :: Int -> [Integer]
fibsTil i = take i fibs'

fibsLt :: Integer -> [Integer]
fibsLt i = takeWhile (< i) fibs'

fibsN :: Int -> Integer
fibsN = last . fibsTil

fact' :: [Integer]
fact' = scanl (*) 1 [1 ..]
