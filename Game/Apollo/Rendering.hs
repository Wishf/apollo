module Game.Apollo.Rendering where

import Data.List
import Control.Monad.State
import Game.Apollo.Coordinate
import Game.Apollo.Types
import System.Console.ANSI
import Game.Apollo.Cursor

swapChar :: Coordinate -> CoChar -> Game a ()
swapChar p (CoChar c (f, fi) (b, bi)) = moveTo p >> lift(setSGR [SetColor Foreground fi f, SetColor Background bi b] `seq` putChar c)

cls :: Game a ()
cls = lift clearScreen

resetGraphics :: IO ()
resetGraphics = setSGR []