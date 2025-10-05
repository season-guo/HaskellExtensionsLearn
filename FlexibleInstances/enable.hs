--auto enable

data MyMaybe a b = MyJust a b

-- if you disable, you can't use ad-hoc here but only MyMaybe a, beacasue it will confilct when you declare a MyMaybe a otherwhere
instance Functor (MyMaybe Int) where
    fmap f (MyJust x y) = MyJust x (f y)