module Game.Apollo.GameState where

import Control.Monad.State
import System.Console.ANSI
import Game.Apollo.Types
import System.IO

initialiseGame :: IO ()
initialiseGame = clearScreen >> hSetEcho stdin False

initScreen :: Screen
initScreen = replicate 25 $ replicate 80 (CoChar ' ' (White, Vivid) (Black, Dull))

runGame :: a -> Game a () -> IO a
runGame s f = initialiseGame >> execStateT f (GameState (0,0) initScreen s) >>= (\(GameState _ _ v) -> return v)