module WriteAFunction where

myFunc :: (x -> y) -> (y -> z) -> c -> (a, x) -> (a, z)
myFunc f g _ (x, y) = (x, (g . f) y)

i :: a -> a
i = id

c :: a -> b -> a
c x _ = x

c'' :: b -> a -> b
c'' = c

c' :: a -> b -> b
c' _ x = x

r :: [a] -> [a]
r = tail

co :: (b -> c) -> (a -> b) -> a -> c
co = (.)

a :: (a -> c) -> a -> a
a _ x = x

a' :: (a -> b) -> a -> b
a' = ($)
