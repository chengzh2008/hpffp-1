{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE FlexibleInstances #-}

module TooMany where

newtype Goats =
  Goats Int
  deriving (Eq, Show)

class TooMany a where
  tooMany :: a -> Bool

instance TooMany Int where
  tooMany n = n > 42

newtype NameWithCount =
  NameWithCount (Int, String)

newtype TwoFields =
  TwoFields (Int, Int)

instance TooMany NameWithCount where
  tooMany (NameWithCount (i, s)) = i > 42

instance TooMany TwoFields where
  tooMany (TwoFields (x, y)) = (x + y) > 42

instance (Num a, TooMany a, Ord a) => TooMany (a, a) where
  tooMany (x, y) = x > 42 || y > 42
