{-#LANGUAGE RankNTypes#-}
--rankN take a polymorphic function as input, it didn't mean rankN is polymorphism for n
rankN :: (forall n . n -> n) -> (Double, Int)
rankN f = (f 1.0, f 1)  

-- ST Monad is a very good example use this extension, it use rankN type to ensure the state can't escape
-- we don't use ST Monad to demonstrate directly, that's too complex
-- we use a simple data type to demonstrate the same idea
data MyST s a = MyST s a

runMySTSafe :: forall a. (forall s. MyST s a) -> a
runMySTSafe (MyST x y) = x
-- runMySTSafe (MyST 1 2) -- error, can't decide the type of s
-- or we can say, the type of s is the same of a, but a is not polymorphic in the context of runMySTSafe
-- but it can compile if we just declare and complete the function, unless you use it with a concrete type

-- this can't work, because in it the context of runMySTUnsafe, s is the same as a
main :: IO ()
main = print $ runMySTSafe (MyST 1 2)

-- the explanation may not be very accurate,
-- but i think u can understand ST throught it