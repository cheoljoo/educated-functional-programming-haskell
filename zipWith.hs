r1 = zipWith (*) [1,2,3,4] [5,6,7,8]

r2 = zipWith max [1,8,9,3] [2,3,7,8]
-- [2,8,9,8]

r3 = zipWith (++) ["A","B","C"] ["A","Y","X"]
-- ["AA" , "BY" , "CX"]

-- (*) [1,1,1] [1,2,3,4,5,6,....]
r4 = zipWith (*) (replicate 3 1) [1..]
-- [1,2,3]

-- zipWith : three argument function
-- zipWith (+)  : two argument function , two list
r5 = zipWith (+) [1,2,3,4] [5,6,7,8]
-- [6,8,10,12]

r6 = zipWith (zipWith (+)) [[1,2],[3,4],[5,6]]   [[10,20],[30,40],[50,60]]
-- [  [11,22] , [33,44]  , [55,66]  ]


-- implement zipWith
myzipWith :: (a->b->c)->[a]->[b]->[c]
myzipWith _ [] _ = []
myzipWith _ _ [] = []
myzipWith f (x:xs) (y:ys) =  f x y : myzipWith f xs ys






