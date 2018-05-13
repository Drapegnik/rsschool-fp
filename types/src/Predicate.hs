module Predicate where

type Predicate a = a -> Bool

and' :: Predicate a -> Predicate a -> Predicate a
and' predA predB v = predA v && predB v

or' :: Predicate a -> Predicate a -> Predicate a
or' predA predB v = predA v || predB v

not' :: Predicate a -> Predicate a
not' predA v = not $ predA v
