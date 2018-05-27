{-# LANGUAGE NoImplicitPrelude #-}

module NonEmpty where

import Prelude (Foldable(foldr), Functor(fmap), Show, Int, ($))
import Data.Semigroup (Semigroup((<>)))

import List(List(Empty), (%))

data NonEmpty a = NonEmpty a (List a) deriving (Show)

instance Foldable NonEmpty where
    foldr f acc (NonEmpty x xs) = foldr f (f x acc) xs

-- ne_1 <> ne_5 -> NonEmpty 37 [2, 3, 5, 7, 11]
instance Semigroup (NonEmpty a) where
    (<>) (NonEmpty a as) (NonEmpty b bs) = NonEmpty a $ as <> (b % bs)

instance Functor NonEmpty where
    fmap f (NonEmpty a as) = NonEmpty (f a) $ fmap f as

single :: a -> NonEmpty a
single x = NonEmpty x Empty

head :: NonEmpty a -> a
head (NonEmpty x _) = x

tail :: NonEmpty a -> List a
tail (NonEmpty _ xs) = xs

ne_1 :: NonEmpty Int
ne_1 = single 37

ne_5 :: NonEmpty Int
ne_5 = NonEmpty 2 $ 3 % 5 % 7 % 11 % Empty
