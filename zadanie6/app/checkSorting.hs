{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE DeriveGeneric #-}

module CheckSorting where

import GHC.Generics
import Data.Aeson
import Data.Text (Text)
import Web.Scotty

data SortingCheckingJSON = SortingCheckingJSON {
    values :: [Int],
    operator :: Text
} deriving (Generic, Show)

data SortingResponseJSON = SortingResponseJSON{
    result :: Bool
} deriving (Generic, Show)

instance ToJSON SortingCheckingJSON
instance FromJSON SortingCheckingJSON

instance ToJSON SortingResponseJSON
instance FromJSON SortingResponseJSON

subtract_second :: [(Int,Int)] -> [Int]
subtract_second lists = [fst a - snd a | a <- lists]

check_order :: [Int] -> Text -> Bool
check_order list "<" = not (False `elem` [a < 0 | a <- list])
check_order list "<=" = not (False `elem` [a <= 0 | a <- list])
check_order list ">" = not (False `elem` [a > 0 | a <- list])
check_order list ">=" = not (False `elem` [a >= 0 | a <- list])
check_order _ _ = False

value_ordering :: SortingCheckingJSON -> [(Int, Int)]
value_ordering input = zip (init $ values input) (Prelude.tail $ values input)

check_sorting :: ActionM ()
check_sorting = do
    to_check <- jsonData :: ActionM SortingCheckingJSON
    json $ (SortingResponseJSON{result = check_order (subtract_second $ value_ordering to_check) $ operator to_check})