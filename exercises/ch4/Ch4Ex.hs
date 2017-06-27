module Ch4Ex where

isPalindrome :: (Eq a) => [a] -> Bool
isPalindrome s = s == reverse s

myAbs :: Integer -> Integer
myAbs x = if x < 0 then negate x else x

f :: (a, b) -> (c, d) -> ((b, d), (a, c))
f x y = ((snd x, snd y), (fst x, fst y))

-- correcting syntax
x = (+)

cf :: [a] -> Int
cf xs = l `x` 1 where l = length xs

head' :: [a] -> a
head' (x:xs) = x

fst' :: (a, b) -> a
fst' (x, y) = x
