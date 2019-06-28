{- type class
 - (2.1) pattern matching 

-}

translate::Int -> String -- [Char]
translate 1 = "one"
translate 2 = "two"
translate x = "sorry"

-- addPair::(Int,Int)->(Int,Int)->(Int,Int)
-- addPair p1 p2 = (fst p1 + fst p2 , snd p1 + snd p2)
-- addPair (x1,y1) (x2,y2) = (x1 + x2 , y1 + y2)  -- no need pair

addPair :: Num a => (a,a) -> (a,a) -> (a,a)  -- generic 
addPair (x1,y1) (x2,y2) = (x1 + x2 , y1 + y2)  -- no need pair


-- get each element
-- fst (1,1)  but how to get in three...
first :: (a,b,c) -> a
--first (x,y,z) = x
first (x,_,_) = x
second (_,x,_) = x
third (_,_,x) = x

-- list pattern matching  : from list -> type
myHead :: [a] -> a
myHead [] = error "myHead empty list"
myHead (x:xs) = x  -- : is cons operator. we need ( )
-- ,  is tuple
-- :  is list

-- add prior two element in list
addTwo :: Num a => [a] -> a
addTwo [] = error "addTwo empty list"
addTwo (x:[]) = error "addTwo one list"
addTwo (x:y:xs) = x + y




-- addSpace
addSpace :: [Char] -> [Char]  -- String -> String
-- addSpace (' ':xs) = ' ':xs
addSpace str@(' ':xs) = str   -- str has original string  (as pattern)
addSpace xs = ' ':xs




-- case expression
caseex::Int -> String -- [Char]
caseex x = "result is " ++ case x of 0 -> "zero"
                                     1 -> "one"
                                     2 -> "two"
                                     _ -> "all"



-- guard 
-- get grade from points
grade::Int -> Char
grade score
    | score < 60 = 'F'
    | score > 90 = 'A'
    | otherwise = 'B'



grade2:: Double -> Double -> Char
{-
grade2 score1 score2
    | (score1 + score2) /2 < 60 = 'F'
    | (score1 + score2) /2 > 90 = 'A'
    | otherwise = 'B'
    -}
grade2 score1 score2
    | score < minScore = 'F'
    | score > maxScore = 'A'
    | otherwise = 'B'
    where score = (score1 + score2) / 2
          minScore = 60
          maxScore = 90



