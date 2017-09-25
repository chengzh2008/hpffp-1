module Main where

import Test.QuickCheck

data Trivial =
  Trivial
  deriving (Eq, Show)

trivialGen :: Gen Trivial
trivialGen = return Trivial

instance Arbitrary Trivial where
  arbitrary = trivialGen

newtype Identity a =
  Identity a
  deriving (Eq, Show)

identityGen :: Arbitrary a => Gen (Identity a)
identityGen = do
  a <- arbitrary
  return (Identity a)

instance Arbitrary a => Arbitrary (Identity a) where
  arbitrary = identityGen

identityGenInt :: Gen (Identity Int)
identityGenInt = identityGen

data Pair a b =
  Pair a
       b
  deriving (Eq, Show)

pairGen :: (Arbitrary a, Arbitrary b) => Gen (Pair a b)
pairGen = do
  a <- arbitrary
  b <- arbitrary
  return (Pair a b)

instance (Arbitrary a, Arbitrary b) => Arbitrary (Pair a b) where
  arbitrary = pairGen

data Sum a b
  = First a
  | Second b
  deriving (Show, Eq)

genSum :: (Arbitrary a, Arbitrary b) => Gen (Sum a b)
genSum = do
  a <- arbitrary
  b <- arbitrary
  oneof [return $ First a, return $ Second b]

instance (Arbitrary a, Arbitrary b) => Arbitrary (Sum a b) where
  arbitrary = genSum

main :: IO ()
main = sample trivialGen
