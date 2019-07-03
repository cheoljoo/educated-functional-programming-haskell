

# Type & Type Class

## 타입과 타입 클래스

### 타입 만들기
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

### 타입 클래스와 인스턴스
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

### data를 사용한 새로운 타입만들기
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

### 레코드 구문
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

### 필드 없는 생성자
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

## Type 생성자 , Type Parameter

### Type 생성자 , Type Parameter
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

### Maybe (정말 많이 사용된다)
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

### Example : 재귀적인 data type
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



