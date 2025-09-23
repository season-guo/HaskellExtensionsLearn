{-#LANGUAGE  PatternSynonyms#-}
import Distribution.Simple (KnownExtension(PatternSynonyms))

pattern Head3 :: a -> b -> c -> (a, b, c, d)
pattern Head3 a b c  <- (a, b, c, d)


test1 :: Num a => (a, b, c, d) -> a
test1 (Head3 x y z) = x

pattern Love :: b -> [(String, b)]
pattern Love a = [("Love", a)]

test2 :: [(String, Int)] -> Int
test2 (Love x) = x
test2 _ = 1000

pattern Node :: a -> b -> (a, b)
pattern Node left right = (left , right)

t :: (Integer, Integer)
t = Node 1 2 

main = do 
    print $ test1 (1, 2, 3, 4) 
    print $ test2 [("Lo", 1)]
    print t
