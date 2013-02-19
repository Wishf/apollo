module Game.Apollo.Rendering where

import Data.List
import Control.Monad.State
import Game.Apollo.Coordinate
import Game.Apollo.Types
import System.Console.ANSI
import Game.Apollo.Cursor

extractCoord :: RenderOp -> Coordinate
extractCoord (UpdateCharacter c _) = c
extractCoord (UpdateForeground c _ _) = c
extractCoord (UpdateBackground c _ _) = c

optimiseOps :: Coordinate -> [RenderOp] -> [RenderOp]
optimiseOps c = sortBy f
	where
		f a b = compare (dist c $ extractCoord a) (dist c $ extractCoord b)

draw :: Game a ()
draw = do {
	GameState (c, r, a) <- get;
	foldr (\l r -> draw' l >> r) (return ()) (optimiseOps c r);
	put.GameState $ (c, [], a);
}
	where
		draw' (UpdateCharacter p c) = moveTo p >> lift (putChar c)
		draw' (UpdateForeground p i c) = moveTo p >> lift (setSGR [SetColor Foreground i c])
		draw' (UpdateBackground p i c) = moveTo p >> lift (setSGR [SetColor Background i c])

setCharacter :: Coordinate -> Char -> Game a ()
setCharacter p c = modify f
	where
		f (GameState (cur, rq, a)) = GameState (cur, (UpdateCharacter p c):rq, a)

setForeground :: Coordinate -> ColorIntensity -> Color -> Game a ()
setForeground p i c = modify f
	where
		f (GameState (cur, rq, a)) = GameState (cur, (UpdateForeground p i c):rq, a)

setBackground :: Coordinate -> ColorIntensity -> Color -> Game a ()
setBackground p i c = modify f
	where
		f (GameState (cur, rq, a)) = GameState (cur, (UpdateBackground p i c):rq, a)

resetGraphics :: IO ()
resetGraphics = setSGR []