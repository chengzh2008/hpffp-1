module McCarthy where

mc91 :: (Num a, Ord a) => a -> a
mc91 x =
  if x > 100
    then x - 10
    else mc91 $ mc91 $ x + 11
