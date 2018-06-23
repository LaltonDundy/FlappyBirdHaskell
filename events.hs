module Events  (events) where

import World
import Graphics.Gloss.Interface.IO.Game
import Graphics.Gloss

events :: Event -> World -> IO World
events (EventMotion _) w = return w
events (EventResize _) w = return w

events (EventKey k ks _ _ ) w 

        -- when w key is pressed
       | k == Char 'w' &&
         ks == Down      = case (state w) of

                        -- when is playing                           
                           Playing s -> return $

                               w { timeStamp = (time w),

                                    --  simulate jumping
                                   pos = (pos w) + 40,

                                   state = Playing $

                                      s { isHit = True }
                                 }

                          
                        -- when is paused
                           Paused s  -> return $

                                   let newState = PlayState {isHit = False }
                                            in

                                w { state = Playing newState }
                        

              
                                  

       | otherwise       = return w


