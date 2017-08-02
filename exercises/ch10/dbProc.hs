module DbProc where

import Data.Time

data DatabaseItem
  = DbString String
  | DbNumber Integer
  | DbDate UTCTime
  deriving (Eq, Ord, Show)

theDatabase :: [DatabaseItem]
theDatabase =
  [ DbDate (UTCTime (fromGregorian 1911 5 1) (secondsToDiffTime 34123))
  , DbNumber 9001
  , DbNumber 9002
  , DbNumber 9003
  , DbString "Hello, World"
  , DbDate (UTCTime (fromGregorian 1921 5 1) (secondsToDiffTime 34124))
  ]

filterMap :: (a -> b) -> (a -> Bool) -> [a] -> [b]
filterMap f g xs = map f $ filter g xs

filterDbDate :: [DatabaseItem] -> [UTCTime]
filterDbDate =
  filterMap
    (\(DbDate ts) -> ts)
    (\d ->
       case d of
         DbDate _ -> True
         _ -> False)

filterDbNumber :: [DatabaseItem] -> [Integer]
filterDbNumber =
  filterMap
    (\(DbNumber x) -> x)
    (\d ->
       case d of
         DbNumber _ -> True
         _ -> False)

mostRecent :: [DatabaseItem] -> UTCTime
mostRecent = maximum . filterDbDate

sumDb :: [DatabaseItem] -> Integer
sumDb = sum . filterDbNumber

avgDb :: [DatabaseItem] -> Double
avgDb xs =
  let nums = filterDbNumber xs
  in fromIntegral (sum nums) / fromIntegral (length nums)
