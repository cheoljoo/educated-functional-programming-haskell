-- 1:+Empty
data List a = Empty | a :+ (List a) deriving Show


-- + (+)    전위

-- 하스켈의 리스트를 List 넣기
r1 = foldr (:+) Empty [1,2,3,4] -- 1 op (2 op (3 op (4 op Empty)))
    -- 1 :+ (2 :+ (3 :+ (4 :+ Empty)))

-- List에 요소가 있는지 검사
-- myFind 5 List
myFind :: (Eq a) => a -> List a -> Bool
myFind _ Empty  = False
myFind v (f :+ st) 
    | v == f = True
    | otherwise = myFind v st

r2 = myFind 5 (3 :+ (2 :+ (5 :+ Empty)))
r3 = myFind 5 r1
r4 = myFind 3 r1
