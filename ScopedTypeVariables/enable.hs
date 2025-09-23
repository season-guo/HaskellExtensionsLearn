{-#LANGUAGE ScopedTypeVariables #-}

-- need forall, I think it as declare a type with constraint
f ::  forall a . (Eq a) => a -> a -> Bool
f = go 
    where 
        go :: a -> a -> Bool
        --if disable, it can't see a as Eq
        go = (==)