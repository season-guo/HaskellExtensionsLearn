{-#LANGUAGE NoTypeOperators, LambdaCase#-}

type a + b = Either a b

handle :: Int + String -> String
handle = \case 
    Left x -> show x
    Right x -> x