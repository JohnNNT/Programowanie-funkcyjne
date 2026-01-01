{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE DeriveGeneric #-}

module Main where

import FunctorHandler

import Web.Scotty

main :: IO ()
main = scotty 3000 $ do
    post "/randomIntUserInput" performFunctorEquation