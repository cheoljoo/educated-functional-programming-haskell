-- project 4-1
data Tree a = Empty | Node a (Tree a) (Tree a) deriving (Show , Read, Eq)

insertTree :: (Ord a) => a -> Tree a -> Tree a
insertTree x Empty = Node x Empty Empty
insertTree x (Node v t1 t2)
    | x == v = Node v t1 t2
    | x > v  = Node v t1 (insertTree x t2)
    | x < v  = Node v (insertTree x t1) t2

r1 = insertTree 10 Empty


r2 = insertTree 20 (Node 10 Empty Empty)



-- project 4-2
st = [1,3,5,7,2,4,6,8]
tree = foldr insertTree Empty st

elemTree :: (Ord a) => a -> Tree a -> Bool
elemTree x Empty = False
elemTree x (Node v t1 t2)
    | x == v = True
    | x > v  = elemTree x t2
    | x < v  = elemTree x t1

r3 = elemTree 5 tree

r4 = elemTree 15 tree
