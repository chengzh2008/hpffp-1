module VarietyPack where

k :: (a, b) -> a
k (x, y) = x

k1 = k (4 - 1, 10)

k2 = k ("three", 1 + 2)

k3 = k (3, True)

f :: (a, b, c) -> (d, e, f) -> ((a, d), (c, f))
f (x, y, z) (x', y', z') = ((x, x'), (z, z'))
