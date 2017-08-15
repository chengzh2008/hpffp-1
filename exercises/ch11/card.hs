module Cardinality where

data BigSmall -- 4: 2 + 2 = 4
  = Big Bool -- 2: Bool = False | True
  | Small Bool -- 2: Bool = False | True
  deriving (Eq, Show)

data NumberOrBool -- 257: 255 + 2
  = Numba Int8 -- 255: 127 - (-128)
  | BoolyBool Bool -- 2: False | True
  deriving (Eq, Show)
