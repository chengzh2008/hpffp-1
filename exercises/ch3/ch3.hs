module Ch3Ex where

appendExcl :: String -> String
appendExcl s = s ++ "!"

getFourth :: String -> Char
getFourth = (!! 4)

afterNine :: String -> String
afterNine = drop 9

getThird = (!! 2)

letterIndex :: Int -> Char
letterIndex = (!!) "curry is awesome!"
