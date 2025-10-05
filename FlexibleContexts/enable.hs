--auto enable

data MyMaybe a b = MyJust a b

myEq :: Eq (MyMaybe a b) => MyMaybe a b -> MyMaybe a b -> Bool
myEq = (==)