-- 점을 나타내는 point 타입

-- newtype Point = Point Double Double  --error : newtype은 1개의 field만 가져야 한다.


data Point  = Point Double Double deriving (Show , Eq)

r1 = Point 1 1

r2 = (Point 1 1) == (Point 0 0)     -- False
r3 = (Point 1 1) == (Point 1 1)     -- True


-- 생성자를 2개 이상 가질수 있다.
data Shape = Circle Double Double Double | Rectangle Double Double Double Double deriving (Show , Eq)

r4 = Circle 1 1 5
r5 = Rectangle 1 1 10 10


data Shape2 = Circle2 Point  Double | Rectangle2 Point Point deriving (Show , Eq)
r6 = Circle2 (Point 1 1) 5
r7 = Rectangle2 (Point 1 1) (Point 10 10)


-- Shape2를 사용하는 함수 만들기
-- 면적을 구하는 함수
-- area (Circle2 (Point 1 1 ) 5)
-- area (Rectangle2 (Point 1 1) (Point 10 10))

area :: Shape2->Double
area (Circle2 pt r) =  3.14 * r^2
area (Rectangle2 (Point x1 y1) (Point x2 y2)) =   (x2-x1) * (y2-y1)

r8 = area ( Circle2 (Point 1 1) 5)  -- 78.5
r9 = area ( Rectangle2 (Point 1 1) (Point 10 10)) --  81.0




