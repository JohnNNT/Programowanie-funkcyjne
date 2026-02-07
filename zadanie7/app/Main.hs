{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE DeriveGeneric #-}

module Main where

import AllInts

import Web.Scotty

main :: IO ()
main = scotty 3000 $ do
    {-# Funkcja przyjmuje liczbę całkowitą i zwraca kolejną w ciągu liczb losowych #-}
    post "/randomIntUserInput" getNextIntUserInput