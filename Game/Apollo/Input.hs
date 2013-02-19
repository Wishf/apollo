{-# LANGUAGE CPP #-}

module Game.Apollo.Input(

#if defined(WINDOWS)
		module Game.Apollo.Plat.Win.Input
#else
		module Game.Apollo.Plat.Unix.Input
#endif

)
where

#if defined(WINDOWS)
		import Game.Apollo.Plat.Win.Input
#else
		import Game.Apollo.Plat.Unix.Input
#endif