module MoodSwing where

data Mood = Blah | Woot deriving Show
--   [tc]   [dc]   [dc] ^-----------^  allows printing to screen

changeMood :: Mood -> Mood
changeMood Blah = Woot
changeMood Woot = Blah
