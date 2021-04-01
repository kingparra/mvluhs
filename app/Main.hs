module Main where
import System.Directory (renamePath)
import System.FilePath (splitPath, (</>))
import System.Environment (getArgs)
import Data.Char (toLower, isSpace)

isGoodChar = (`elem` "1234567890abcdefghijklmnopqrstuvwxyz.-_")
lowerUnderscore = map (toLower . (\c -> if isSpace c
                                        then '_'
                                        else c))
sanitize x = filter isGoodChar $ lowerUnderscore x

main :: IO ()
main = do
  args <- getArgs
  mapM_ (\x -> renamePath x ((concat $ init $ splitPath x) </>
                             (sanitize $ last $ splitPath x))
        ) args
