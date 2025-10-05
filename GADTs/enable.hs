{-#LANGUAGE GADTs, ExplicitForAll#-}

-- GADTs is an extension of normal ADT
-- use Maybe as example
data MyMaybe a = MyJust a | MyNothing
-- GADTs syntax
data MyMaybe' a where
    MyJust' :: a -> MyMaybe' a
    MyNothing' :: MyMaybe' a

-- well, you may ask, what is the difference?
-- it seems that the latter just change the value constructor from a row into two row
-- well, what if we write
data MyMaybe'' a where
    MyIntJust'' :: Int -> MyMaybe'' Int 
    MyIntNothing'' :: MyMaybe'' Int

-- now we can see that the type parameter a is fixed to Int in MyMaybe''
-- you can not write a value constructor with a excat type, what you only can do is forall
-- even you turn on ExistentialQuantification extension, you just can use typeclass constraint
-- worse, you can not use type variable in the data declaration
{-#LANGUAGE ExistentialQuantification#-}

data MyMaybe3 = forall a. Show a => MyJust3 a | MyNothing3

-- a classic example is the expression tree

data Expr = I Int | B Bool | Add Expr Expr | Eq Expr Expr

-- you can still apply B True to Add, becasuse B True :: forall a. Expr a, it can still be unified to Expr Int
-- but if we use GADTs, we can prevent this by specifying B True :: Expr Bool

data Expr' a where
    I' :: Int -> Expr' Int
    B' :: Bool -> Expr' Bool
    Add' :: Expr' Int -> Expr' Int -> Expr' Int
    Eq' :: Expr' Int -> Expr' Int -> Expr' Bool