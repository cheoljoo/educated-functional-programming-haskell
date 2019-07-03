-- People 타입 : 이름 , 나이 , 주소

{-
data People = People String Int String deriving Show

getName :: People -> String
getName (People n _ _) = n
getAge :: People -> Int
getAge (People _ n _) = n

r1 = getName (People "C" 1 "A1")
r2 = getAge (People "C" 1 "A1")

-}

-- field가 무지 많을때
data People = People {name::String 
        ,age::Int 
        ,addr::String} deriving Show
{-
- record 구문을 사용하면
    - 새로운 타입을 만들때 각 필드에 이름을 부여
    - getter를 자동으로 만들어준다. 
-}

r3 = name (People "kim" 2 "seoul")
r4 = age (People "kim" 2 "seoul")
r5 = People { age = 2 , addr = "seoul" , name = "lee"}
