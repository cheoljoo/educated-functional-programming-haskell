f1 :: Int -> Maybe Int  -- 0이면 실패(Nothing) , 0이 아니면 2배
f1 0 = Nothing
f1 n = Just ( n * 2 )

f2 :: Int -> Maybe Int  -- 0이면 실패(Nothing) , 0이 아니면 3배
f2 0 = Nothing
f2 n = Just ( n * 3 )


-- f1과 f2를 동시에 수행
f1nf2 :: Int -> Maybe Int
--f1nf2 n = f2 ( f1 n )       -- f1 이 실패를 할수 있기에 이렇게 쉽게 쓰지는 못함. 
f1nf2 n = case f1 n of
    Nothing -> Nothing
    Just nn -> f2 nn

r1 = f1nf2 3


f1f2 :: Int -> Maybe Int
-- 각 줄마다 수행하며 실패하면 정지 (실패할 가능성을 고려) 
f1f2 n = do
    nn <- f1 n  -- nn에 Just가 떨어진다고함.
    f2 nn


