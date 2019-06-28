{- type class
 -

-}


foo::Int->Int->Int
foo x y = if x>y then x+y else x-y


goo::(Ord a,Num a) => a->a->a
goo x y = if x>y then x+y else x-y

koo x y = if x>y then x+y else x-y
