module Phone where

import Data.Char
import Data.List (elemIndex, find, maximumBy)
import Data.Map (fromListWith, toList)
import Data.Maybe (fromJust)

type Digit = Char

type Presses = Int

type Phone = [(Digit, String)]

daPhone :: Phone
daPhone =
  [ ('1', "1")
  , ('2', "abc2")
  , ('3', "def3")
  , ('4', "ghi4")
  , ('5', "jkl5")
  , ('6', "mno6")
  , ('7', "pqrs7")
  , ('8', "tuv8")
  , ('9', "wxyz9")
  , ('*', [])
  , ('0', "+ _0")
  , ('#', ".,")
  ]

convo :: [String]
convo =
  [ "Wanna play 20 questions"
  , "Ya"
  , "U 1st haha"
  , "Lol ok. Have u ever tasted alcohol lol"
  , "Lol ya"
  , "Wow ur cool haha. Ur turn"
  , "Ok. Do u think I am pretty Lol"
  , "Lol ya"
  , "Haha thanks just making sure rofl ur turn"
  ]

toTaps :: Phone -> Char -> [(Digit, Presses)]
toTaps p c = [('*', 1) | isUpper c] ++ [(fst digit, press)]
  where
    digit = fromJust $ find (\(_, y) -> elem (toLower c) y) p
    press = (1 +) $ fromJust $ elemIndex (toLower c) (snd digit)

transcribe :: Phone -> String -> [(Digit, Presses)]
transcribe p = concatMap (toTaps p)

pressCount :: Phone -> [String] -> Int
pressCount p c = foldr ((+) . snd) 0 (concatMap (transcribe p) c)

coolestLetter :: [String] -> Char
coolestLetter c = fst $ coolest' c [(c, 1) | c <- concat c]

coolestWord :: [String] -> String
coolestWord c = fst $ coolest' c [(c, 1) | c <- words (unwords c)]

coolest' :: (Ord a, Ord b, Num b) => [String] -> [(a, b)] -> (a, b)
coolest' c l =
  maximumBy (\x y -> compare (snd x) (snd y)) $ toList $ fromListWith (+) l
