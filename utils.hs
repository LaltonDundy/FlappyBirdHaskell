module Utils where

import Codec.Picture.Repa (readImageRGBA, toByteString, reverseColorChannel)
import Graphics.Gloss hiding ( play)
import Sound.ALUT

--Taken from Stack Overflow post by David Ackerman
--Width and height must equal the actuall with and height in pixels of the original png file
readPng :: FilePath -> Int -> Int -> IO Picture
readPng path w h = do
  (Right img) <- readImageRGBA path
  let bs = toByteString $ reverseColorChannel img
  return $ bitmapOfByteString w h (BitmapFormat TopToBottom PxRGBA) bs True

playSound :: FilePath -> IO ()
playSound file = do buf <- createBuffer (File file)
                    source <- genObjectName;
                    buffer source $= Just buf;
                    play [source];

