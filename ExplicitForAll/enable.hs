--auto enable, no use when just use it, but many other extension depend it
f :: forall a. a -> a 
f = id

-- I will give my thoughts of what forall real did,
-- like declare a variation, forall declare a Type, its scope will be limited in this function
-- which mean it will be a global var, and that's why in where sth will occur(see in ScopedTypeVariables)
-- g :: forall n . (n -> n) -> (Int, Int)
-- g f = (f 1, f 1)
-- it won't work, because the signature means for every kind of func takes a type n return n can apply,
-- so f :: String -> String is ok too, 
-- to the point, the f is not polymorphic in the context, g is polymorphic, but in the context of g,
-- n is a clear type
-- then we thought this will be okay
-- g :: (forall n . n -> n) -> (Int, Int)
-- then f is polymorphic! but ghc can't understand it
-- to enable it, see the RankNTypes