{-#LANGUAGE RankNTypes, TypeApplications #-}

rankN :: (forall n . n -> n) -> (Int, Int)
rankN f = (f 1, f 1)  