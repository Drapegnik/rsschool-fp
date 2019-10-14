{-# LANGUAGE NoImplicitPrelude #-}

module Either where

import Prelude (Show, String, Int, ($), (<), (>))
import Data.Bool(otherwise)
import Data.Functor (Functor(fmap), (<$>))
import Control.Applicative (Applicative(pure, (<*>)))

data Either a b
    = Left a
    | Right b
    deriving(Show)

instance Functor (Either e) where
    fmap _ (Left e)     = Left e
    fmap f (Right a)    = Right $ f a

instance Applicative (Either e) where
    pure = Right

    Left e <*> _       = Left e
    -- Right f <*> Left e = Left e
    -- Right f <*> Right a = Left $ f a
    Right f <*> ea = f <$> ea

data Error
    = EmptyName
    | NegativeAge
    | WayTooOld
    deriving(Show)

-- User <$> (validateName "") <*> (validateAge 15)
-- liftA2 User (validateName "sdfdsf") (validateAge 156)
data User = User
    { name :: String
    , age :: Int
    } deriving(Show)

type Validator a = a -> Either Error a

validateName :: Validator String
validateName ""     = Left EmptyName
validateName name   = Right name

validateAge :: Validator Int
validateAge age | age < 0   = Left NegativeAge
                | age > 150 = Left WayTooOld
                | otherwise = Right age
