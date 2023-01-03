module Data.Medea.Parser.Spec.Schemata
  ( Specification(..)
  , parseSpecification
  ) where

import MedeaPrelude

import Data.Medea.Parser.Parsing (eol)
import Data.Medea.Parser.Spec.Schema as Schema
import Data.Medea.Parser.Types (MedeaParser)
import Parsing.Combinators (sepEndBy1)
import Parsing.String (eof)

newtype Specification
  = Specification (Array Schema.Specification)

parseSpecification :: MedeaParser Specification
parseSpecification = do
  specs <- Schema.parseSpecification `sepEndBy1` eol
  eof
  pure <<< Specification $ fromFoldable $ specs
