module ChurchBool where

-- true a b = a
true :: a -> b -> a
true = const

-- false a b = b
-- false = zero
false :: a -> b -> b
false = const id

-- if' b t f = b t f
if' :: a -> a
if' = id

and' a b = a b false

or' a b = a true b

xor' a b = a (not b) b

not' a = a false true

-- map (unchurch . toChurchNum) $ table and' -> [0,0,0,1]
-- map = (<$>)
-- unchurch . toChurchNum <$> table or' -> [0,1,1,1]
-- unchurch . toChurchNum <$> table xor' -> [0,1,1,0]
-- unchurch $ toChurchNum $ not' true -> 0
-- unchurch $ toChurchNum $ not' false -> 1
table f = [f false false, f false true, f true false, f true true]
