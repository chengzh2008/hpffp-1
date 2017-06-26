module Reverse where

rvrs :: String -> String
rvrs s = a ++ " " ++ i ++ " " ++ c
  where a = drop 9 s
        i = take 2 $ drop 6 s
        c = take 5 s

main :: IO ()
main = putStrLn $ rvrs "curry is awesome"
