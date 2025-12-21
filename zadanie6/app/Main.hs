{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE DeriveGeneric #-}

module Main where

import Web.Scotty
import CheckSorting

main :: IO ()
main = scotty 3000 $ do
    post "/isSorted" check_sorting