module Data.Medea.Parser.Parsing where

import MedeaPrelude

import Control.Alternative ((<|>))
import Parsing (ParserT, fail)
import Parsing.String (eof, string)

eol :: forall m. Monad m => ParserT String m Unit
eol = (void $ string "\n") <|> (void $ string "\r\n") <|> eof <|> fail "expected EOL"
