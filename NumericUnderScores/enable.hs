--auto enable this
--enable you to write int like xxx_xxx in many form, which is more beautiful
test1 :: Integer
test1 = 1_00_1

test2 :: Integer
test2 = 0xffff_ffff

main :: IO ()
main = do print test2