-- project 3
substr :: [Char] -> Int -> Int -> [Char]  -- String -> String
substr [] _ _ = []
substr (x:xs)  s e
    | e == 0  = [x]
    | s == 0 = x : substr xs 0 (e-1)
    | otherwise = substr xs (s-1) (e-1)

r1 = substr "abcdef" 1 3
