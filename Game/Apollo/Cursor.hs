module Game.Apollo.Cursor(up, down, left, right, moveTo) where

import Control.Monad.State
import System.Console.ANSI
import Game.Apollo.Types

deltaCursor :: Int -> Int -> GameState a -> GameState a
deltaCursor x' y' (GameState (x,y) r a) = GameState (x+x', y+y') r a

up :: Int -> Game a ()
up n = lift (cursorUp n) >> modify (deltaCursor 0 n)

down :: Int -> Game a ()
down n = lift (cursorDown n) >> modify (deltaCursor 0 (-n))

left :: Int -> Game a ()
left n = lift (cursorBackward n) >> modify (deltaCursor (-n) 0)

right :: Int -> Game a ()
right n = lift (cursorForward n) >> modify (deltaCursor n 0)

moveTo :: Coordinate -> Game a ()
moveTo (x,y) = do {
	(GameState (xi,yi) r a) <- get;
	lift (setCursorPosition y x);
	put $ GameState (x,y) r a;
}


