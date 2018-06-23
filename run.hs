module Run where

import Graphics.Gloss.Interface.IO.Game
import Graphics.Gloss.Data.Color
import Graphics.Gloss.Data.Picture
import Graphics.Gloss.Data.Display
import Sound.ALUT
import Utils
import World
import Events
import Time

run = 
    playIO                                         -- 
    (InWindow "Flappy Bird" (300,500) (100,100))   -- SetUp Window
    (makeColorI 255 255 255 255)                   -- default color
    20                                             -- updates per second
    defaultWorld                                   -- initial world
    render                                         -- rednering function
    events                                         -- event handler
    timeF                                          -- time handler
