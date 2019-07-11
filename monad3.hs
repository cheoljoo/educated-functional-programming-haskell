
af1f2 :: Int -> Maybe Int
-- 각 줄마다 수행하며 실패하면 정지 (실패할 가능성을 고려) 
af1f2 n = do
    nn <- af1 n  -- nn에 Just가 떨어진다고함.
    af2 nn


bf1f2 :: Int -> [Int]
bf1f2 n = do
    nn <- bf1 n   -- 복수의 요소를 고려한 연산
    bf2 nn


bf1f2 :: Int -> [Int]
bf1f2 n = bf1 n >>= bf2   -- pipeline

