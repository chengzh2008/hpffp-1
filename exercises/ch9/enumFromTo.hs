module EnumFromTo where

eft :: Enum a => a -> a -> [a]
eft x y = map toEnum [fromEnum x .. fromEnum y]

eftOrd :: Ordering -> Ordering -> [Ordering]
eftOrd = eft

eftInt :: Int -> Int -> [Int]
eftInt = eft

eftChar :: Char -> Char -> String
eftChar = eft
