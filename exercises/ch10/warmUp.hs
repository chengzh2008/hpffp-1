module WarmUp where

stops :: String
stops = "pbtdkg"

vowels :: String
vowels = "aeiou"

svs :: String -> String -> [String]
svs s v = [[x, y, z] | x <- s, y <- v, z <- s]

pFirst :: String -> String -> [String]
pFirst s v = [x | x <- svs s v, head x == 'p']

nouns :: [String]
nouns = ["computer", "airplane", "coffee mug", "watch"]

verbs :: [String]
verbs = ["sleep", "fly", "compute", "spill", "tick"]

nvn :: [String] -> [String] -> [String]
nvn n v = [x ++ " " ++ y ++ " " ++ z | x <- n, y <- v, z <- n]

seekritFunc x = fromIntegral (sum (map length (words x))) / fromIntegral (length (words x))
