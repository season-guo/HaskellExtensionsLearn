--GHC 9.6 will auto import the TupleSections Extension so no need to declare here, when you try write lambda to gen easy tuple 
--it will suggest you to use then extension

main :: IO ()
main = print $ map (1, "hello", 6.5,, [5, 5, 6, 7], 3) [Just (), Nothing]
