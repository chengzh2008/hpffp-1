module MyStd where

myOr :: [Bool] -> Bool
myOr [] = False
myOr (x:xs) = x || myOr xs

myAny :: (a -> Bool) -> [a] -> Bool
myAny _ [] = False
myAny f (x:xs) = f x || myAny f xs

myElem :: Eq a => a -> [a] -> Bool
myElem _ [] = False
myElem y (x:xs) = x == y || myElem y xs

myElem' :: Eq a => a -> [a] -> Bool
myElem' y xs = any (y ==) xs

myReverse :: [a] -> [a]
myReverse [] = []
myReverse xs = last xs : myReverse (take (length xs - 1) xs)

squish :: [[a]] -> [a]
squish [] = []
squish (x:xs) = x ++ squish xs

squishMap :: (a -> [b]) -> [a] -> [b]
squishMap _ [] = []
squishMap f (x:xs) = f x ++ squishMap f xs

squishAgain :: [[a]] -> [a]
squishAgain = squishMap id

myMaximumBy :: (a -> a -> Ordering) -> [a] -> a
myMaximumBy f (x:xs) = maxOf f x xs
  where
    maxOf _ m [] = m
    maxOf f' m (x':xs') =
      case f' m x' of
        GT -> maxOf f' m xs'
        LT -> maxOf f' x' xs'
        EQ -> maxOf f' m xs'

myMinimumBy :: (a -> a -> Ordering) -> [a] -> a
myMinimumBy f (x:xs) = minOf f x xs
  where
    minOf _ m [] = m
    minOf f' m (x':xs') =
      case f' m x' of
        GT -> minOf f' x' xs'
        LT -> minOf f' m xs'
        EQ -> minOf f' m xs'

myMaximum :: Ord a => [a] -> a
myMaximum = myMaximumBy compare

myMinimum :: Ord a => [a] -> a
myMinimum = myMinimumBy compare
