module Church where

zero :: a -> b -> b
zero _ x = x

-- apply, one = ($)
one :: (a -> b) -> a -> b
one f x = f x

two :: (a -> a) -> a -> a
two f x = f $ f x

inc :: ((a -> b) -> c -> a) -> (a -> b) -> c -> b
inc n f x = f (n f x)

unchurch :: (Num a, Num b) => ((a -> a) -> b -> c) -> c
unchurch n = n (+1) 0

church 0 _ x = x -- zero
church n f x = f $ church (n - 1) f x

