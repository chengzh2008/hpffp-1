module Uppers where

import Data.Char

capAll :: String -> String
capAll "" = ""
capAll (x:xs) = toUpper x : capAll xs

capFirst :: String -> Char
capFirst = toUpper . head
