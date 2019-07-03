data Shape = Circle Double Double Double | Rectangle Double Double Double Double deriving (Show , Eq)

{-
- True 생성자와 False 생성자가 있다.
- True와 False 생성자는 인자를 가지고 있지 않다.
 -}
-- data Bool = True | False

-- :i Bool

r1 = compare 3 5  -- LT
-- :t compre
-- compare :: a -> a -> Ordering
-- :i Ordering
-- data Ordering = LT | EQ | GT    -- Defined in ‘GHC.Types’

-- 1주일을 표현하고 싶다.
data Week = Mon | Tue | Wed | Thu | Fri | Sat | Sun 
    deriving (Show , Eq , Enum)

-- Enum이므로 succ 연산 가능
r2 = succ Mon     -- Tue

