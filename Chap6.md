
# Type Class

## Type Class

### Type Class
- [tc1.hs](https://github.com/cheoljoo/educated-functional-programming-haskell/blob/master/tc1.hs)
- 타입 클래스
    - 타입이 가져야 하는 동작을 정의한 인터페이스
    - 일반화 함수를 만들때 특정 동작함수를 사용하려면 타입클래스를 사용해서 "클래스 제약"(class constraint)를 표기해야 한다.
- Eq 타입 클래스의 인스턴스
    - == \=  연산이 가능
    - Int , Double , String , Bool
    - :i
```haskell
isSame1 :: Int -> Int -> Bool
isSame1 x y = (x == y)

isSame2 :: (Eq a) => a -> a -> Bool
isSame2 x y = (x == y)
```

--------


### 사용자 정의 타입 클래스
- [tc2.hs](https://github.com/cheoljoo/educated-functional-programming-haskell/blob/master/tc2.hs)
- BoolConvertible
    - C언어 : 0 거짓 , 아니면 참
    - 타입이 ㅏ가져야 하는 동작 : isTrue , isFalse 함수
    - 특저 타입의 값의 유효성 Bool로 반환하는 함수
- 타입 클래스 만들기
    - class 타입크래스이름  타입파라미터 where
    -   동작을 정의한 함수 선언들 .. 
- 타입 클래스의 instance로 만들기
    - 특정 type을 type class의 instance로 만들어야 한다. (ex. BoolConvertible => Int)
    - instance 타입크래스이름  타입이름 where
    - 동작을 정의한 함수 구현부 .. 
```haskell
-- 사용자 정의 타입 클래스

{- 
- BoolConvertible
    - C언어 : 0 거짓 , 아니면 참
    - 타입이 ㅏ가져야 하는 동작 : isTrue , isFalse 함수
    - 특저 타입의 값의 유효성 Bool로 반환하는 함수
- 타입 클래스 만들기
    - class 타입크래스이름  타입파라미터 where
    -   동작을 정의한 함수 선언들 .. 
 -}

class BoolConvertible a where
    isTrue :: a -> Bool
    isFalse :: a -> Bool
    isFalse x = not (isTrue  x)
    isTrue  x = not (isFalse x)

-- 함수
-- check 0 1 => 1
-- check 3 2 => 3
check :: (BoolConvertible a) => a -> a -> a
check x y = if isTrue x then x else y

-- check 0 1 을 하면 error가 나오는데 , 
-- 우리는 type class만 만들었지 , 넘겨야 할 instance를 만들지는 않았다. 


-- Int 타입을 BootConvertible 타입 클래스의 인스턴스로 만들기
{- 
- 타입 클래스의 instance로 만들기
    - instance 타입크래스이름  타입이름 where
    -   동작을 정의한 함수 구현부 .. 
 -}
instance BoolConvertible Int where
    isTrue 0 = False
    isTrue x = True

r1 = check (1::Int) (2::Int)
```

--------

## Functor , Applicative , Monad

### Functor 타입 클래스
- [tc3.hs](https://github.com/cheoljoo/educated-functional-programming-haskell/blob/master/tc3.hs)
- 함수인자에 대한 클래스 제약
    - 특정 함수를 사용하기 위해서는 인자 타입이 가져야 하는 조건이 존재하는 경우가 있다. 
    - mod 함수의 인자 로는 Integral 타입 클래스의 인스턴스 타입만 사용할수 있다.
```haskell
> fmap (*2) [2]         => ok
> fmap (*2) [2,1]       => ok
> fmap (*2) (Just 2)        => ok
> fmap (*2)  2  => error 
> :t fmap
 fmap :: Functor f => (a -> b) -> f a -> f b
```
- Maybe는 C++의 template과 같은 것이다. type이 아니다.
    - Maybe는 구체화 타입(Concrete)가 아니다. 
    - Maybe 타입 하나를 받아서 타입을 만드는 타입 생성자이다. 
- Functor
    - class Functor f where
        - fmap :: Functor f => (a -> b) -> f a -> f b
        - f는 type이 아니라 , type 생성자 이다. (Maybe와 같은 의미)
    - f는 타입생성자 (template) 이다.
```haskell
-- echo :: Maybe Int -> Maybe Int
-- echo x = x

class XFunctor f where
    xfmap :: (a->b) -> f a -> f b

-- Maybe를 XFunctor의 인스턴스로 만들기
instance XFunctor Maybe where
    xfmap f (Just x) = Just (f x)

r1 = xfmap (*2) (Just 2)   -- 이를 위해서 Maybe를 XFunctor의 instance로 주어야 한다. 
    -- Just 4

instance XFunctor [] where
    xfmap f [] = []
    xfmap f (x:xs) = f x : xfmap f xs

r2 = xfmap (*2) [1,2]

```

--------


### Applicative , Monad 타입 클래스
- `<*>` 함수
    - applicative 타입 클래스의 인스턴스 타입에만 사용하룻 있다.
    - 리스트 , Maybe , IO
- >>= 연산자 (pipe)
    - Monad 타입클래스의 인스턴스 타입에만 사용할수 있다.
    - 리스트 , Maybe , IO
```haskell
> [ (+1) , (*3) ] <*> [1,2,3]
[2,3,4,3,6,9]
> [1,2,3] >>= (\x -> [x,-x])    -- linux의 pipe
[1,-1,2,-2,3,-3]
> Just 3 >>= (\x -> Just (x*3))
Just 9
> :i Monad
> :i Applicative
```

