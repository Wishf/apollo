module Lib.GameState where

import Control.Monad.State
import System.Console.ANSI
import Lib.Types
import System.IO

initialiseGame :: IO ()
initialiseGame = clearScreen >> hSetEcho stdin False

runGame :: a -> Game a () -> IO a
runGame s f = initialiseGame >> execStateT f (GameState ((0,0), [], s)) >>= (\(GameState (_, _, v)) -> return v)