module Game.Apollo.Rendering where

import Data.List
import Control.Monad.State
import Game.Apollo.Coordinate
import Game.Apollo.Types
import System.Console.ANSI
import Game.Apollo.Cursor

swapChar :: Coordinate -> CoChar -> Game a ()
swapChar (x,y) c' = modify f
	where
		f (GameState cur scr a) = GameState cur (swp scr) a

		swp = foldr (\(i, l) r -> (if i == y then swp' l else l) : r) [] . zip [0..]
		swp' = foldr (\(i, c) r -> (if i == x then c' else c) : r) [] . zip [0..]

cls :: Game a ()
cls = lift clearScreen

draw :: Game a ()
draw = do {
	GameState c s a <- get;
	cls;
	foldr f (return ()) s;
}
	where
		l `f` r = foldr g (return ()) l >> r;
		(CoChar c (f, fi) (b, bi)) `g` r = lift(setSGR [SetColor Foreground fi f, SetColor Background bi b] >> putChar c) >> r

resetGraphics :: IO ()
resetGraphics = setSGR []