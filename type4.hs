newtype Meter = Meter Double  --deriving Show   -- Meter 3
newtype Yard = Yard Double

instance Show Yard where
     Show ( Yard y) = Show y ++ " yd"

instance Show Meter where
    Show ( Meter m) = Show m ++ " m"

-- r1 = Yard 3

