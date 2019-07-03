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
