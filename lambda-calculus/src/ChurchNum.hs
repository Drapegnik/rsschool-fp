module ChurchNum where

import ChurchBool (true, false)

-- zero f x = x
-- zero = flip const
zero :: a -> b -> b
zero = const id -- point-free

-- one = apply
-- one f x = f x
one :: (a -> b) -> a -> b
one = ($)

-- two f x = f $ f x
-- two f = compose f f
-- two f = f . f
-- two = s compose identity
-- two = s (.) id
two :: (a -> a) -> a -> a
two = (.) <*> id

inc :: ((a -> b) -> c -> a) -> (a -> b) -> c -> b
inc n f x = f (n f x)

dec n f x = extract $ n inc' const'
    where 
        inc'    g h = h $ g f
        const'  _   = x
        extract v   = v id

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

isZero n = n (const false) true

toChurchNum b = b one zero
