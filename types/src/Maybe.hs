{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE InstanceSigs #-}

module Maybe where

import Prelude (Functor(fmap), Show, ($))
import Data.Semigroup (Semigroup((<>)))
import Data.Monoid (Monoid(mempty))

data Maybe a
  = Nothing
  | Just a
  deriving (Show)

instance Functor Maybe where
  fmap :: (a -> b) -> Maybe a -> Maybe b
  fmap _ Nothing = Nothing
  fmap f (Just x) = Just (f x)

instance (Semigroup a) => Semigroup (Maybe a) where
  (<>) (Just x) Nothing   = Just x
  (<>) Nothing (Just x)   = Just x
  (<>) (Just a) (Just b)  = Just $ a <> b
  (<>) _ _                = Nothing

instance (Semigroup a) => Monoid (Maybe a) where
  mempty = Nothing

maybe :: b -> (a -> b) -> Maybe a -> b
maybe fallback f mA =
  case mA of
    Nothing -> fallback
    Just x -> f x
