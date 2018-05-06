{-# LANGUAGE NoImplicitPrelude #-}

module Main where

import Prelude (IO, Int, Show(show), String, (++), (+), pure)

swap :: (a, b) -> (b, a)
swap (a, b) = (b, a)

($) :: (a -> b) -> a -> b
($) f x = f x

data Bool
    = False
    | True
    deriving (Show)

data Month
    = December
    | Junuary
    | February
    | May
    deriving (Show)

data DisplayedDate
    = Now
    | DaysAgo Int
    | Date Month Int

-- formatDate Now -> "now"
-- formatDate $ DaysAgo 0 -> "today"
-- formatDate $ DaysAgo 5 -> "5 days ago"
-- formatDate $ Date May 1984 -> "May, 1984"
formatDate :: DisplayedDate -> String
formatDate Now = "now"
formatDate (DaysAgo 0) = "today"
formatDate (DaysAgo days) = show days ++ " days ago"
formatDate (Date month year) = show month ++ ", " ++ show year

data Maybe a
    = Nothing
    | Just a

data List a
    = Empty -- NILL
    | Cons a (List a)
    deriving (Show)

l3 :: List Int
l3 = Cons 2 (Cons 5 (Cons 9 Empty))

-- length l3 -> 3
length :: List a -> Int
length Empty = 0
length (Cons _ t) = 1 + length t

main :: IO ()
main = pure ()
