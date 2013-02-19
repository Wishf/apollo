module Game.Apollo.Types where

import Control.Monad.State
import System.Console.ANSI

data RenderOp = UpdateCharacter Coordinate Char
			  | UpdateForeground Coordinate ColorIntensity Color
			  | UpdateBackground Coordinate ColorIntensity Color

type Coordinate = (Int,Int)

newtype GameState a = GameState (Coordinate, [RenderOp], a)

type Game a b = StateT (GameState a) IO b