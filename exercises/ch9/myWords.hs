module MyWords where

myWords :: String -> [String]
myWords (' ':ss) = myWords ss
myWords "" = []
myWords s =
  let f = (/= ' ')
  in takeWhile f s : myWords (dropWhile f s)
