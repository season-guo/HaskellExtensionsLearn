import Data.Sequence.Internal

test :: Seq a -> Maybe a
test seq = case viewr seq of
    EmptyR -> Nothing
    xs :> x -> Just x