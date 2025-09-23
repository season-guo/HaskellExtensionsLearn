{-#LANGUAGE OverloadedStrings #-}
import Data.Text
import Data.String

s :: Text
s = "1"

newtype Mystr = Mystr String

instance IsString Mystr where
    fromString = Mystr 

test :: Mystr
test = "I love"