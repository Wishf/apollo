{-# LANGUAGE CPP #-}

#if defined(WINDOWS)
module Game.Apollo.Input (
		module Game.Apollo.Plat.Win.Input
) where

import Game.Apollo.Plat.Win.Input
#elif defined(UNIX)
	module Game.Apollo.Input (
		module Game.Apollo.Plat.Unix.Input
) where

import Game.Apollo.Plat.Unix.Input
#endif

