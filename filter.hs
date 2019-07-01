rp = filter even [1..10]
    -- [2,4,6,8,10]

r1 = filter (<10) (filter even [1..20])
    -- [2,4,6,8]

r2 = [x | x<-[1..20], even x , x<10]
    -- list 통합 문법 

    -- elem 1 [1,2,3] =>  true    --> 1 `elem` [1,2,3]
    -- ` `을 이용하여 뒤에 오는 것을 2번째 인자에 고정
r3 = filter( `elem` ['a'..'z'] ) "I am a boy"
    -- "amaboy"


-- 1~100까지 3의 배수를 가지는 리스트 만들기
r4 = filter (\x -> if x `mod` 3 == 0 then True else False) [1..100]

myfilter::(a->Bool)->[a]->[a]
myfilter _ [] =  []
myfilter f (x:xs)  
    | f x =x: myfilter f xs
    | otherwise =  myfilter f xs
