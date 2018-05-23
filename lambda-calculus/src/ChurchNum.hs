{-# LANGUAGE RankNTypes #-}
module ChurchNum where

import ChurchBool (false, true)

type Church = forall a . (a -> a) -> a -> a

-- zero f x = x
-- zero = flip const
zero :: Church
zero = const id -- point-free

-- one = apply
-- one f x = f x
one :: Church
one = ($)

-- two f x = f $ f x
-- two f = compose f f
-- two f = f . f
-- two = s compose identity
-- two = s (.) id
two :: Church
two = (.) <*> id

-- inc n f x = f (n f x)
-- inc n f = (.) (($) flip const n f) $ n f
-- inc n f = ($) flip const n f . n f
inc :: Church -> Church
inc n f = f . n f

dec :: Church -> Church
dec n f x = extract $ n inc' const'
  where
    inc' g h = h $ g f
    const' _ = x
    extract v = v id
 

-- unchurch :: Church -> Int
unchurch n = n (+ 1) 0

-- church :: Int -> Church
church 0 _ x = x -- zero
church n f x = f $ church (n - 1) f x

-- add a b f x = a f $ b f x
add :: Church -> Church -> Church
add a b f = a f . b f

-- mul a b f x = a (b f) x
-- mul a b f = a (b f)
-- mul = compose
-- mul a b =  a . b
mul :: Church -> Church -> Church
mul = (.)

isZero n = n (const false) true

toChurchNum b = b one zero
