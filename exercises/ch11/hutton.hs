module Hutton where

data Expr a
  = Lit a
  | Add (Expr a)
        (Expr a)

instance Foldable Expr where
  foldr f acc (Lit x) = f x acc
  foldr f acc (Add x y) = foldr f (foldr f acc y) x

eval :: Expr Integer -> Integer
eval = sum

printExpr :: Show a => Expr a -> String -> String
printExpr x s = take (length e - length s) e
  where
    e = foldr (\y acc -> show y ++ s ++ acc) "" x
