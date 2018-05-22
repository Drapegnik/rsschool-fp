module Tuple where

-- pair = tuple (church 3) (church 5)
-- unchurch $ pair add -> 8
-- unchurch $ pair mul -> 15
tuple a b f = f a b

-- fst
first t = t const

-- snd
second t = t $ flip const

swap t = t $ flip tuple

-- uncurry' = flip apply
-- uncurry' = flip ($)
uncurry' f t = t f

-- curry' f a b  = f $ tuple a b
curry' f a = f . tuple a
