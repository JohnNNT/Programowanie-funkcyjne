{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE DeriveGeneric #-}

module AllInts where

import System.IO
import GHC.IO
import GHC.Generics
import Data.Aeson (FromJSON, ToJSON)
import Web.Scotty
import Data.Time.Clock.System

newtype RandomIntJSON = RandomIntJSON {
    value :: Int
} deriving (Generic, Show)

instance ToJSON RandomIntJSON
instance FromJSON RandomIntJSON

maxRange :: Integer
maxRange = fromIntegral (maxBound :: Int) + 1


-- Algorytm korzysta z generatora LGC
nextRandInt :: Int -> Int
nextRandInt previous = fromIntegral (mod (fromIntegral ((4611686018427388000*2+1)*(fromIntegral previous) + 777777)) maxRange)

getNextIntUserInput :: ActionM()
getNextIntUserInput = do
    previous <- jsonData :: ActionM RandomIntJSON
    json $ (RandomIntJSON{value=(nextRandInt (value previous))})    