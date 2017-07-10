module PoemLines where

firstSen = "Tyger Tyger, burning bright\n"

secondSen = "In the forests of the night\n"

thirdSen = "What immortal hand or eye\n"

fourthSen = "Could frame thy fearful symmetry?"

sentences = firstSen ++ secondSen ++ thirdSen ++ fourthSen

splitOn :: String -> Char -> [String]
splitOn "" _ = []
splitOn s sep
  | head s == sep = splitOn (tail s) sep
  | otherwise =
    let f = (/= sep)
    in takeWhile f s : splitOn (dropWhile f s) sep

myLines :: String -> [String]
myLines s = splitOn s '\n'

shouldEqual =
  [ "Tyger Tyger, burning bright"
  , "In the forests of the night"
  , "What immortal hand or eye"
  , "Could frame thy fearful symmetry?"
  ]

main :: IO ()
main = print $ "are they equal? " ++ show (myLines sentences == shouldEqual)
