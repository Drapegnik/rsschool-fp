{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE PackageImports #-}

module Base where

import "lambda-calculus" Base (constant, flip', compose, apply)

const = constant

flip = flip'

(.) = compose

($) = apply
