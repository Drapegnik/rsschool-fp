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


* [ ] `zeroTo` - (e.g. `zeroTo 5 = [0, 1, 2, 3, 4, 5]`)
* [ ] `range` - (e.g. `range 2 7 =  [2, 3, 4, 5, 6, 7]`)
* [ ] `repeat` - (e.g. `repeat 3 9 = [9, 9, 9]`)
* [ ] `concatMap` (`:: (a -> List b) -> List a -> List b`)

### with `foldl` / `foldr`
* [x] `append`
* [ ] `sum`
* [ ] `product`
* [x] `length`
* [x] `reverse`
* [x] `map`
* [x] `filter`
* [ ] `concat`

## [Bool](https://github.com/Drapegnik/rsschool-fp/blob/master/types/src/Bool.hs)
* [x] `Bool` data type definition (`True` and `False`)
* [x] `if'`

## [MaybeMaybe](https://github.com/Drapegnik/rsschool-fp/blob/master/types/src/MaybeMaybe.hs)
* [x] `Maybe` type definition
