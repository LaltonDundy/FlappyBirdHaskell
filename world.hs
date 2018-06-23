module World where

import Control.Applicative
import Graphics.Gloss.Data.Color
import Graphics.Gloss.Data.Picture
import Graphics.Gloss.Data.Display
import Objects


data PausedState = PausedState {
    
    resumePressed :: Bool

    } deriving (Show, Eq)

data PlayState = PlayState {
    
    isHit :: Bool

    } deriving (Show, Eq)

data GameState = 
    Paused PausedState | Playing PlayState deriving (Show, Eq)

data World = World {

    pos       :: Float,
    
    timeStamp :: Float,

    time     :: Float,
    
    isPaused :: Bool,

    state :: GameState
 
   } deriving (Show, Eq)


defaultWorld = World {
  
    pos = 0.0,

    timeStamp = 0.0,

    time     = 0.0, 

    isPaused = False,

    state = Paused  $

        PausedState {

            resumePressed = False

            } 
    }


render :: World -> IO Picture
render w =

    -- where bird position should be
    let birdPaus = fmap  

                  (
                  case (state w) of

                -- going up and down when paused
                  Paused s ->   translate 0.0 ((*5).cos.(*10).time $ w) 
                  
                  Playing s ->  translate 0.0 (pos w) 

                  )
                  bird 

    in
    case (state w) of
    

        Paused s -> fmap pictures $ do

                    bg <- background
                    fg <- foreground
                    bird <- birdPaus
                    return $
                        bg : fg : bird : []



        Playing s -> fmap pictures $ do
       
                     bg <- background
                     fg <- foreground
                     bird <- birdPaus
                     return $
                         bg : fg : bird : [] 
                             

