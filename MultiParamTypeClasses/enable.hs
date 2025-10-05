class GMap k v m where 
    empty :: m k v
    myinsert :: k -> v -> m k v-> m k v
    mylookup :: k -> m k v -> Maybe v

data TupleList k v = Tuple [(k, v)]

instance Eq k => GMap k v TupleList where
    empty = Tuple []
    myinsert k v (Tuple xs) = Tuple ((k, v):xs)
    mylookup k (Tuple xs) = lookup k xs


-- multiParam classes emphasize the relationship between types
-- well, you main say. hah? why I need this to write a GMap?, I can write like this
-- then you have no information about k, so you can't assert k is Eq
-- well, then you may see, hah, let me use the constrained class methods extension

class GMap' m where
    empty' :: Eq k => m k v
    myinsert' :: Eq k => k -> v -> m k v -> m k v
    mylookup' :: Eq k => k -> m k v -> Maybe v

instance GMap' TupleList where
    empty' = Tuple []
    myinsert' k v (Tuple xs) = Tuple ((k, v):xs)
    mylookup' k (Tuple xs) = lookup k xs

-- okay, but you write it inner, you say, hey,
-- MyGmap Only allow k to be Eq,
-- But what if I don't want it to be Eq or it needn't (like i don't use lookup)
-- like this,(don't struggle to say it should be Eq, of course every ADT is Eq, I just try to explain the idea)
-- (i need a new tupleList, the reason you can see in functiondependecy)
data TupleList' k v = Tuple' [(k, v)]
data Bad = Bad1 | Bad2

instance GMap Bad Int TupleList' where
    empty = Tuple' []
    myinsert k v (Tuple' xs) = Tuple' ((k, v):xs)
    mylookup k (Tuple' []) = Nothing
    mylookup k (Tuple' ((k', v'):xs)) = 
        case k' of 
            Bad1 -> Just v'
            Bad2 -> mylookup k (Tuple' xs)

main :: IO()
main = do
    print $ mylookup 1 (myinsert 1 "hello" (empty :: TupleList Int String))
    print $ mylookup' 1 (myinsert' 1"hello" (empty' :: TupleList Int String))
    print $ mylookup Bad1 (myinsert Bad1 1 (empty :: TupleList' Bad Int))