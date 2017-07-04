module Recursion where

data DivideByResult
  = Result (Integer, Integer)
  | DivideByZero
  deriving (Show)

dividedBy :: Integer -> Integer -> DivideByResult
dividedBy num dem
  | dem == 0 = DivideByZero
  | dem < 0 && num > 0 = Result (negateFirst $ go num (negate dem) 0)
  | dem > 0 && num < 0 = Result (negateFirst $ go (negate num) dem 0)
  | dem < 0 && num < 0 = Result (go (negate num) (negate dem) 0)
  | otherwise = Result (go num dem 0)
  where
    negateFirst (x, y) = (negate x, y)
    go num dem count
      | num < dem = (count, num)
      | otherwise = go (num - dem) dem (count + 1)

sumOneToN :: (Eq a, Num a) => a -> a
sumOneToN n
  | n == 1 = 1
  | otherwise = n + sumOneToN (n - 1)

recursiveMult :: Integral a => a -> a -> a
recursiveMult = go 0
  where
    go cum x y
      | y == 0 = cum
      | otherwise = go (cum + x) x (y - 1)
