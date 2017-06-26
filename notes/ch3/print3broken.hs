module Print3Broken where

printSecond :: String -> IO ()
printSecond x = putStrLn x

main :: IO ()
main = do
  putStrLn greeting
  printSecond greeting
  where greeting = "Yarrrrr"
