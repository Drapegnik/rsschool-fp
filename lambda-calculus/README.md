# lambda-calculus

Implement following modules & functions:
> `*` Write the function in the point-free form

## [Base](https://github.com/Drapegnik/rsschool-fp/blob/master/lambda-calculus/src/Base.hs)

* [x] `identity`
* [x] `constant`
* [x] `apply`
* [x] `compose`
* [x] `flip`

## [ChurchNum](https://github.com/Drapegnik/rsschool-fp/blob/master/lambda-calculus/src/ChurchNum.hs)
Implement dec/pred as described [here](https://en.wikipedia.org/wiki/Church_encoding)

* [x] `zero`*
* [x] `one`*
* [x] `two`*
* [ ] `inc`*
* [x] `dec`
* [x] `add`
* [ ] `sub`
* [x] `mul`*


* [x] `church`
* [ ] `unchurch`*


* [x] `isZero`

## [ChurchBool](https://github.com/Drapegnik/rsschool-fp/blob/master/lambda-calculus/src/ChurchBool.hs)
* [x] `true`
* [x] `false`
* [x] `cond (if)`
* [x] `and`
* [x] `or`
* [x] `not`
* [x] `xor`


* [x] `toChurchNum`

## [Tuple](https://github.com/Drapegnik/rsschool-fp/blob/master/lambda-calculus/src/Tuple.hs)
* [x] `tuple`
* [x] `first`*
* [x] `second`
* [x] `swap`
* [x] `curry`*
* [x] `uncurry`*
