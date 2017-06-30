module WriteCode where

tensDigit :: Integral a => a -> a
tensDigit x = d
  where
    xLast = x `div` 10
    d = xLast `mod` 10

hunsD = (`mod` 10) . (`div` 100)

foldBool1 :: a -> a -> Bool -> a
foldBool1 x y b
  | b = x 
  | otherwise = y

foldBool2 :: a -> a -> Bool -> a
foldBool2 x y b =
  case b of
    True -> x
    _ -> y
