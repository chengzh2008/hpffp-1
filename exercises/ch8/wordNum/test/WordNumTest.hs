module Main where

import Test.Hspec
import WordNumber (digitToWord, digits, wordNumber)

main :: IO ()
main =
  hspec $
  describe "digitToWord" $ do
    it "returns zero for 0" $ digitToWord 0 `shouldBe` "zero"
    it "returns one for 1" $ digitToWord 1 `shouldBe` "one"
