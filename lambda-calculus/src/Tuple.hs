module Tuple where

-- pair = tuple (church 3) (church 5)
-- unchurch $ pair add -> 8
-- unchurch $ pair mul -> 15
tuple a b f = f a b

-- fst
first = uncurry' const

-- snd
second t = t $ flip const

swap t = t $ flip tuple

-- uncurry' f t = t f
-- unchurch $ uncurry' add $ pair -> 8
uncurry' = flip ($)

-- curry' f a b = f $ tuple a b
-- curry' f a = f . tuple a
-- curry' f = (.) f . tuple
curry' = (. tuple) . (.)
