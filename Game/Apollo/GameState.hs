module Game.Apollo.GameState where

import Control.Monad.State
import System.Console.ANSI
import Game.Apollo.Types
import System.IO

initialiseGame :: IO ()
initialiseGame = clearScreen >> hSetEcho stdin False >> hideCursor

runGame :: String -> a -> Game a () -> IO a
runGame t s f = setTitle t >> initialiseGame >> execStateT f (GameState (0,0) [] s) >>= (\(GameState _ _ v) -> return v)