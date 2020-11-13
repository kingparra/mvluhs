module Main where
import System.Directory (renamePath)
import System.Environment (getArgs)
import Data.Char (toLower, isSpace)

main :: IO ()
main = do
  args <- getArgs
  mapM_ (\x -> renamePath x (sanitize x)) args
  where
    lowerUnderscore = map (toLower . (\c -> if isSpace c then '_' else c))
    sanitize x = filter (`elem` "1234567890abcdefghijklmnopqrstuvwxyz.-_") (lowerUnderscore x)
