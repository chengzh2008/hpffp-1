module WithFolds where

myOr :: [Bool] -> Bool
myOr = foldr (||) False

myAny :: (a -> Bool) -> [a] -> Bool
myAny f = foldr ((||) . f) False

myElemF :: Eq a => a -> [a] -> Bool
myElemF x = foldr ((||) . (== x)) False

myElemA :: Eq a => a -> [a] -> Bool
myElemA x = myAny (== x)

myReverse :: [a] -> [a]
myReverse = foldl (flip (:)) []

myMap :: (a -> b) -> [a] -> [b]
myMap f = foldr ((:) . f) []

myFilter :: (a -> Bool) -> [a] -> [a]
myFilter f =
  foldr
    (\x ys ->
       if f x
         then x : ys
         else ys)
    []

mySquish :: [[a]] -> [a]
mySquish = foldr (++) []

squishMap :: (a -> [b]) -> [a] -> [b]
squishMap f = foldr (\x ys -> f x ++ ys) []

squishAgain :: [[a]] -> [a]
squishAgain = squishMap id

myMaximumBy :: (a -> a -> Ordering) -> [a] -> a
myMaximumBy f (x:xs) =
  foldr
    (\x' y ->
       case x' `f` y of
         GT -> x'
         _ -> y)
    x
    xs

myMinimumBy :: (a -> a -> Ordering) -> [a] -> a
myMinimumBy f (x:xs) =
  foldr
    (\x' y ->
       case x' `f` y of
         LT -> x'
         _ -> y)
    x
    xs

