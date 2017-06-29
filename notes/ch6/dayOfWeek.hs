module DayOfWeek where

data DayOfWeek
  = Mon
  | Tues
  | Weds
  | Thu
  | Fri
  | Sat
  | Sun
  deriving (Ord, Show)

data Date =
  Date DayOfWeek
       Int
  deriving (Show)

instance Eq DayOfWeek where
  (==) Mon Mon = True
  (==) Tues Tues = True
  (==) Weds Weds = True
  (==) Thu Thu = True
  (==) Fri Fri = True
  (==) Sat Sat = True
  (==) Sun Sun = True
  (==) _ _ = False

instance Eq Date where
  (Date d i) == (Date d' i') = d == d' && i == i'
