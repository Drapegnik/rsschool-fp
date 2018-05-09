{-# LANGUAGE NoImplicitPrelude #-}

module List where

import Prelude (Int, Show, (+))
import Base (const, flip, (.), ($))
import Bool (Bool, if')

data List a
    = Empty -- NILL
    | Cons a (List a)
    deriving (Show)

l3 :: List Int
l3 = Cons 2 (Cons 5 (Cons 9 Empty)) -- Cons = (:)
-- l3 = 2 : 5 : 9 : Empty

foldl :: (b -> a -> b) -> b -> List a -> b
foldl _ acc Empty = acc
foldl f acc (Cons h t) = foldl f (f acc h) t

-- sum l3 -> 16
sum :: List Int -> Int
sum = foldl (+) 0

foldr :: (a -> b -> b) -> b -> List a -> b
foldr _ acc Empty = acc
foldr f acc (Cons h t) = f h (foldr f acc t)

-- length l3 -> 3
length :: List a -> Int
length = foldr (const $ (+) 1) 0

-- foldl (flip prepend) Empty l3 -> [9, 5, 2]
prepend :: a -> List a -> List a
prepend = Cons

-- foldr append Empty l3 -> [0, 5, 2]
append :: a -> List a -> List a
append x Empty = Cons x Empty
append x (Cons h t) = Cons h $ append x t

-- reverse = foldr prepend Empty
reverse :: List a -> List a
reverse = foldl (flip prepend) Empty

-- map ((+) 2) l3 -> [4, 7, 11]
map :: (a -> b) -> List a -> List b
map f = foldr (prepend . f) Empty

filter :: (a -> Bool) -> List a -> List a
filter f = foldr (\x acc -> if' (f x) (Cons x acc) acc) Empty


    