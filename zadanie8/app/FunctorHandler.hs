{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE DeriveGeneric #-}

module FunctorHandler where

import Data.Aeson (FromJSON, ToJSON)
import Web.Scotty
import Data.Text
import GHC.Generics

data MyMaybe x = None | Some x

instance Functor MyMaybe where
    fmap _ None = None
    fmap f (Some x) = Some (f x)

instance Show a => Show (MyMaybe a) where
    show None = "Nothing"
    show (Some a) = show a
    