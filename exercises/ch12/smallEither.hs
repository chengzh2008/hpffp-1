module SmallEither where

lefts' :: [Either a b] -> [a]
lefts' =
  foldr
    (\x acc ->
       (case x of
          (Left x') -> [x']
          (Right _) -> []) ++
       acc)
    []

rights' :: [Either a b] -> [b]
rights' =
  foldr
    (\x acc ->
       (case x of
          (Left _) -> []
          (Right x') -> [x']) ++
       acc)
    []

partitionEithers' :: [Either a b] -> ([a], [b])
partitionEithers' =
  foldr
    (\x (y, z) ->
       case x of
         Left x' -> (x' : y, z)
         Right x' -> (y, x' : z))
    ([], [])

either' :: (a -> c) -> (b -> c) -> Either a b -> c
either' f _ (Left x) = f x
either' _ f (Right x) = f x

eitherMaybe' :: (b -> c) -> Either a b -> Maybe c
eitherMaybe' f = either' (const Nothing) (Just . f)
