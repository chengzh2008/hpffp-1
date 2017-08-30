module StringProcess where

replaceThe :: String -> String
replaceThe y =
  unwords $
  map
    (\x ->
       if x == "the"
         then "a"
         else x) $
  words y

countTheVowel :: String -> Integer
countTheVowel x = go (words x) False 0
  where
    go [] _ i = i
    go (x:xs) t i
      | x == "the" = go xs True i
      | t && elem (head x) "aeiou" = go xs False (i + 1)
      | otherwise = go xs False i

countVowels :: String -> Integer
countVowels =
  foldr
    (\s x ->
       if s `elem` "aeiou"
         then x + 1
         else x)
    0

type Word' = String

validateWord :: Word' -> Maybe Word'
validateWord w =
  if length v > length c
    then Nothing
    else Just w
  where
    (v, c) =
      foldr
        (\x (v', c') ->
           if x `elem` "aeiou"
             then (x : v', c')
             else (v', x : c'))
        ([], [])
        w
