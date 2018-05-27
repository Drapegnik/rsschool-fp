
{-# LANGUAGE NoImplicitPrelude #-}

module Endo where

import Prelude ((.), ($), id)
import Data.Semigroup (Semigroup((<>)))
import Data.Monoid (Monoid(mempty))

-- let cons42 = stimes 42 $ Endo (Cons "*")
-- appEndo cons42 Empty -> ["*", ..., "*"]
newtype Endo a = Endo { appEndo :: a -> a }

instance Semigroup (Endo a) where
    (<>) (Endo f) (Endo g) = Endo $ f . g

instance Monoid (Endo a) where
    mempty = Endo id

