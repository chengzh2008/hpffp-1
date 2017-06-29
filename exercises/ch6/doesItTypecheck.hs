module DoesItTypecheck where

import Data.List (sort)

newtype Person =
  Person Bool
  deriving (Show)

printPerson :: Person -> IO ()
printPerson = print

data Mood
  = Blah
  | Woot
  deriving (Eq, Ord, Show)

settleDown :: Mood -> Mood
settleDown x =
  if x == Woot
    then Blah
    else x

type Subject = String

type Verb = String

type Object = String

data Sentence =
  Sentence Subject
           Verb
           Object
  deriving (Eq, Show)

s1 = Sentence "dogs" "drool"

s2 = Sentence "Julie" "loves" "dogs"

newtype Rocks =
  Rocks String
  deriving (Eq, Ord, Show)

newtype Yeah =
  Yeah Bool
  deriving (Eq, Ord, Show)

data Papu =
  Papu Rocks
       Yeah
  deriving (Eq, Ord, Show)

phew = Papu (Rocks "chases") (Yeah True)

truth = Papu (Rocks "chomskydoz") (Yeah True)

equalityForall :: Papu -> Papu -> Bool
equalityForall p p' = p == p'

comparePapus :: Papu -> Papu -> Bool
comparePapus p p' = p > p'

mySort :: String -> String
mySort = sort

signifier :: String -> Char
signifier = head . mySort
