module Only where

import Data.Monoid
import Test.QuickCheck

data Opt a
  = Only a
  | Nada
  deriving (Eq, Show)

instance Monoid a => Monoid (Opt a) where
  mempty = Nada
  mappend (Only x) (Only y) = Only (x <> y)
  mappend x Nada = x
  mappend Nada y = y

newtype Fst a = Fst
  { getFst :: Opt a
  } deriving (Eq, Show)

instance Monoid (Fst a) where
  mempty = Fst {getFst = Nada}
  mappend Fst {getFst = Nada} Fst {getFst = Nada} = Fst {getFst = Nada}
  mappend Fst {getFst = Only x} _ = Fst {getFst = Only x}
  mappend _ Fst {getFst = Only x} = Fst {getFst = Only x}

instance Arbitrary a => Arbitrary (Fst a) where
  arbitrary = do
    x <- arbitrary
    frequency
      [(1, return Fst {getFst = Only x}), (1, return Fst {getFst = Nada})]

monasc :: (Monoid m, Eq m) => m -> m -> m -> Bool
monasc x y z = (x <> y) <> z == x <> (y <> z)

mli :: (Eq m, Monoid m) => m -> Bool
mli x = mempty <> x == x

mri :: (Eq m, Monoid m) => m -> Bool
mri x = x <> mempty == x

main = do
  quickCheck (monasc :: Fst String -> Fst String -> Fst String -> Bool)
  quickCheck (mli :: Fst String -> Bool)
  quickCheck (mri :: Fst String -> Bool)
