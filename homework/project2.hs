
-- Project 2-1
grade3 :: [(String,Int)] -> [(String,Int)]
grade3 [] = []
grade3 ((a,b):xs)
    | b >= 80 = (a,b): grade3 xs
    | otherwise = grade3 xs

r1 = grade3 [("Kim", 60), ("Park",80), ("Choi", 70), ("Lee", 90), ("Jung", 85)]


-- Project 2-2
r2 = filter(\(a,b) -> if b >= 80 then True else False ) [("Kim", 60), ("Park",80), ("Choi", 70), ("Lee", 90), ("Jung", 85)]



-- Project 2-3
check :: (String,Int) -> Bool
check (a,b) 
    | b >= 80 = True
    | otherwise = False

r3 = filter check [("Kim", 60), ("Park",80), ("Choi", 70), ("Lee", 90), ("Jung", 85)]
