

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

```

