{-# LANGUAGE NoMonomorphismRestriction #-}

module DetermineTheType where

example = 1

-- Num a => a
sixTimesNine = (* 9) 6

-- Num a => (a, [Char])
dogeHead = head [(0,"doge"),(1,"kitteh")]

-- (Integer, [Char])
integerDogeHead = head [(0 :: Integer ,"doge"),(1,"kitteh")]

-- Bool
ifFalse = if False then True else False

-- Int
lengthOfFive = length [1,2,3,4,5]

-- Bool
lengthOfFiveVsTacocat = length [1,2,3,4,5] > length "TACOCAT"

x = 5
y = x + 5

-- Num a => a
w = y * 10

-- Num a => a
z y = y * 10

-- Fractional a => a
f = 4 / y
