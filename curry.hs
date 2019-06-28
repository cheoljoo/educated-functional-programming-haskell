-- add :: Int -> Int -> Int
add :: Int -> (Int -> Int)
add x y = x + y

add3 :: Int -> Int -> Int -> Int
add3 x y z  = x + y + z


-- add 2 number
-- add2 :: Int -> Int -> Int
-- add2 x y = x+y
add2 = add3 0   -- give another name ( use like a function )


-- km to m
-- km2m :: Int -> Int
-- km2m km = km * 1000
km2m = (*1000)
hoo = (+5)
