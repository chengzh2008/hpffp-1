module Quad where

data Quad
  = One
  | Two
  | Three
  | Four
  deriving (Eq, Show)
-- eQuad :: Either Quad Quad = 4 + 4 = 8
-- prodQuad :: (Quad, Quad) = 4 * 4 = 16
-- funcQuad :: Quad -> Quad = 4 ^ 4 = 256
-- prodTBool :: (Bool, Bool, Bool) = 2 * 2 * 2 = 8
-- gTwo :: Bool -> Bool -> Bool = 2 ^ 2 ^ 2 = 16
-- fTwo :: Bool -> Quad -> Quad 4 ^ 4 ^ 2 = 65,536
