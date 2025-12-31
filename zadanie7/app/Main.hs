{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE DeriveGeneric #-}

module Main where

import AllInts

import Network.Wai.Handler.Warp
import Web.Scotty

main :: IO ()
main = scotty 3000 $ do
    post "/randomIntUserInput" getNextIntUserInput