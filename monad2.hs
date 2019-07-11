-- f1 4 => [0,1,2,3]

f1 :: Int -> [Int]
f1 n  = [0..n-1]

-- 인자로 전달된 요소의 +1 , -1 값을 구하고 싶다.
f2 :: Int -> [Int]
f2 n = [n+1 , n-1]

-- f1의 결과에 대해서 f2를 적용하고 싶다.
f1nf2 :: Int -> [Int]
-- f1nf2 n = map f2 (f1 n)     -- error발생
f1nf2 n = concat (map f2 (f1 n) )

r1 = f1nf2 4



f1f2 :: Int -> [Int]
f1f2 n = do
    nn <- f1 n
    f2 nn

r2 = f1f2 4
