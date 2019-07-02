newtype Meter = Meter Double  --deriving Show   -- Meter 3
newtype Yard = Yard Double

instance Show Yard where
     show ( Yard y) = show y ++ " yd"

instance Show Meter where
    show ( Meter m) = show m ++ " m"

r1 = Yard 3

