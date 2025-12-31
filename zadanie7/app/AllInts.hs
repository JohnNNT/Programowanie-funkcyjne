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

getNextInSequence :: IO(Int)
getNextInSequence = do
    file_access <- openFile "previousInt.txt" ReadWriteMode
    is_file_empty <- hIsEOF file_access
    if is_file_empty
        then do 
            previous <- getSystemTime
            let new_value = nextRandInt (fromIntegral (systemSeconds previous))
            hPrint file_access new_value
            hClose file_access
            return new_value
        else do
            previous <- hGetLine file_access
            putStrLn previous
            let new_value = nextRandInt (read previous)
            putStrLn $ show new_value
            hSeek file_access AbsoluteSeek 0
            hPrint file_access new_value
            hClose file_access
            return new_value

maxRange :: Integer
maxRange = fromIntegral (maxBound :: Int) + 1

nextRandInt :: Int -> Int
nextRandInt previous = fromIntegral (mod (fromIntegral ((4611686018427388000*2+1)*(fromIntegral previous) + 777777)) maxRange)

doWork :: ActionM ()
doWork = do
    let newValue = unsafePerformIO getNextInSequence
    json $ (RandomIntJSON{value=newValue})

getNextIntUserInput :: ActionM()
getNextIntUserInput = do
    previous <- jsonData :: ActionM RandomIntJSON
    json $ (RandomIntJSON{value=(nextRandInt (value previous))})    