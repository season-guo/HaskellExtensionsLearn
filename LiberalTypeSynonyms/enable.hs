{-#LANGUAGE LiberalTypeSynonyms#-}

type Id a  = a
type Const a b = a

type NatApp f g i = f i -> g i

myFunc :: NatApp Id (Const Int) Char
myFunc x = 1