module ApplyYourself where

-- expected type signature: [Char] -> [Char]
myConcat x = x ++ " yo"

-- expected type signature: Fractional a => a -> a
myMult x = (x / 3) * 5

-- expected type signature: Int -> [Char]
myTake x = take x "hey you"

-- expected type signature: Int -> Bool
myCom x = x > length [1..10]

-- expected type signature: Char -> Bool
myAlph x = x < 'z'
