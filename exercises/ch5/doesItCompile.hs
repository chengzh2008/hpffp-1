module DoesItCompile where

bigNum = (^) 5 10 :: Integer
-- no
-- wahoo = bigNum $ 10

x = print
y = print "wahoo"
z = x "hello world"

a = (+)
b = 5
c = a 10
d = c 200

e x = 12 + f x
f = (10000 *)
