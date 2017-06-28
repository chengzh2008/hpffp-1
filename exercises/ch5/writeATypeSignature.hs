module WriteATypeSignature where

functionH :: [a] -> a
functionH (x:_) = x

functionC :: (Ord a) => a -> a -> Bool
functionC x y = x > y

functionS :: (a, b) -> b
functionS (_, y) = y
