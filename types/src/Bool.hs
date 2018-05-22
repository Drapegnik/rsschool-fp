{-# LANGUAGE NoImplicitPrelude #-}

module Bool where

import Prelude (Show)

data Bool
  = False
  | True
  deriving (Show)

if' :: Bool -> a -> a -> a
if' True a _ = a
if' False _ b = b
