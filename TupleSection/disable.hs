{-# LANGUAGE NoTupleSections #-}

-- we can't use section so we need to map like this
main :: IO ()
main = print $ map (\x -> (x, 100)) [1, 2, 3]

