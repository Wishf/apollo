{-# LANGUAGE ForeignFunctionInterface #-}

module Game.Apollo.Plat.Win.Input(readKey) where

import Foreign.C.Types
import Foreign.C.String

import Control.Monad

foreign import ccall "conio.h _getch" getch :: IO CChar

readKey :: IO Char
readKey = liftM castCCharToChar getch