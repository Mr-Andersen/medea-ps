module Data.Medea.Parser.Types where

import MedeaPrelude
import Text.Parsing.Parser (Parser)

data MedeaParseErr 
  = IdentifierTooLong String 
  | LeadingZero String
  | EmptyLengthSpec

derive instance eqMedeaParseErr :: Eq MedeaParseErr

derive instance ordMedeaParseErr :: Ord MedeaParseErr

derive instance genericMedeaParseErr :: Generic MedeaParseErr _

instance showMedeaParseErr :: Show MedeaParseErr where
  show x = genericShow x

type MedeaParser = Parser String