{-#LANGUAGE RecordWildCards#-}

data Person = Person { name :: String, age :: Int}

person :: Person
person = Person { name = "Alice", age = 30 }

main :: IO ()
main = print $ let Person{..} = person in (name, age) 