module Addition where

import Test.Hspec
import Test.QuickCheck

sayHello :: IO ()
sayHello = putStrLn "hello!"

dividedBy :: Integral a => a -> a -> (a, a)
dividedBy num denom = go num denom 0
  where
    go n d count
      | n < d = (count, n)
      | otherwise = go (n - d) d (count + 1)

multipli :: (Eq a, Num a) => a -> a -> a
multipli x y = go x 1
  where
    go x' count
      | count == y = x'
      | otherwise = go (x' + x) (count + 1)

trivialInt :: Gen Int
trivialInt = return 1

oneThroughThree :: Gen Int
oneThroughThree = elements [1, 2, 2, 2, 3]

genBool :: Gen Bool
genBool = choose (False, True)

genBool' :: Gen Bool
genBool' = elements [False, True]

genOrdering :: Gen Ordering
genOrdering = elements [LT, EQ, GT]

genChar :: Gen Char
genChar = elements ['a' .. 'z']

genTuple :: (Arbitrary a, Arbitrary b) => Gen (a, b)
genTuple = do
  x <- arbitrary
  y <- arbitrary
  return (x, y)

genThreeple :: (Arbitrary a, Arbitrary b, Arbitrary c) => Gen (a, b, c)
genThreeple = do
  x <- arbitrary
  y <- arbitrary
  z <- arbitrary
  return (x, y, z)

genEither :: (Arbitrary a, Arbitrary b) => Gen (Either a b)
genEither = do
  x <- arbitrary
  y <- arbitrary
  elements [Left x, Right y]

genMaybe :: (Arbitrary a) => Gen (Maybe a)
genMaybe = do
  x <- arbitrary
  elements [Nothing, Just x]

prop_additionGreater :: Int -> Bool
prop_additionGreater x = x + 1 > x

runQc :: IO ()
runQc = quickCheck prop_additionGreater

main :: IO ()
main =
  hspec $ do
    describe "Addition" $ do
      it "1 + 1 is greater than 1" $ (1 + 1) > 1 `shouldBe` True
      it "2 + 2 is equal to 4" $ (2 + 2) `shouldBe` 4
      it "x + 1 is always greater than x" $ property $ \x -> x + 1 > (x :: Int)
    describe "dividedBy" $ do
      it "15 divided by 3 is 5" $ 15 `dividedBy` 3 `shouldBe` (5, 0)
      it "22 divided by 5 is 5 remainder 2" $ 22 `dividedBy` 5 `shouldBe` (4, 2)
    describe "multipli" $
      it "3 multiplied by 3 is 9" $ 3 `multipli` 3 `shouldBe` 9
