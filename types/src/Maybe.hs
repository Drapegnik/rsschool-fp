{-# LANGUAGE NoImplicitPrelude #-}

module Maybe where

import Prelude (Show)

data Maybe a
    = Nothing
    | Just a
    deriving (Show)

fmap :: (a -> b) -> Maybe a -> Maybe b
fmap _ Nothing = Nothing
fmap f (Just x) = Just (f x)

maybe :: b -> (a -> b) -> Maybe a -> b
maybe fallback f mA = 
    case mA of
        Nothing -> fallback
        Just x -> f x
