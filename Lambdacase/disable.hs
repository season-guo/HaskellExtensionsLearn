test1:: Maybe Int
test1 = Just 1

test2 :: Maybe Int
test2 = Nothing 

handle :: Show a => Maybe a -> String
handle = \x -> case x of
    Just v -> show v
    Nothing -> "nothing"

main :: IO ()
main = print $ handle test1 ++ handle test2