module Objects where

import Utils
import Graphics.Gloss.Data.Color
import Graphics.Gloss.Data.Picture
import Graphics.Gloss.Data.Display

bird :: IO Picture
bird = readPng "./PNGfiles/bird.png" 45 32

background :: IO Picture
background = readPng "./PNGfiles/background.png" 500 500

foreground :: IO Picture
foreground = readPng "./PNGfiles/foreground.png" 500 500

