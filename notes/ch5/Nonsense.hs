module Nonsense where

nonsense :: Bool -> Integer
nonsense True = 805
nonsense False = 31337

curriedFunc :: Integer -> Bool -> Integer
curriedFunc i b = i + nonsense b

uncurriedFunc :: (Integer, Bool) -> Integer
uncurriedFunc (i, b) = i + nonsense b

anon :: Integer -> Bool -> Integer
anon = \i b -> i + nonsense b

anonNest :: Integer -> Bool -> Integer
anonNest = \i -> \b -> i + nonsense b
