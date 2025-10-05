{-#LANGUAGE FunctionalDependencies#-}
-- in multiparam we talk about we need to new a type then as same as the TupleList
-- that's becase here
class GMap k v m where 
    empty :: m k v
    myinsert :: k -> v -> m k v-> m k v
    mylookup :: k -> m k v -> Maybe v

newtype TupleList k v = Tuple [(k, v)]

-- we implement forall k. Eq k, 
-- so if you try to instance GMap Int Int TupleList
-- it has been instanced, beacase Int is Eq

instance Eq k => GMap k v TupleList where
    empty = Tuple []
    myinsert k v (Tuple xs) = Tuple ((k, v):xs)
    mylookup k (Tuple xs) = lookup k xs

{-instance GMap Int Int TupleList where
    empty = Tuple []
    myinsert k v (Tuple xs) = Tuple ((k, v):xs)
    mylookup k (Tuple xs) = lookup k xs
-}

-- then we need FunctionDependencies, 
-- the GMap instance is not suitable
-- because k is not related to v
-- so we write another class

class ToList a b | a -> b where 
    toList :: [a] -> b

instance ToList Int [Int] where
    toList xs = xs

-- well, this is not the most useful part
-- haskell has a check called ambiguous check
-- it will complain if it can't determine the type of a function's argument and return
-- forExample 
{-
badFunc :: Eq a => Int
badFunc = 1
-}
-- you say a is Eq, but what is a?
-- it's ambiguous, so it won't let you go
-- you can use an extension to  avoid this check, but that's not what we want to talk here
-- what i want to say is funcdp can help to cross this
-- this is not allowed
{-
badFunc2 :: GMap k v m => k -> v -> Int
badFunc2 k v = 1
-}
-- but this is allowed
goodFunc :: ToList a b => a -> Int
goodFunc a = 1
-- because you add function dependecies a -> b, 
-- so ghc know that's only one b for a, it will find it itself

