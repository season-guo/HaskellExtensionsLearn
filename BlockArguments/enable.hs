{-#LANGUAGE BlockArguments #-}

handle :: [Int] -> [Int]
handle = map \x -> if x > 10 then 20 else 30 

