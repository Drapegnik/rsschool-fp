{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE InstanceSigs #-}

module List where

import Prelude (Functor(fmap), Foldable(foldr, foldl), Int, Show(show), (+), (*), (++), (-), (==))
import Data.Semigroup (Semigroup((<>)))
import Data.Monoid (Monoid(mempty))
import Control.Applicative (Applicative(pure, (<*>)))

import Base (($), (.), const, flip)
import Bool (Bool, if')
import Maybe (Maybe(Just, Nothing))


data List a
  = Empty -- NILL
  | Cons a
         (List a)

instance (Show a) => Show (List a) where
  show list = "[" ++ print list ++ "]"
    where
      print Empty = ""
      print (Cons h Empty) = show h
      print (Cons h t) = show h ++ ", " ++ print t

instance Foldable List where
  foldr :: (a -> b -> b) -> b -> List a -> b
  foldr _ acc Empty = acc
  foldr f acc (Cons h t) = f h (foldr f acc t)

instance Functor List where
  fmap = map

-- (+1) % (^2) % (*5) % Empty <*> 2 % 5 % 10 % 11 % Empty
-- [55, 121, 12, 50, 100, 11, 25, 25, 6, 10, 4, 3]
instance Applicative List where
  pure :: a -> List a
  pure a = Cons a Empty

  (<*>) :: List (a -> b) -> List a -> List b
  (<*>) lf la = foldl (\acc a -> foldl (\acc' f -> Cons (f a) acc') acc lf) Empty la 

instance Semigroup (List a) where
  (<>) = concat

instance Monoid (List a) where
  mempty = Empty

infixr 5 % -- ??

(%) :: a -> List a -> List a
(%) = Cons -- = (:)

l3 :: List Int
l3 = 2 % 5 % 9 % Empty 

-- foldl :: (b -> a -> b) -> b -> List a -> b
-- foldl _ acc Empty = acc
-- foldl f acc (Cons h t) = foldl f (f acc h) t

-- sum l3 -> 16
sum :: List Int -> Int
sum = foldl (+) 0

-- product l3 -> 90
product :: List Int -> Int
product = foldl (*) 1

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

zeroTo :: Int -> List Int
zeroTo 0 = Cons 0 Empty
zeroTo n = append n $ zeroTo (n - 1)

range :: Int -> Int -> List Int
range f t =
  if (f == t)
    then Cons f Empty
    else prepend f $ range (f + 1) t

repeat :: Int -> a -> List a
repeat 0 x = Cons x Empty
repeat n x = prepend x $ repeat (n - 1) x

concat :: List a -> List a -> List a
concat listA listB = foldr prepend listB listA

concatMap :: (a -> List b) -> List a -> List b
concatMap f list = foldl (\acc item -> concat acc (f item)) Empty list

head :: List a -> Maybe a
head Empty = Nothing
head (Cons h _) = Just h

tail :: List a -> Maybe (List a)
tail Empty = Nothing
tail (Cons _ t) = Just t
