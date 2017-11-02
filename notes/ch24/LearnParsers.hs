module LearnParsers where

import Text.Parser.Combinators
import Text.Trifecta

parseInt :: Parser Integer
parseInt = do
  i <- integer
  eof
  return i
