module ApplyTimes where

applyTimes :: (Num a, Eq a) => a -> (b -> b) -> b -> b
applyTimes 0 f x = x
applyTimes n f x = f . applyTimes (n - 1) f $ x
