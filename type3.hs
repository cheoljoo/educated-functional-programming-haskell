newtype Meter = Meter Double
newtype Yard = Yard Double

-- Meter를 받아서 Double을 반환하는 함수
-- getValue ( Meter 3)  => 3

getValue :: Meter -> Double
getValue (Meter m) = m      -- ()때문에 1개의 인자로 인식 pattern matching

r1 = getValue $ Meter 3
