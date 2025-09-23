{-#LANGUAGE OverloadedLists, LambdaCase, TypeFamilies#-}
import Data.Set hiding(toList, fromList)
import Data.Map hiding(toList, fromList)
import Distribution.Simple (KnownExtension(LambdaCase, BlockArguments, TypeFamilies))
import GHC.Exts (IsList(..))

testset :: Set Int
testset = [1, 2, 3]

testmap :: Map Int Int
testmap = [(1, 2)]

data MyList a = Nil | List a  (MyList a)

--it use an associated type so typefamilies needed
instance IsList (MyList a) where
    type Item (MyList a) = a
    toList = \case 
        Nil -> []
        List x y -> x : toList y
    fromList = \case 
        [] -> Nil
        x : xs -> List x (fromList xs)

testMy :: MyList Int
testMy = [1, 2, 3]


