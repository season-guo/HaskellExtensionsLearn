{-#LANGUAGE DataKinds, TypeFamilyDependencies#-}
-- Type family is a way to define function at type level
-- the easiest example is a function take 1 type return 1 type
type family Easy a where 
    Easy a = a

{-
Let's see what it in ghci
ghci> :k Easy
Easy :: k -> k
ghci> :k Easy a
Easy a :: k
ghci> :k Easy Int
Easy Int :: *

well here appear k and *(Type),
what's the different and why?
let's see
ghci> :k a
a :: k
ghci> :k Int
Int :: *
Emmm, then?
ghci> :k Maybe
Maybe :: * -> *
ghci> :k Easy Maybe
Easy Maybe :: * -> *
that's it, a Type was just a Type, like [a], Int, Bool, etc.
but k can be not only a type, but also type Constructor, 
like * -> *, * -> * -> *, etc.
so the k is more like a in forall a
-}

-- type family can also take multiple type parameters
type family Easy2 a b where
    Easy2 Int b = b
    Easy2 a b = a

-- there's two kinds of type family, open and closed
-- open type family can be extended
-- closed type family can not be extended
-- the above two type family are closed type family
-- let's see an open type family
type family Open a 
type instance Open Int = Bool
-- well, like type class, we use instance
-- so naturally, that's also conflict and overlap
-- we use function dependency to solve the situ in type class
-- here we can use TypeFamiliesDependecies to solve the situ
type family Open2 a = r | r -> a

-- but some bugs still happen
{-type family Open3 a = r | r -> a where
    Open3 (Maybe a) =  a
Type family equation violates the family's injectivity annotation. 
RHS of injective type family equation is a bare type variable 
but these LHS type and kind patterns are not bare variables: ‘Maybe a’
-}
-- what's the injectiveity mean?
-- well we don't talk here
-- it just said ghc can't infer for any a, that's a Maybe a according to it
-- (bro, i'm not good at type theory, so i can't explain it clearly)
-- but that's unbeliveable, if we have an a, we can build a unique Maybe a, right?
-- well, ghc just can't prove it
-- in fact it didn't know it is Maybe or what other type Constructor
-- it just know it's a type Constructor * -> *
-- a easiest example is
-- Either a, you get an Int, you can build Either Int Int, Either Char Int etc.
-- well, then let's remove the r -> a
type family Open3 a where
    Open3 (Maybe a) =  a
{-
(Another better explanation)
The problem is that, 
if this were injective, 
we could take a proof that 
F4 a ~ F4 b and get a proof of a ~ b. 
Now, consider F4 (Maybe (F4 Int)). 
This reduces to F4 Int. 
Thus, we have F4 (Maybe (F4 Int)) ~ F4 Int. 
And now, by injectivity, 
we get Maybe (F4 Int) ~ Int. 
That is, a Maybe <blah> equals an Int. Terrible!
-}