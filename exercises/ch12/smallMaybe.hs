module SmallMaybe where

isJust :: Maybe a -> Bool
isJust (Just _) = True
isJust Nothing = False

isNothing :: Maybe a -> Bool
isNothing Nothing = True
isNothing (Just _) = False

mayybee :: b -> (a -> b) -> Maybe a -> b
mayybee _ f (Just y) = f y
mayybee x _ Nothing = x

fromMaybe :: a -> Maybe a -> a
fromMaybe x = mayybee x id

listToMaybe :: [a] -> Maybe a
listToMaybe [] = Nothing
listToMaybe x = Just (head x)

maybeToList :: Maybe a -> [a]
maybeToList (Just x) = [x]
maybeToList Nothing = []

catMaybes :: [Maybe a] -> [a]
catMaybes = concatMap maybeToList

flipMaybe :: [Maybe a] -> Maybe [a]
flipMaybe [] = Just []
flipMaybe (Nothing:xs) = Nothing
flipMaybe (Just x:xs) =
  case flipMaybe xs of
    Just ys -> Just (x : ys)
    Nothing -> Nothing
