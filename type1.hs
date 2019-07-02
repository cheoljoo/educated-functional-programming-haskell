type Meter = Double     -- 새로운 별명
    -- type 별칭 = 기존 타입

type Meter = Double
type Yard = Double

-- Meter 단위 값을 Yard 단위 값으로 변경하는 함수

convert :: Meter->Yard
convert m = m * 1.093

