newtype Meter = Meter Double  --deriving Show   -- Meter 3
newtype Yard = Yard Double

instance Show Yard where
     show ( Yard y) = show y ++ " yd"

instance Show Meter where
    show ( Meter m) = show m ++ " m"

r1 = Yard 3


-- Meter 를 Yard로 변경하는 함수

-- convert (Meter 3)
convert:: Meter->Yard
convert (Meter m) = Yard (m * 1.09)     -- Meter , Yard의 생성자를 이용
