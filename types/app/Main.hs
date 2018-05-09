{-# LANGUAGE NoImplicitPrelude #-}

module Main where

import Prelude (IO, String, Int, Show(show), (++), pure)

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

main :: IO ()
main = pure ()
