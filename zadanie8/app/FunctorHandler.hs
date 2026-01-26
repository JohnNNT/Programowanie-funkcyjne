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
    show :: Show a => MyMaybe a -> String
    show None = "Nothing"
    show (Some a) = show a

instance Semigroup (MyMaybe [Int]) where
    Some a <> Some b = Some(a ++ b)
    None <> Some b = Some b
    Some a <> None = Some a
    None <> None = None 

data FunctorEquationJSON = FunctorEquationJSON {
    operation :: Text,
    arg1 :: Int,
    arg2 :: Int
} deriving (Show, Generic)

newtype EquationResultJSON = EquationResultJSON {
    result :: Int
} deriving (Show, Generic)

instance ToJSON FunctorEquationJSON
instance FromJSON FunctorEquationJSON

instance ToJSON EquationResultJSON
instance FromJSON EquationResultJSON

performEquation :: Text -> Int -> Int -> MyMaybe Int
performEquation "+" x y = fmap (+y) (Some x)
performEquation "-" x y = fmap (+(-y)) (Some x)
performEquation "*" x y = fmap (*y) (Some x)
performEquation "/" _ 0 = Some(-1)
performEquation "/" x y = fmap (div y) (Some x)
performEquation _ _ _ = Some 0

performFunctorEquation :: ActionM ()
performFunctorEquation = do
    equationData <- jsonData :: ActionM FunctorEquationJSON
    json $ (EquationResultJSON{result = read $ show $ performEquation (operation equationData) (arg1 equationData) (arg2 equationData)})    