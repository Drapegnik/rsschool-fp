{-# LANGUAGE NamedFieldPuns #-}

module Filter where

import Predicate (Predicate, not')
import Prelude hiding (floor)
import qualified Prelude

data Region
  = Central
  | Park
  deriving (Show, Eq)

data Floor
  = Ground
  | Floor Int
  | Attic
  deriving (Show, Eq)

instance Ord Floor where
  compare Ground Ground = EQ
  compare Ground _ = LT
  compare Attic Attic = EQ
  compare Attic _ = GT
  compare (Floor a) (Floor b) = compare a b
  compare (Floor _) Ground = GT
  compare (Floor _) Attic = LT

data Apartment = Apartment
  { address :: String
  , rooms :: Int
  , rent :: Float
  , region :: Region
  , area :: Float
  , floor :: Floor
  , lift :: Bool
  } deriving (Show)

data Filter a
  = Condition (Predicate a)
  | And [Filter a]
  | Or [Filter a]
  | Not (Filter a)

is :: (r -> a) -> Predicate a -> Predicate r
is = flip (.)

oneOf :: Eq a => (r -> a) -> [a] -> Filter r
oneOf f = Or . map (Condition . equals f)

equals :: Eq a => (r -> a) -> a -> Predicate r
equals f v = f `is` (== v)

applyFilter :: Filter a -> a -> Bool
applyFilter (Condition pr) v = pr v
applyFilter (And filters) v = and $ map (flip applyFilter $ v) filters
applyFilter (Or filters) v = or $ map (flip applyFilter $ v) filters
applyFilter (Not f) v = not $ (applyFilter f v)

invert :: Filter a -> Filter a
invert (Condition pr) = Condition $ not' pr
invert (And filters) = Or $ map invert filters
invert (Or filters) = And $ map invert filters
invert (Not f) = f

rentFilter :: Filter Apartment
rentFilter = Condition $ rent `is` (< 800)

preciseArea :: Filter Apartment
preciseArea =
  Condition $ \(Apartment {area}) -> Prelude.floor area /= ceiling area

isCentral :: Filter Apartment
isCentral = Condition $ region `equals` Central

regionFilter :: [Region] -> Filter Apartment
regionFilter = oneOf region

isGroundFloor :: Filter Apartment
isGroundFloor = Condition $ floor `equals` Ground

hasLift :: Filter Apartment
hasLift = Condition $ lift `equals` True

eurPerSqm :: Apartment -> Float
eurPerSqm (Apartment {area, rent}) = rent / area

aptFilter :: Filter Apartment
aptFilter =
  And
    [ Not isGroundFloor
    , Or [Condition $ floor `is` (< Floor 4), hasLift]
    , Condition $ eurPerSqm `is` (< 13)
    , regionFilter [Central]
    ]

-- filter (applyFilter aptFilter) apartments
apartments :: [Apartment]
apartments =
  [ Apartment
      { address = "Central Square, 18"
      , rooms = 1
      , rent = 620.0
      , region = Central
      , area = 50.0
      , floor = Ground
      , lift = False
      }
  , Apartment
      { address = "Park str, 48"
      , rooms = 3
      , rent = 1620.0
      , region = Park
      , area = 141.1
      , floor = Floor 6
      , lift = True
      }
  , Apartment
      { address = "Central Square, 43"
      , rooms = 3
      , rent = 790.0
      , region = Central
      , area = 96.5
      , floor = Floor 2
      , lift = False
      }
  ]
