module BT where

data BinaryTree a
  = Leaf
  | Node (BinaryTree a)
         a
         (BinaryTree a)
  deriving (Eq, Ord, Show)

instance Functor BinaryTree where
  fmap _ Leaf = Leaf
  fmap f (Node x y z) = Node (fmap f x) (f y) (fmap f z)

testTree' :: BinaryTree Integer
testTree' = Node (Node Leaf 3 Leaf) 1 (Node Leaf 4 Leaf)

mapExpected = Node (Node Leaf 4 Leaf) 2 (Node Leaf 5 Leaf)

runMapTest =
  if fmap (+ 1) testTree' == mapExpected
    then print "pass"
    else error "fail"

preorder :: BinaryTree a -> [a]
preorder Leaf = []
preorder (Node x y z) = preorder x ++ [y] ++ preorder z

inorder :: BinaryTree a -> [a]
inorder Leaf = []
inorder (Node x y z) = y : preorder x ++ preorder z

postorder :: BinaryTree a -> [a]
postorder Leaf = []
postorder (Node x y z) = preorder x ++ preorder z ++ [y]

instance Foldable BinaryTree where
  foldr _ acc Leaf = acc
  foldr f acc (Node x y z) = f y (foldr f (foldr f acc z) x)

unfoldTree :: (a -> Maybe (a, b, a)) -> a -> BinaryTree b
unfoldTree f x =
  case f x of
    Nothing -> Leaf
    Just (x', y, z) -> Node (unfoldTree f x') y (unfoldTree f z)

buildTree :: Integer -> BinaryTree Integer
buildTree n = unfoldTree f 0
  where
    f x
      | x > n = Nothing
      | otherwise = Just (x + 1, x, x + 1)
