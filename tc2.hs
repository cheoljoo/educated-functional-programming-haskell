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

