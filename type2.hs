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

