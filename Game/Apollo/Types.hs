module Game.Apollo.Types where

import Control.Monad.State
import System.Console.ANSI

data CoChar = CoChar !Char (Color, ColorIntensity) (Color, ColorIntensity)
type Line = [CoChar]
type Screen = [Line]

white :: Char -> CoChar
white c = CoChar c (White, Vivid) (Black, Dull) 

type Coordinate = (Int,Int)

data GameState a = GameState Coordinate !Screen a

type Game a b = StateT (GameState a) IO b