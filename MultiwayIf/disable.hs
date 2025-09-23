handle :: Int -> Int -> String
handle x y 
    | x == 1 = "a"
    | y < 2 = "b"
    | otherwise =  "c"