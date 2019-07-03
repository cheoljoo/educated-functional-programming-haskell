1\.  [educated-functional-programming-haskell](#educated-functional-programming-haskell)  
2\.  [Haskell Basic](#haskellbasic)  
2.1\.  [환경](#환경)  
2.2\.  [함수형 언어의 특징을 가져온 것](#함수형언어의특징을가져온것)  
2.3\.  [hello.hs](#hello.hs)  
2.3.1\.  [interactive mode](#interactivemode)  
2.3.1.1\.  [commands](#commands)  
2.4\.  [기본적 특징](#기본적특징)  
2.4.1\.  [type](#type)  
2.4.2\.  [operator](#operator)  
2.5\.  [Function Application](#functionapplication)  
2.6\.  [함수 만들기](#함수만들기)  
2.7\.  [Multi-line in ghci](#multi-lineinghci)  
2.8\.  [Generic](#generic)  
2.9\.  [Type Class](#typeclass)  
2.9.1\.  [클래스 제약](#클래스제약)  
2.9.2\.  [type class의 종류](#typeclass의종류)  
2.10\.  [다형성 상수](#다형성상수)  
2.11\.  [list](#list)  
2.11.1\.  [연산](#연산)  
2.11.2\.  [함수](#함수)  
2.11.3\.  [Data.List 모듈](#data.list모듈)  
2.11.4\.  [list 생성 기술](#list생성기술)  
2.11.5\.  [list comprehension  (통합)](#listcomprehension통합)  
2.12\.  [tuple](#tuple)  
3\.  [Function](#function)  
3.1\.  [Pattern Matching & Guard](#patternmatching&guard)  
3.1.1\.  [tuple을 사용하는 패턴 매칭 (func5.hs)](#tuple을사용하는패턴매칭func5.hs)  
3.1.2\.  [list를 사용하는 패턴 매칭 (func5.hs)](#list를사용하는패턴매칭func5.hs)  
3.1.3\.  [Guard : C언어의 if else](#guard:c언어의ifelse)  
3.1.4\.  [where](#where)  
3.2\.  [Recursion & Curry](#recursion&curry)  
3.2.1\.  [Recursion](#recursion)  
3.2.2\.  [curry](#curry)  
3.3\.  [고차함수 (HighOrder Function)](#고차함수highorderfunction)  
3.3.1\.  [고차 (high-order) 함수](#고차high-order함수)  
3.3.2\.  [함수 활용 - zipWith](#함수활용-zipwith)  
3.3.3\.  [함수 활용 - flip , map](#함수활용-flipmap)  
3.3.4\.  [함수의 활용 - filter , fold](#함수의활용-filterfold)  
3.3.5\.  [함수 적용 / 합성](#함수적용/합성)  
4\.  [Type & Type Class](#type&typeclass)  
4.1\.  [타입과 타입 클래스](#타입과타입클래스)  
4.1.1\.  [타입 만들기](#타입만들기)  
4.1.2\.  [타입 클래스와 인스턴스](#타입클래스와인스턴스)  
4.1.3\.  [data를 사용한 새로운 타입만들기](#data를사용한새로운타입만들기)  
4.1.4\.  [레코드 구문](#레코드구문)  
4.1.5\.  [필드 없는 생성자](#필드없는생성자)  
4.2\.  [Type 생성자 , Type Parameter](#type생성자typeparameter)  
4.2.1\.  [Type 생성자 , Type Parameter](#type생성자typeparameter-1)  
4.2.2\.  [Maybe (정말 많이 사용된다)](#maybe정말많이사용된다)  
4.2.3\.  [Example : 재귀적인 data type](#example:재귀적인datatype)  
5\.  [Module](#module)  
5.1\.  [Module](#module-1)  
5.1.1\.  [Module Import](#moduleimport)  
6\.  [Monad IO](#monadio)  
6.1\.  [Monad IO](#monadio-1)  
6.1.1\.  [Monad](#monad)  
6.2\.  [- monad1.hs](#-monad1.hs)  
6.2.1\.  [](#)  
6.3\.  [- type1.hs](#-type1.hs)  
6.3.1\.  [](#-1)  
6.4\.  [- type1.hs](#-type1.hs-1)  
6.4.1\.  [](#-2)  
6.5\.  [- type1.hs](#-type1.hs-2)  

<a name="educated-functional-programming-haskell"></a>

# 1\. educated-functional-programming-haskell
- example : git clone https://github.com/codenuri/HASKELL

<a name="haskellbasic"></a>

# 2\. Haskell Basic

<a name="환경"></a>

## 2.1\. 환경
- sudo apt install ghc

<a name="함수형언어의특징을가져온것"></a>

## 2.2\. 함수형 언어의 특징을 가져온 것
- C++20 의 Concept  (Type Class를 가져온 것)
- 람다 표현식
- 커리된 함수

<a name="hello.hs"></a>

## 2.3\. hello.hs
- ; 은 붙이지 않아도 된다.


<a name="interactivemode"></a>

### 2.3.1\. interactive mode
- ghci
- :q 
- :load hello.hs
- main
- :r    <- reload
- foo
- main

<a name="commands"></a>

#### 2.3.1.1\. commands
- :load  , :reload
- :set, :unset
- :show
- :help
- :?
- :!      <- run shell command
  - Prelude> :set prompt ">"
  - >
- .ghci는 linux에서는 잘 먹지 않는다.


<a name="기본적특징"></a>

## 2.4\. 기본적 특징
<a name="type"></a>

### 2.4.1\. type
- :type    <- data type 조사
- Haskell 기본 데이타 타입은 대문자로 시작한다.
- Bool,Char,Int,Integer,Float,Double , String
- list( [] ) , tuple( () )
- :t 3
- :t 3.3
<a name="operator"></a>

### 2.4.2\. operator
- -3+5  -> 2
- 5 + -3    -> error   이때는 괄호 사용하면 됨
-  not
- /=  이 !=의 의미

<a name="functionapplication"></a>

## 2.5\. Function Application
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

<a name="함수만들기"></a>

## 2.6\. 함수 만들기
- 함수 이름은 반드시 소문자로 시작
- 타입은 대문자로 시작
- https://github.com/cheoljoo/educated-functional-programming-haskell/blob/master/func1.hs
  - 함수이름::input type -> output type
  - 함수이름 매개변수=함수구현

<a name="multi-lineinghci"></a>

## 2.7\. Multi-line in ghci
- ;을 사용하는 방법
- :{  와  :} 을 사용하는 방법


<a name="generic"></a>

## 2.8\. Generic
- :t 함수로 type을 알려준다.
- 암시적 형변환을 허용하지 않는다.
- 함수 overloading이 지원하지 않는다. 인자 타입이 달라도 동일 이름의 함수를 만들 수 없다.
- 그래서 generic을 사용해야 한다.  
- 함수 타입 선언을 생략한 경우 자동으로 generic 버젼으로 만들게 된다.


<a name="typeclass"></a>

## 2.9\. Type Class
- generic에서 + 가 있으면 모든게 plus를 지원해야 하는데
- 타입클래스 (Num +,-,*,/) : Int 타입은 Num 타입 클래스의 인스턴스 이다.
- Enum (succ,pred...)  : 다음을 구할수 있는 타입 클래스
- 함수 인자에 타입 클래스 표기하기
  - 함수이름::Num a=>a->a
- 선언부를 만들지 말고 , 구현부만 만들어도 알아서 해주는 경우도 있다. 이때 :type으로 보면 어떻게 구현되어져있는지도 볼수 있다.

<a name="클래스제약"></a>

### 2.9.1\. 클래스 제약
- :t succ 를 하면 어떤  type인지 알수 있다.
- :t mac
- :t (+)    <- 전위연산자로 바꾸면 된다.
- :t (=)
- :i Num
- :i Eq
- :i Int    <- Int가 어떤 instance를 만족하는지 알수 있다.

<a name="typeclass의종류"></a>

### 2.9.2\. type class의 종류
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

<a name="다형성상수"></a>

## 2.10\. 다형성 상수
- https://github.com/cheoljoo/educated-functional-programming-haskell/blob/master/type.hs
  - 3은 임의의 타입중에 하나이다.  3::Num a=> a
  - :t 3::Int    <- 3을 int로 type annotation
  - f1 3::Double   <- 에러
- one=1   <- binding   (변수 값을 부여하는 것)
- Haskell은 변수는 없고 상수만이 존재한다.
  - interactive mode에서는 abc=1 ; abc=2 를 하면 이건 그때마다 새로운 것을 만들어준 것이다.



<a name="list"></a>

## 2.11\. list
- 같은 타입의 값을 여러개 보관
- 대괄호 [ ]
- 요소의 타입이 같으면 개수와 상관없이 같은 타입
  - [1,2]와 [1,2,3]은 같은 타입
- 문자열(STring)은 Char의 list ([Char]) 이다.

<a name="연산"></a>

### 2.11.1\. 연산
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

<a name="함수"></a>

### 2.11.2\. 함수
- length
- null : is null
- reverse
- maximum
- sum
- elem : 특정 요소가 있는지 조사 
  - elem 3 [1,2,3]  => True

<a name="data.list모듈"></a>

### 2.11.3\. Data.List 모듈
- import Data.List
- sort


<a name="list생성기술"></a>

### 2.11.4\. list 생성 기술
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

<a name="listcomprehension통합"></a>

### 2.11.5\. list comprehension  (통합)
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

<a name="tuple"></a>

## 2.12\. tuple
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





<a name="function"></a>

# 3\. Function

<a name="patternmatching&guard"></a>

## 3.1\. Pattern Matching & Guard
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

<a name="tuple을사용하는패턴매칭func5.hs"></a>

### 3.1.1\. tuple을 사용하는 패턴 매칭 (func5.hs)
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


<a name="list를사용하는패턴매칭func5.hs"></a>

### 3.1.2\. list를 사용하는 패턴 매칭 (func5.hs)
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

<a name="guard:c언어의ifelse"></a>

### 3.1.3\. Guard : C언어의 if else
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

<a name="where"></a>

### 3.1.4\. where
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




<a name="recursion&curry"></a>

## 3.2\. Recursion & Curry 

<a name="recursion"></a>

### 3.2.1\. Recursion
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

<a name="curry"></a>

### 3.2.2\. curry
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


<a name="고차함수highorderfunction"></a>

## 3.3\. 고차함수 (HighOrder Function)

<a name="고차high-order함수"></a>

### 3.3.1\. 고차 (high-order) 함수
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

<a name="함수활용-zipwith"></a>

### 3.3.2\. 함수 활용 - zipWith
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

<a name="함수활용-flipmap"></a>

### 3.3.3\. 함수 활용 - flip , map

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

<a name="함수의활용-filterfold"></a>

### 3.3.4\. 함수의 활용 - filter , fold
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

<a name="함수적용/합성"></a>

### 3.3.5\. 함수 적용 / 합성
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



<a name="type&typeclass"></a>

# 4\. Type & Type Class

<a name="타입과타입클래스"></a>

## 4.1\. 타입과 타입 클래스

<a name="타입만들기"></a>

### 4.1.1\. 타입 만들기
- [type1.hs](https://github.com/cheoljoo/educated-functional-programming-haskell/blob/master/type1.hs)
- Haskell에서 새로운 타입을 만드는 방법
  - 기존 타입의 별칭을 만들기
  - 기존 타입을 사용해서 새로운 타입 만들기
  - 완전히 새로운 타입 만들기
 
  - 타입 생성자 만들기
  - 타입 클래스 만들기

- 기존 타입에 별칭을 부여하는 방법
```haskell
type Meter = Double     -- 새로운 별명
    -- type 별칭 = 기존 타입

type Meter = Double
type Yard = Double

-- Meter 단위 값을 Yard 단위 값으로 변경하는 함수

convert :: Meter->Yard
convert m = m * 1.093
```

--------

- [type2.hs](https://github.com/cheoljoo/educated-functional-programming-haskell/blob/master/type2.hs)
- 여기서는 Meter와 Yard가 같은 type이므로 나중에 Meter->Yard를 해야 하는데 , Meter에 Yard를 넣어도 문제가 안된다.
  - 이때는 기존 타입을 사용한 새로운 타입을 만들어 혼선을 없애야 한다.
    - newtype 새로운 타입 = 생성자 기본 타입
    - 새로운 타입의 이름과 생성자는 이름이 달라도 상관없지만 같은 이름을 쓰자
    - 생성자의 이름은 대문자로 시작
    - 새로운 타입의 값을 만들려면 생성자를 사용해서 만들어야 한다. Meter 3
    - 값 생성자 (data constructor)라고 부른다.
  - 함수 인자로 Meter 타입 받는면
    - foo $ Meter 3
    - foo ( Yard 3 ) => 에러
```haskell
-- 동일 한 type

-- type Meter = Double
-- type Yard = Double



{-
class Meter
{
    Meter(double d){}
}

new Meter(3);
-}



newtype Meter = Meter Double    -- 생성자를 만들어야 한다.
newtype Yard = Yard Double      -- Yard 3

-- 생성자는 꼭 대문자로 시작해야 한다.


-- 테스트 함수
foo :: Meter -> Int
foo m = 0
```


---------

- [type3.hs](https://github.com/cheoljoo/educated-functional-programming-haskell/blob/master/type3.hs)
- 사용자 타입을 인자로 받는 경우
  - 패턴 매칭을 사용해서 받는 경우가 많이 있다.
  - getValue (Meter m) = m
    - call할때는 > getValue $ Meter 3  => 3.0
```haskell
newtype Meter = Meter Double
newtype Yard = Yard Double

-- Meter를 받아서 Double을 반환하는 함수
-- getValue ( Meter 3)  => 3

getValue :: Meter -> Double
getValue (Meter m) = m      -- ()때문에 1개의 인자로 인식 pattern matching

r1 = getValue $ Meter 3
-- 3.0
```

------------

<a name="타입클래스와인스턴스"></a>

### 4.1.2\. 타입 클래스와 인스턴스
- [type4.hs](https://github.com/cheoljoo/educated-functional-programming-haskell/blob/master/type4.hs)
- 특정 타입의 값을 화면에 출력하려면
  - Show 타입 클래스의 인스턴스가 되어야 한다.
  - Show 타입 클래스가 요구하는 함수를 제공해야 한다.
- 특정 타입을 타입클래스의 인스턴스가 되려면
  - deriving 지시어 사용
  - instance 구문제공 
    - instance Show Yard where
    - :i Show
```haskell
newtype Meter = Meter Double  --deriving Show   -- Meter 3
newtype Yard = Yard Double

instance Show Yard where
     show ( Yard y) = show y ++ " yd"

instance Show Meter where
    show ( Meter m) = show m ++ " m"

r1 = Yard 3
-- 3.0 yd


-- Meter 를 Yard로 변경하는 함수

-- convert (Meter 3)
convert:: Meter->Yard
convert (Meter m) = Yard (m * 1.09)     -- Meter , Yard의 생성자를 이용

```

-------

<a name="data를사용한새로운타입만들기"></a>

### 4.1.3\. data를 사용한 새로운 타입만들기
- [type5.hs](https://github.com/cheoljoo/educated-functional-programming-haskell/blob/master/type5.hs)
- newtype vs data
  - newtype : 생성자 인자로 한개만 사용가능
  - data : 생성자 인자로 여러개를 가질수 있다. 생성자를 2개 이상 가실수도 있다.
- 생성자가 2개 이상 있는 타입을 인자로 받을때
  - 패턴 매칭을 사용하는 경우가 많다.
```haskell
-- 점을 나타내는 point 타입

-- newtype Point = Point Double Double  --error : newtype은 1개의 field만 가져야 한다.


data Point  = Point Double Double deriving (Show , Eq)

r1 = Point 1 1

r2 = (Point 1 1) == (Point 0 0)     -- False
r3 = (Point 1 1) == (Point 1 1)     -- True


-- 생성자를 2개 이상 가질수 있다.
data Shape = Circle Double Double Double | Rectangle Double Double Double Double deriving (Show , Eq)

r4 = Circle 1 1 5
r5 = Rectangle 1 1 10 10


data Shape2 = Circle2 Point  Double | Rectangle2 Point Point deriving (Show , Eq)
r6 = Circle2 (Point 1 1) 5
r7 = Rectangle2 (Point 1 1) (Point 10 10)


-- Shape2를 사용하는 함수 만들기
-- 면적을 구하는 함수
-- area (Circle2 (Point 1 1 ) 5)
-- area (Rectangle2 (Point 1 1) (Point 10 10))

area :: Shape2->Double
area (Circle2 pt r) =  3.14 * r^2
area (Rectangle2 (Point x1 y1) (Point x2 y2)) =   (x2-x1) * (y2-y1)

r8 = area ( Circle2 (Point 1 1) 5)  -- 78.5
r9 = area ( Rectangle2 (Point 1 1) (Point 10 10)) --  81.0
```



-------

<a name="레코드구문"></a>

### 4.1.4\. 레코드 구문
- [type6.hs](https://github.com/cheoljoo/educated-functional-programming-haskell/blob/master/type6.hs)
- record 구문을 사용하면
    - 새로운 타입을 만들때 각 필드에 이름을 부여
    - getter를 자동으로 만들어준다.
```haskell
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
```



-------

<a name="필드없는생성자"></a>

### 4.1.5\. 필드 없는 생성자
- [type7.hs](https://github.com/cheoljoo/educated-functional-programming-haskell/blob/master/type7.hs)
- True 생성자와 False 생성자가 있다.
- True와 False 생성자는 인자를 가지고 있지 않다.
```haskell
data Shape = Circle Double Double Double | Rectangle Double Double Double Double deriving (Show , Eq)

{-
- True 생성자와 False 생성자가 있다.
- True와 False 생성자는 인자를 가지고 있지 않다.
 -}
-- data Bool = True | False

-- :i Bool

r1 = compare 3 5  -- LT
-- :t compre
-- compare :: a -> a -> Ordering
-- :i Ordering
-- data Ordering = LT | EQ | GT    -- Defined in ‘GHC.Types’

-- 1주일을 표현하고 싶다.
data Week = Mon | Tue | Wed | Thu | Fri | Sat | Sun
    deriving (Show , Eq , Enum)

-- Enum이므로 succ 연산 가능
r2 = succ Mon     -- Tue


```



-------

<a name="type생성자typeparameter"></a>

## 4.2\. Type 생성자 , Type Parameter

<a name="type생성자typeparameter-1"></a>

### 4.2.1\. Type 생성자 , Type Parameter
- [type8.hs](https://github.com/cheoljoo/educated-functional-programming-haskell/blob/master/type8.hs)
- 타입 생성자 vs 값 생성자 (C++ template)
  - 타입 생성자 : 타입을 인자로 받아서 새로운 타입을 만드는 생성자
  - 값 생성자 : 값을 인자로 받아서 해당 타입의 값을 만드는 생성자
- Shape Int => Shape<int>
- Shape a  => Shape T

```haskell
{-
template <typename T>
class Shape
{
    T x;
}
-}
-- Int 타입 4개로 구성된 Shape 타입

-- data Shape = Rectangle Int Int Int Int
data Shape a = Rectangle a a a a  deriving Show  -- generic

r1 = Rectangle 1 1 1 1

--  면적을 구하는 함수
{-
area :: Shape -> Double     -- Shape 는 type이 아니고 template이다.
area (Rectangle x1 y1 x2 y2) = (x2-x1)*(y2-y1)

Shape Int => Shape<int>
Shape a  => Shape T
-}
area :: Num a => Shape a -> a     -- Shape 는 type이 아니고 template이다.
area (Rectangle x1 y1 x2 y2) = (x2-x1)*(y2-y1)

r2 = area (Rectangle 1 1 10 10) -- 81
```



-------

<a name="maybe정말많이사용된다"></a>

### 4.2.2\. Maybe (정말 많이 사용된다)
- [maybe1.hs](https://github.com/cheoljoo/educated-functional-programming-haskell/blob/master/maybe1.hs)
- Maybe Int를 생성하는 방법
  - Nothing
  - Just 5
```haskell
-- int 의 문제점 : 잘못된 값 (값 없음) 을 표현할수 없다.

{-
int foo( return 실패; }

struct Maybe
{
    bool b; // 유효성
    int value;
};

template<typename T> struct Maybe
{
    bool b;
    T value;
};
Maybe<int> m; // int를 보관하고 , 값 을 나타낼수 있다.
            // optional
-}

-- data Shape a = Circle | Rectangle a
-- data Maybe a = Nothing | Just a

-- :i Maybe
-- data Maybe a = Nothing | Just a

-- 입력된 값이 5이상이면 다음수를 반환 / 5 이하이면 실패 반환
{-
next :: Int -> Int
next x
    | x>5 = succ x
    | othersize = ??;
-}
next :: Int -> Maybe Int     -- 일종이 template
next x
    | x>5 = Just (succ x)
    | otherwise = Nothing ;

r5 = next 5


-- Maybe Int 를 받아서 Int 반환
-- getValue (Just 8)
getValue :: Maybe Int -> Int
getValue (Just m) = m
getValue (Nothing) = 0

r6 = getValue (Just 8)   -- 8
r7 = getValue (next 8)   -- 9
r8 = getValue (next 3)   -- 0
```



-------

<a name="example:재귀적인datatype"></a>

### 4.2.3\. Example : 재귀적인 data type
- [ex1.hs](https://github.com/cheoljoo/educated-functional-programming-haskell/blob/master/ex1.hs)
- List 만들기   20 :+ (10 :+ Empty)
```haskell
{-
data List = Empty | Node Int List   deriving Show    -- 재귀적 data type (자기 이름을 또 쓴다.)

r1 = Empty
r2 = Node 10 Empty
r3 = Node 20 (Node 10 Empty)
r4 = Node 30 (Node 20 (Node 10 Empty))

- Empty 생성자 : 비어있는 리스트 생성
- Node생성자 : 값과 다음 List 를 가지고 List 생성
-}

{-
data List a = Empty | Node a (List a)   deriving Show    -- 재귀적 data type (자기 이름을 또 쓴다.)
r5 = Node 3.3 Empty
r6 = Node 2.2 (Node 3.3 Empty)
-}

-- 특수 문자로 생성자 만들기
-- Node => :+
-- Node 10 Empty => 10 :+ Empty
data List a = Empty | a :+ (List a) deriving Show
r7 = 10 :+ Empty
r8 = 20 :+ (10 :+ Empty)
    -- haskell이 가지고 있던 원래 있던 list
    -- Empty == []
    -- 1:[] == 1 :+ Empty
```

- [ex2.hs](https://github.com/cheoljoo/educated-functional-programming-haskell/blob/master/ex2.hs)
- List에 있는 요소가 있는지?  
```haskell
-- 1:+Empty
data List a = Empty | a :+ (List a) deriving Show


-- + (+)    전위

-- 하스켈의 리스트를 List 넣기
r1 = foldr (:+) Empty [1,2,3,4] -- 1 op (2 op (3 op (4 op Empty)))
    -- 1 :+ (2 :+ (3 :+ (4 :+ Empty)))

-- List에 요소가 있는지 검사
-- myFind 5 List
myFind :: (Eq a) => a -> List a -> Bool
myFind _ Empty  = False
myFind v (f :+ st)
    | v == f = True
    | otherwise = myFind v st

r2 = myFind 5 (3 :+ (2 :+ (5 :+ Empty)))
r3 = myFind 5 r1
r4 = myFind 3 r1
```

-------





<a name="module"></a>

# 5\. Module

<a name="module-1"></a>

## 5.1\. Module

<a name="moduleimport"></a>

### 5.1.1\. Module Import
- [module1.hs](https://github.com/cheoljoo/educated-functional-programming-haskell/blob/master/module1.hs)
- Module
  - 관련된 함숭와 타입을 묶어놓는 제공하는 단위
- Prelude
  - Haskell 기본 모듈
  - 기본 타입과 다양한 기본 함수 제공
  - default import
- 모듈을 import하는 방법
  - import Data.List
    - import Data.List (sort)   : sort함수만 import
    - import Data.List hiding (sort)  : sort함수만 제외
    - import qualified Data.List  : Data.List.sort 로 완전한 전체 이름을 써 달라.
    - import qualified DAta.List as L   : L.sort로 사용
    - :m - Data.List    : Data.List unload
    - :m + Data.List    : import Data.List
```haskell
-- 각 자릿수의 합이 15가 되는 최초의 숫자는?
-- 1423 => 1+4+2+3 = 10

-- Data.Char.digitToInt
    --  문자를 하나 받아서 숫자로 변경하는 함수
-- Data.List.find
    -- 단항 조건자와  리스트를 받아서 조건을 만족하는 첫번째 요소를 찾는다.

import Data.Char
import Data.List

-- digitToSum : 숫자를 받아서 각 자리수를 더한 합을 반환
digitToSum :: Int -> Int
-- digitToSum x = ... ;    -- 일반적인 함수
-- 1423 =show=> "1423" =map=> map digitToInt => [1 4 2 3] =sum=> 10
digitToSum = sum . map digitToInt . show

r1 = digitToSum 1423        -- 10


-- calcTo 15 => 어떤 숫자의 자릿수를 더하면 15가 되는지?
calcTo :: Int -> Maybe Int
calcTo n = find (\x -> digitToSum x == n) [1..]  -- [1,2,3,4, ....]

r2 = calcTo 15   -- 69
r3 = calcTo 49   -- 499999
```

--------



<a name="monadio"></a>

# 6\. Monad IO

<a name="monadio-1"></a>

## 6.1\. Monad IO

<a name="monad"></a>

### 6.1.1\. Monad
<a name="-monad1.hs"></a>

6.2\. - [monad1.hs](https://github.com/cheoljoo/educated-functional-programming-haskell/blob/master/monad1.hs)
- 
```haskell
```

--------


<a name=""></a>

6.2.1\. #6.2.1\. #6.2.1\. #6.2.1\.  6.2.1\. 
6.2.1\. <a name="-type1.hs"></a>

6.3\. - [type1.hs](https://github.com/cheoljoo/educated-functional-programming-haskell/blob/master/type1.hs)
- 
```haskell
```

--------


<a name="-1"></a>

6.3.1\. #6.3.1\. #6.3.1\. #6.3.1\.  6.3.1\. 
6.3.1\. <a name="-type1.hs-1"></a>

6.4\. - [type1.hs](https://github.com/cheoljoo/educated-functional-programming-haskell/blob/master/type1.hs)
- 
```haskell
```

--------


<a name="-2"></a>

6.4.1\. #6.4.1\. #6.4.1\. #6.4.1\.  6.4.1\. 
6.4.1\. <a name="-type1.hs-2"></a>

6.5\. - [type1.hs](https://github.com/cheoljoo/educated-functional-programming-haskell/blob/master/type1.hs)
- 
```haskell
```
