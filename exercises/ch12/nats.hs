data Nat
  = Zero
  | Succ Nat
  deriving (Eq, Show)

natToInteger :: Nat -> Integer
natToInteger Zero = 0
natToInteger (Succ n) = 1 + natToInteger n

integerToNat :: Integer -> Maybe Nat
integerToNat i
  | i < 0 = Nothing
  | i == 0 = Just Zero
  | otherwise = Just (go i)
  where
    go 0 = Zero
    go i = Succ (go (i - 1))
