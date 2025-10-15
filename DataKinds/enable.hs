{-#LANGUAGE DataKinds#-}
-- The Start of Type Level Programming
data AB = A | B
data Example (x :: AB) = MkExample
-- we met many kinds of ADTs, like Maybe, Either, List, Tree, but 
-- what is A different to Example?
-- is A a type Constructor?
-- no, A is Just a Value Constructor, a normal function that return a value of type Example a
-- you can use ghci to prove it
{-
ghci> :t Just
Just :: a -> Maybe a
-}
-- just like :t normalFunc, right?
-- but when you do it to Maybe itself
{-
ghci> :t Maybe
<interactive>:1:1: error: [GHC-31891]
    • Illegal term-level use of the type constructor or class ‘Maybe’
    • imported from ‘Prelude’ (and originally defined in ‘GHC.Maybe’)
    • Perhaps use variable ‘maybe’ (imported from Prelude)
    • In the expression: Maybe
-}
-- it said it was type constructor, so you can't use :t, 
-- to see what type constructor really did, we use :k
{-
ghci> :k Maybe
Maybe :: * -> *
-}
-- * is just the forall.a int type level, 
-- in some language, * is Type, of course you can replace it with Type in Haskell
-- so Maybe is a type constructor that take a type and return a type
-- and Maybe a is a Type
-- or we can say the type of Maybe a is Type
-- but what if we lift the value into type?
-- that's what DataKinds do
s :: Example A
s = MkExample
-- here A is not a value, it's a type
-- (in fact the 'A, ghc just know what you want)
k :: Example 'A
k = MkExample
-- in contrast to normal situ, you can't build a type Maybe True