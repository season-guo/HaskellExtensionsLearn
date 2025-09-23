{-#LANGUAGE MultiWayIf #-}


-- you may ask why not we just use guard, hmm.. think in a function that not only just do a if, it case and then do if...
-- well, I think assign to different function may be better?
handle :: Int -> Int -> String
handle x y = if
    | x == 1 -> "a"
    | y < 2 -> "b"
    | otherwise -> "c"