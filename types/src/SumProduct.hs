
{-# LANGUAGE NoImplicitPrelude #-}

module SumProduct where

import Prelude (Num, Show, (+), (*), ($))
import Data.Semigroup (Semigroup((<>)))
import Data.Monoid (Monoid(mempty))

newtype Sum a = Sum { getSum :: a } deriving (Show)

instance (Num a) => Semigroup (Sum a) where
    (<>) (Sum a) (Sum b) = Sum $ a + b

instance (Num a) => Monoid (Sum a) where
    mempty = Sum 0

newtype Product a = Product { getProduct :: a } deriving (Show)

instance (Num a) => Semigroup (Product a) where
    (<>) (Product a) (Product b) = Product $ a * b

instance (Num a) => Monoid (Product a) where
    mempty = Product 1
