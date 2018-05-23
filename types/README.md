# types

`stack ghci types`

Implement following modules & functions:

## [Base](https://github.com/Drapegnik/rsschool-fp/blob/master/types/src/Base.hs)

> Implement as many functions you would normally need from `Prelude` as possible (import only `Int`, `(+)`, `(*)` and `Show`)

* [x] `const`
* [x] `id`
* [x] `flip`
* [x] `(.)`
* [x] `($)`

## [List](https://github.com/Drapegnik/rsschool-fp/blob/master/types/src/List.hs)
[readme](http://stevelosh.com/blog/2013/03/list-out-of-lambda/)

* [x] `List` type definition (2 constructors: `Empty` and `Cons`)
* [x] `foldl`
* [x] `foldr`
* [x] `prepend`
* [x] `head`
* [x] `tail`

* [x] `zeroTo` - (e.g. `zeroTo 5 = [0, 1, 2, 3, 4, 5]`)
* [x] `range` - (e.g. `range 2 7 =  [2, 3, 4, 5, 6, 7]`)
* [x] `repeat` - (e.g. `repeat 3 9 = [9, 9, 9]`)

### with `foldl` / `foldr`
* [x] `append`
* [x] `sum`
* [x] `product`
* [x] `length`
* [x] `reverse`
* [x] `map`
* [x] `filter`
* [x] `concat`
* [x] `concatMap` (`:: (a -> List b) -> List a -> List b`)

## [Bool](https://github.com/Drapegnik/rsschool-fp/blob/master/types/src/Bool.hs)
* [x] `Bool` data type definition (`True` and `False`)
* [x] `if'`

## [MaybeMaybe](https://github.com/Drapegnik/rsschool-fp/blob/master/types/src/MaybeMaybe.hs)
* [x] `Maybe` type definition
* [x] `fmap`
* [x] `maybe`
