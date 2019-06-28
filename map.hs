r1 = map (+3) [1,2,3,4]

r2 = map("Hi " ++)["Kim" , "L" , "P"]
-- ["Hi Kim", "Hi L" , "Hi P"]

r3 = map fst [ (1,2) , (3,4) , (5,6) ] 
-- [1,3,5]

-- replicate 3 1 => [1,1,1]
r4 = map (replicate 3)[3..6]
-- [[3,3,3],[4,4,4],[5,5,5],[6,6,6]]

r5= map head [ [1,2] , [3,4] , [5,6] ]
-- [1,3,5]

r6 = map (map (*2)) [ [1,2] , [3,4] , [5,6] ]
-- [[2,4],[6,8],[10,12]]

mymap::(a -> b) -> [a] -> [b]
mymap _ [] = []
mymap f (x:xs)  = f x : mymap f xs
