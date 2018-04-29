module Church where

-- zero f x = x
-- zero = flip const
zero :: a -> b -> b
zero = const id -- point-free

-- one = apply
-- one = ($)
one :: (a -> b) -> a -> b
one f x = f x

-- two f x = f $ f x
-- two f = compose f f
-- two f = f . f
-- two = s compose identity
-- two = s (.) id
two :: (a -> a) -> a -> a
two = (.) <*> id

inc :: ((a -> b) -> c -> a) -> (a -> b) -> c -> b
inc n f x = f (n f x)

unchurch :: (Num a, Num b) => ((a -> a) -> b -> c) -> c
unchurch n = n (+1) 0

church :: (Eq a, Num a) => a -> (b -> b) -> b -> b
church 0 _ x = x -- zero
church n f x = f $ church (n - 1) f x

-- add a b f x = a f $ b f x
add a b f = a f . b f


-- mul a b f x = a (b f) x
-- mul a b f = a (b f)
-- mul = compose
-- mul a b =  a . b
mul :: (b -> c) -> (a -> b) -> a -> c
mul = (.)

-- true a b = a
true :: a -> b -> a
true = const

-- false a b = b
false :: a -> b -> b
false = zero

-- if' b t f = b t f
if' :: a -> a
if' = id

isZero n = n (const false) true

toNum b = b one zero

and' a b = a b false
or' a b = a true b
not' a = a false true

-- map (unchurch . toNum) $ table and' -> [0,0,0,1]
-- map = (<$>)
-- unchurch . toNum <$> table or' -> [0,1,1,1]
-- unchurch $ toNum $ not' true -> 0
-- unchurch $ toNum $ not' false -> 1
table f = 
    [ f false false
    , f false true
    , f true false
    , f true true
    ]

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
curry' f a  = f . tuple a
