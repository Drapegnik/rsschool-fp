module Base where

-- id - I combinator
identity :: t -> t
identity x = x

-- const - K combinator
constant :: a -> b -> a
constant x _ = x

-- ($)
apply :: (a -> b) -> a -> b
apply f x = f x

-- (.)
compose :: (b -> c) -> (a -> b) -> a -> c
compose f g x = f $ g x

flip' :: (a -> b -> c) -> b -> a -> c
flip' f x y = f y x

-- (<*>) - S combinator
s :: (a -> b -> c) -> (a -> b) -> a -> c
s f g x = f x $ g x
