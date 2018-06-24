{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE InstanceSigs #-}

module Maybe where

import Prelude (Show, ($))
import Data.Semigroup (Semigroup((<>)))
import Data.Monoid (Monoid(mempty))
import Data.Functor (Functor(fmap))
import Control.Applicative (Applicative(pure, (<*>)))
import Control.Monad (Monad((>>=)))

data Maybe a
  = Nothing
  | Just a
  deriving (Show)

instance Functor Maybe where
  fmap :: (a -> b) -> Maybe a -> Maybe b
  fmap _ Nothing = Nothing
  fmap f (Just x) = Just (f x)

-- (+) <$> Just 7 <*>  Just 3 -> Just 10
-- addMaybe = liftA2 (+)
instance Applicative Maybe where
  pure :: a -> Maybe a
  pure = Just

  (<*>) :: Maybe (a -> b) -> Maybe a -> Maybe b
  (<*>) (Just f) (Just a) = Just (f a)
  (<*>) _         _       = Nothing

instance Monad Maybe where
  (>>=) :: Maybe a -> (a -> Maybe b) -> Maybe b
  Nothing >>= _ = Nothing
  Just a  >>= f = f a

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
