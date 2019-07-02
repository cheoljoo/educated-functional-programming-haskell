# educated-functional-programming-haskell
- example : git clone https://github.com/codenuri/HASKELL

# Haskell Basic

## 환경
- sudo apt install ghc

## 함수형 언어의 특징을 가져온 것
- C++20 의 Concept  (Type Class를 가져온 것)
- 람다 표현식
- 커리된 함수

## hello.hs
- ; 은 붙이지 않아도 된다.


### interactive mode
- ghci
- :q 
- :load hello.hs
- main
- :r    <- reload
- foo
- main

#### commands
- :load  , :reload
- :set, :unset
- :show
- :help
- :?
- :!      <- run shell command
  - Prelude> :set prompt ">"
  - >
- .ghci는 linux에서는 잘 먹지 않는다.


## 기본적 특징
### type
- :type    <- data type 조사
- Haskell 기본 데이타 타입은 대문자로 시작한다.
- Bool,Char,Int,Integer,Float,Double , String
- list( [] ) , tuple( () )
- :t 3
- :t 3.3
### operator
- -3+5  -> 2
- 5 + -3    -> error   이때는 괄호 사용하면 됨
-  not
- /=  이 !=의 의미

## Function Application
- 함수를 사용하는 방법 : 괄호대신 space를 사용하여 인자 전달
  - > succ 5
- 함수를 적용 (Application)이라고 표현  (호출대신 적용이란 표현을 사용)
- succ 3*2  -> 8  (함수가 먼저 먹는다)
- succ (3*2) -> 7
- 이중 함수를 중위 함수로 사용하기
  - 인자가 2개인 함수에서 back quote(`)을 사용하면 함수 이름을 연산자 사이에 놓을수 있다. 
  - 10 `mod`  3
- prefix(전위) / infix(중위) 함수 
  - 연산자도 함수이다.
  - 3 + 4
  -  (+) 3 4

## 함수 만들기
- 함수 이름은 반드시 소문자로 시작
- 타입은 대문자로 시작
- https://github.com/cheoljoo/educated-functional-programming-haskell/blob/master/func1.hs
  - 함수이름::input type -> output type
  - 함수이름 매개변수=함수구현

## Multi-line in ghci
- ;을 사용하는 방법
- :{  와  :} 을 사용하는 방법


## Generic
- :t 함수로 type을 알려준다.
- 암시적 형변환을 허용하지 않는다.
- 함수 overloading이 지원하지 않는다. 인자 타입이 달라도 동일 이름의 함수를 만들 수 없다.
- 그래서 generic을 사용해야 한다.  
- 함수 타입 선언을 생략한 경우 자동으로 generic 버젼으로 만들게 된다.


## Type Class
- generic에서 + 가 있으면 모든게 plus를 지원해야 하는데
- 타입클래스 (Num +,-,*,/) : Int 타입은 Num 타입 클래스의 인스턴스 이다.
- Enum (succ,pred...)  : 다음을 구할수 있는 타입 클래스
- 함수 인자에 타입 클래스 표기하기
  - 함수이름::Num a=>a->a
- 선언부를 만들지 말고 , 구현부만 만들어도 알아서 해주는 경우도 있다. 이때 :type으로 보면 어떻게 구현되어져있는지도 볼수 있다.

### 클래스 제약
- :t succ 를 하면 어떤  type인지 알수 있다.
- :t mac
- :t (+)    <- 전위연산자로 바꾸면 된다.
- :t (=)
- :i Num
- :i Eq
- :i Int    <- Int가 어떤 instance를 만족하는지 알수 있다.

### type class의 종류
- Num
- Integral : 정수
- Floating : 실수
- Eq : 동질성
- Ord : 크기비교 (>,>=,<,<=)
- Show : 문자령로 표현될수 있는 타입 (toString)
- Read : 문자열을 가지고 해당 타입의 값으로 변환할수 있는 타입. Read 타입 클래스의 인스턴스 타입은 read 함수를 사용할수 있다.
- Enum : 연속적인 순서를 가지고 있는 타입
- ex) succ (read "1"::Int)  
  - succ(read "1.1"::Double)
  - :i Read

- https://github.com/cheoljoo/educated-functional-programming-haskell/blob/master/func4.hs
  - if ~ then ~ else : else가 반드시 있어야 한다.
  - haskell에서는 무조건  return을 해야 한다.
  - 2개 이상의 class 제약을 넘기려면 반드시 ( ) 으로 묶어야 한다.
  - :type koo

## 다형성 상수
- https://github.com/cheoljoo/educated-functional-programming-haskell/blob/master/type.hs
  - 3은 임의의 타입중에 하나이다.  3::Num a=> a
  - :t 3::Int    <- 3을 int로 type annotation
  - f1 3::Double   <- 에러
- one=1   <- binding   (변수 값을 부여하는 것)
- Haskell은 변수는 없고 상수만이 존재한다.
  - interactive mode에서는 abc=1 ; abc=2 를 하면 이건 그때마다 새로운 것을 만들어준 것이다.



## list
- 같은 타입의 값을 여러개 보관
- 대괄호 [ ]
- 요소의 타입이 같으면 개수와 상관없이 같은 타입
  - [1,2]와 [1,2,3]은 같은 타입
- 문자열(STring)은 Char의 list ([Char]) 이다.

### 연산
- list 의 list
  - [[1,2],[1,2,3]] 문제 없다.
- ++ : 2개 list 결합
- :cons  ->  0:[1,2] => [0,1,2]
- 항복접근
  - [1,2,3,4,5]!!3   => 4
  - head[1,2,3,4,5] => 1
  - tail[1,2,3,4,5] => [2,3,4,5]
  - init[1,2,3,4,5]  => [1,2,3,4]
  - last[1,2,3,4,5] => 5
- compare operator
- take 3 [1,2,3,4,5] => [1,2,3]
- drop 3 [1,2,3,4,5] => [4,5]
- take 3 [1..]  => [1,2,3]

### 함수
- length
- null : is null
- reverse
- maximum
- sum
- elem : 특정 요소가 있는지 조사 
  - elem 3 [1,2,3]  => True

### Data.List 모듈
- import Data.List
- sort


### list 생성 기술
- replicate : 똑같은 값을 가지는 list 생성
  - replicate 3 1 => [1,1,1]
- repeat 와 무한 리스트
  - repeat 1 
  - take 3 (repeat 1)
- cycle [1,2] : list안의 있는 것을 무한 반복 => [1,2,1,2...
- repeat [1,2] => [ [1,2] , [1,2] , ...
- range 
  - [1..10]
  - ['a'..'e']
  - [1,3.. 10] => [1,3,5,7,9]
  - [10,9 .. 1]        
  - [10..1] => []

### list comprehension  (통합)
- generator와 predicator를 사용해서 새로운 list를 생성

- generator
  - [ x*2 | x <- [1..5] ] 
    - x<-[1..5] 이 Generator
  - [ [x,y] | x<-[1,2] , y<-[10,20,30] ]   x=1일때 y가 10 ,20,30 
    - 중첩 loop
  -  [ [x,y] | x<-[1,2,3] , y<-[1..x] ]  : 앞의 generator를 뒤에서 사용가능

- predicator (조건자)
  - [ x*2 | x <- [1..10] , x>5 ] 
  - [ x*2 | x <- [1..3] , y<-[10,20], even(x+y) , y /= 10] 

- list를 받을때는 끝에 s로 끝나는게 관례
- removeLower ss = [c | c<-ss,elem c ['A'..'Z']]    -- var.hs
- size xs=sum[1 | x<-xs]   -- length와 같은 함수
  - size xs=sum[1 | _<-xs]

## tuple
- 서로 다른 타입의 값을 여러개 보관할수 있는 타입
- ( )를 사용해서 생성
- 요소의 타입이 다르거나, 요소의 개수가 다르면 모두 다른 타입이다.
- list 와 tuple
  - 3개의 점을 보관하는 리스트 만들기
  - [ [1,1] , [2,2] , [3,3,1]  ] 에러이길 원하나 에러가 아님
  - [ (1,1) , (2,2) , (3,3,1)  ]  에러가 발생

- pair
  - 요소의 개수가 2개
  - fst , snd 함수를 통해서 요소의 값을 꺼낸다.

- zip 함수
  - list 2개를 받아서 tuple의 list를 생성하는 함수
  - list의 길이가 다른 경우 , 필요한 요소만 사용하고 나머지는 무시한다.





# Function

## Pattern Matching & Guard
- 패턴 매치을 사용한 함수 만들기
  - 함수의 인자의 패턴에 따라 서로 다른 구현을 제공
  - 매칭은 위에서부터 match를 한다. 
  - https://github.com/cheoljoo/educated-functional-programming-haskell/blob/master/func5.hs
```haskell
 translate::Int -> String -- [Char]
translate 1 = "one"
translate 2 = "two"
translate _ = "sorry"
```

### tuple을 사용하는 패턴 매칭 (func5.hs)
- addPair (1,1) (2,3)
- https://github.com/cheoljoo/educated-functional-programming-haskell/blob/master/func5.hs
  - pair 이용
  - pattern matching 이용
  - + generic 이용
- 3개 인자에서 1번째 , 2번째 , 3번째 요소를 꺼내는 함수
  - 패턴 매칭을 사용하기에 바로 요소를 접근할수 있다. 
```haskell
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
```


### list를 사용하는 패턴 매칭 (func5.hs)
- list 패턴 매칭  (:)  으로 : 으로 구분을 한다.
```haskell
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
```

- 문자열의 첫번째 요소가 공백이면 리턴 , 공백이 아니면 공백을 추가한 문자열 리턴
  - as pattern에 대해서 알아두어야 한다.  str@(:) 으로 해서 str에는 original string이 들어간다.
```haskell
-- addSpace
addSpace :: [Char] -> [Char]  -- String -> String
-- addSpace (' ':xs) = ' ':xs
addSpace str@(' ':xs) = str   -- str has original string  (as pattern)
addSpace xs = ' ':xs
```


- case 표현식 : switch과 같다.
```
case 표현식 of 패턴1 -> 결과
            패턴2 -> 결과
```
  - indent를 정확히 맞춰주어야 한다.
```haskell
-- case expression
caseex::Int -> String -- [Char]
caseex x = "result is " ++ case x of 0 -> "zero"
                                     1 -> "one"
                                     2 -> "two"
                                     _ -> "all"

```

### Guard : C언어의 if else
- 조건에 따라 함수 구현을 별도로 제공하는 것
```
함수이름 매개변수1 매개변수2...
  | 조건식1 = 함수 구현
  | 조건식2 = 함수 구현
  | otherwise = 함수 구현
```
  - 점수에 따른 grade를 줄때 , 조건에 따라 구현부를 다르게 만들어야 한다. 
```haskell
-- guard
-- get grade from points
grade::Int -> Char
grade score
    | score < 60 = 'F'
    | score > 90 = 'A'
    | otherwise = 'B'
```

### where
- where에는 자주 쓰는 것들을 적어두면 된다.
- 2과목 점수를 입력 받아 평균을 구해서 등급을 반환하는 함수
```haskell
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
```




## Recursion & Curry 

### Recursion
- https://github.com/cheoljoo/educated-functional-programming-haskell/blob/master/recursion.hs
```haskell
-- recursive function
-- ex. factorial

factorial :: Int -> Int
factorial 1 = 1
factorial n = n * factorial (n-1)


-- repeat : repeat 1 => [1,1,1,...]
myrepeat :: a -> [a]
myrepeat x = x : myrepeat x

-- reverse : reverse [1,2,3] => [3,2,1]
myreverse :: [a] -> [a]
myreverse [] = []
myreverse (x:xs) = myreverse xs ++ [x]

-- replicate : replicate 3 'A' => ['A' , 'A' , 'A']
myreplicate :: Int -> a -> [a]
myreplicate n x
    | n <= 0 = []
myreplicate 0 _  = []
myreplicate n x = x :  myreplicate (n-1) x
    -- problem : myreplicate -1 1  or myreplicate 1 -1
    -- 이것을 할때는 -1 은 (-1) 으로 입력해야 한다.


-- zip : zip [1,2,3] [19,29,30] => [ (1,19) , (2,29) , (3,30) ]
myzip :: [a] -> [b] -> [(a,b)]
myzip [] _ = []
myzip _ [] = []
myzip (x:xs) (y:ys) = (x,y):myzip xs ys


-- take : take 3 [1,2,3,4,5] => [1,2,3]
mytake :: Int -> [a] -> [a]
mytake n _
    | n <= 0 = []
mytake _ [] = []
mytake n (x:xs) = x : mytake (n-1) xs
  -- mytake (-1) [5,6]
```

### curry
- https://github.com/cheoljoo/educated-functional-programming-haskell/blob/master/curry.hs
- 함수 호출과 결합 방향
  - 함수 호출은 왼쪽에서 오른쪽으로 간다. (ex. succ max 3 5 하면 error가 나오므로 () 으로 먼저 할 것을 묶어주어야 한다.)
 - 함수를 반환하는 함수 만들기
  - Int -> (Int->Int)
- 결합 방향
  - 함수 호출은 왼쪽에서 오른쪽으로 호출
  - 함수 타입 표기는 오른쪽에서 왼쪽으로 결합한다.
    - 인자가 2개이고 값을 반환하는 함수 와 인자가 1개이고 함수를 반환하는 함수는 정확히 같은 타입이 된다.
    - 아래의 method 1,2가 같다.
```haskell
foo::Int->Int
foo x=x
--goo::Int->(Int->Int)   -- method 1
goo::Int->Int->Int      -- method 2
goo x = foo
```

- haskell에서는 모든 함수는 인자가 1개이다.
  - add 10 의 return 값이 함수가 되어..  , 끝날때까지 함수를 계속 반환하게 되는 것이다.
  - *Main> ((add3 1) 2) 3   => 6
  - *Main> (add3 1 2) 10  => 13
```haskell
-- add :: Int -> Int -> Int
add :: Int -> (Int -> Int)
add x y = x + y

add3 :: Int -> Int -> Int -> Int
add3 x y z  = x + y + z
```

- 인자를 고정해서 새로운 함수 만들기
  - 정수값 2개를 더하는 함수
```haskell
-- add :: Int -> Int -> Int
add :: Int -> (Int -> Int)
add x y = x + y

add3 :: Int -> Int -> Int -> Int
add3 x y z  = x + y + z


-- add 2 number
-- add2 :: Int -> Int -> Int
-- add2 x y = x+y
add2 = add3 0   -- give another name ( use like a function )
```
 
- 섹션(section)
  - 연산자의 인자를 부분적으로 적용해서 사용하는 것
```haskell
-- km to m
-- km2m :: Int -> Int
-- km2m km = km * 1000
km2m = (*1000)
hoo = (+5)
```


## 고차함수 (HighOrder Function)

### 고차 (high-order) 함수
- https://github.com/cheoljoo/educated-functional-programming-haskell/blob/master/highorder.hs
```haskell
-- Int -> Int -> Int

-- run twice with specific function
-- first argument is function with 1 argument
-- second argument is value
applyTwice :: (a->a)->a->a
applyTwice f x = f (f x)

```
- **haskell에서는 함수를 인자로 전달하거나 함수를 반환하는 작업을 많이 한다. 이것을 고차 함수라 한다.**
- 인자를 전달하는 3가지 방식
  - 인자가 1개인 함수를 전달  : applyTwice succ 5
  - 인자가 N개인 함수의 인자를 N-1개만 적용해서 전달 : applyTWice (+3) 5
  - 람다 표현식 사용 : applyTwice (\x->x*3) 5   
    - 인자가 1개인 곳에 인자 2개로 보낼때 : applyTwice((\x y -> x*y) 2) 5

### 함수 활용 - zipWith
- zipWith :
  https://github.com/cheoljoo/educated-functional-programming-haskell/blob/master/zipWith.hs
  - :t zipWith
  - (a->b->c)->[a]->[b]->[c]
  - 입력 : 이항 함수 , 리스트 , 리스트
    - *Main> zipWith (+) [1,2,3] [4,5,6]  => [5,7,9]
```haskell
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
```

### 함수 활용 - flip , map

- flip :
  https://github.com/cheoljoo/educated-functional-programming-haskell/blob/master/flip.hs
  - :t flip
  - flip :: (a -> b -> c) -> (b -> a -> c)  argument를 뒤집늦 것임
  - flip (-) 5 3   ==> -2  (인자 순서가 뒤집어진다.)
  - flip zip [1,2,3] [10,20,30] 
  - myflip (-) 5 3
```haskell
-- 함수와 함수를 받아서 적용
myflip:: (a->b->c) -> (b->a->c)
myflip f = g
    where g x y = f y x

-- 함수와 2개의 값을 받아서 적용
myflip2:: (a->b->c) -> b->a->c      -- 3 arguments : func(a,b)->c , b , a
myflip2 f x y = f y x
```


- map :
  https://github.com/cheoljoo/educated-functional-programming-haskell/blob/master/map.hs
  - map::(a->b) -> [a] -> [b]
```haskell
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

-- map : 인자가 2개
-- map (*2) : 함수를 고정하였으니 , 인자는 1개 (리스트)
r6 = map (map (*2)) [ [1,2] , [3,4] , [5,6] ]
-- [[2,4],[6,8],[10,12]]

mymap::(a -> b) -> [a] -> [b]
mymap _ [] = []
mymap f (x:xs)  = f x : mymap f xs
```

### 함수의 활용 - filter , fold
- filter :
  https://github.com/cheoljoo/educated-functional-programming-haskell/blob/master/filter.hs
  - filter::(a->Bool)->[a]->[a]
  - 리스트 요소중 조건자(predicator)를 만족하는 요소만을 가진 새로운 리스트 반환
```haskell
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
```

- fold :
  https://github.com/cheoljoo/educated-functional-programming-haskell/blob/master/fold.hs
  - 리스트에 들어있는 모든 요소ㅔ 순서대로 이항 함수를 적용하는 함수
  - scan 함수 : fold 함수의 중간 과정을 담은 리스트 생성
```haskell
r1 = foldl (+) 0 [1,2,3]    -- (((0 + 1) + 2) + 3)

r2 = foldr (+) 0 [1,2,3]    -- ( 1 + (2 + (3 + 0)))

r3 = foldl1 (+) [1,2,3]     -- ((1+2)+3)

r4 = foldr1 (+) [1,2,3]     -- (1+(2+3))

-- [] 1 => 1:[] => [1]
-- [1] 2 => 2:[1] => [2,1]
-- [2,1] 3 => 3:[2,1] => [3,2,1]
r5 = foldl(\x y -> y:x) [] [1,2,3]

r6 = scanl(\x y -> y:x) [] [1,2,3]
```

### 함수 적용 / 합성
- https://github.com/cheoljoo/educated-functional-programming-haskell/blob/master/composition.hs
- $ : 함수 적용 연산자
  - $를 주면 우선순위가 가장 낮아진다.
    - succ$mac 5 3 => succ(max 5 3)
  - 공백 : 우선순위가 가장 높다.
- 함수 합성
  - negate (succ 3) => -4
  - (negate . succ) 3
    - (.) :: (b->c)->(a->b)->a->c     :: 입출력이 어디로 가는지  두번째 함수의 input으로 a가 먼저 들어가게 된다.
```haskell
-- 리스트에 있는 모든 요소를 음수로 변경한후
-- 리스트의 합을 구하고 싶다.
-- [1,-2,-3,4,-5]

r1 = map negate  [1,-2,-3,4,-5]   -- [-1,2,3,-4,5]

r2 = map (negate . abs)  [1,-2,-3,4,-5]   -- [-1,-2,-3,-4,-5]

r3 = sum $ map (negate . abs)  [1,-2,-3,4,-5]   -- [-1,-2,-3,-4,-5]
```

