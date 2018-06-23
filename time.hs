module Time (timeF) where

import World
import Graphics.Gloss

timeF :: Float -> World -> IO World
timeF t w = case (state w) of

            -- time  handling in playing mode
            Playing s -> if isHit s then -- check if bird is tapped

                                -- check time since last hit
                                if ( (time w) - (timeStamp w))  > 0.5 then

                                        -- if time has been too long then the bird is no longer going up
                                        return $ w { time = (time w) + t,
                                                     state = Playing $ s { isHit = False }
                                                    }

                                else
                                        -- simulate decreasing acceleration in position
                                        let add = (timeStamp w) / (time w) in

                                        return $ w {pos = (pos w) + add,
                                                    time = (time w) + t}

                          else
                            -- just falling
                              return $ w {time = (time w) + t,
                                          pos = (pos w) - 10}



            -- time  handling in paused mode
            Paused s -> return $ w { time = (time w) + t }

