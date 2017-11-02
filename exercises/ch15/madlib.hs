module MadLib where

import Data.Monoid

type Verb = String

type Adj = String

type Noun = String

type Excl = String

type Adv = String

madlibbin' :: Excl -> Adv -> Noun -> Adj -> String
madlibbin' e adv noun adj =
  e <> "! he said " <> adv <> " as he jumped into his car " <> noun <>
  " and drove off with his " <>
  adj <>
  " wife."

madlibbinbetter :: Excl -> Adv -> Noun -> Adj -> String
madlibbinbetter e adv noun adj =
  mconcat
    [ e
    , "! he said "
    , adv
    , " as he jumped into his car "
    , noun
    , " and drove off with his "
    , adj
    , " wife."
    ]
