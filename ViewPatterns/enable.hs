{-#LANGUAGE ViewPatterns #-}
import Data.Sequence.Internal

test :: Seq a -> Maybe a
test (viewr -> xs :> x) = Just x
test (viewr -> EmptyR) = Nothing