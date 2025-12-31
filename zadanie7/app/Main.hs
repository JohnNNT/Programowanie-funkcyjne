{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE DeriveGeneric #-}

module Main where

import AllInts

import Network.Wai.Handler.Warp
import Web.Scotty

main :: IO ()
main = scottyOpts (Options{verbose=1, settings=setFdCacheDuration 0 (setFileInfoCacheDuration 0 defaultSettings)}) $ do
    put "/randomInt" doWork