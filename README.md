# educated-functional-programming-haskell

# 환경
- sudo apt install ghc

# 함수형 언어의 특징을 가져온 것
- C++20 의 Concept  (Type Class를 가져온 것)
- 람다 표현식
- 커리된 함수

# hello.hs
- ; 은 붙이지 않아도 된다.


## interactive mode
- ghci
- :q 
- :load hello.hs
- main
- :r    <- reload
- foo
- main

### commands
- :load  , :reload
- :set, :unset
- :show
- :help
- :?
- :!      <- run shell command
  - Prelude> :set prompt ">"
  - >
- .ghci는 linux에서는 잘 먹지 않는다.


# 기본적 특징
## type
- :type    <- data type 조사
- Haskell 기본 데이타 타입은 대문자로 시작한다.
- Bool,Char,Int,Integer,Float,Double , String
- list( [] ) , tuple( () )
- :t 3
- :t 3.3
## operator
- -3+5  -> 2
- 5 + -3    -> error   이때는 괄호 사용하면 됨
-  not
- /=  이 !=의 의미

# Function Application
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

# 함수 만들기
- 함수 이름은 반드시 소문자로 시작
- 타입은 대문자로 시작
- func1.hs
  - 함수이름::input type -> output type
  - 함수이름 매개변수=함수구현

# Multi-line in ghci
- ;을 사용하는 방법
- :{  와  :} 을 사용하는 방법


# Generic
- :t 함수로 type을 알려준다.
- 암시적 형변환을 허용하지 않는다.
- 함수 overloading이 지원하지 않는다. 인자 타입이 달라도 동일 이름의 함수를 만들 수 없다.
- 그래서 generic을 사용해야 한다.  
- 함수 타입 선언을 생략한 경우 자동으로 generic 버젼으로 만들게 된다.


# Type Class
- generic에서 + 가 있으면 모든게 plus를 지원해야 하는데
- 타입클래스 (Num +,-,*,/) : Int 타입은 Num 타입 클래스의 인스턴스 이다.
- Enum (succ,pred...)  : 다음을 구할수 있는 타입 클래스
- 함수 인자에 타입 클래스 표기하기
  - 함수이름::Num a=>a->a
- 선언부를 만들지 말고 , 구현부만 만들어도 알아서 해주는 경우도 있다. 이때 :type으로 보면 어떻게 구현되어져있는지도 볼수 있다.

## 클래스 제약
- :t succ 를 하면 어떤  type인지 알수 있다.
- :t mac
- :t (+)    <- 전위연산자로 바꾸면 된다.
- :t (=)
- :i Num
- :i Eq
- :i Int    <- Int가 어떤 instance를 만족하는지 알수 있다.

## type class의 종류
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

- func4.hs
  - if ~ then ~ else : else가 반드시 있어야 한다.
  - haskell에서는 무조건  return을 해야 한다.
  - 2개 이상의 class 제약을 넘기려면 반드시 ( ) 으로 묶어야 한다.
  - :type koo

# 다형성 상수
- type.hs
  - 3은 임의의 타입중에 하나이다.  3::Num a=> a
  - :t 3::Int    <- 3을 int로 type annotation
  - f1 3::Double   <- 에러
- one=1   <- binding   (변수 값을 부여하는 것)
- Haskell은 변수는 없고 상수만이 존재한다.
  - interactive mode에서는 abc=1 ; abc=2 를 하면 이건 그때마다 새로운 것을 만들어준 것이다.



# list
- 같은 타입의 값을 여러개 보관
- 대괄호 [ ]
- 요소의 타입이 같으면 개수와 상관없이 같은 타입
  - [1,2]와 [1,2,3]은 같은 타입
- 문자열(STring)은 Char의 list ([Char]) 이다.

## 연산
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

## 함수
- length
- null : is null
- reverse
- maximum
- sum
- elem : 특정 요소가 있는지 조사 
  - elem 3 [1,2,3]  => True

## Data.List 모듈
- import Data.List
- sort


## list 생성 기술
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

## list comprehension  (통합)
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

# tuple
- 서로 다른 타입의 값을 여러개 보관할수 있는 타입
