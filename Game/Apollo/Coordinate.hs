module Game.Apollo.Coordinate where

import Game.Apollo.Types

dist :: Coordinate -> Coordinate -> Double
dist (x,y) (x',y') = (sqrt.fromIntegral) ((x-x')^2 + (y-y')^2)