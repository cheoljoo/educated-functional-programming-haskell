
# Monad IO

## Monad IO

### Monad
- [monad1.hs](https://github.com/cheoljoo/educated-functional-programming-haskell/blob/master/monad1.hs)
- f1, f2를 동시에 수행
- Maybe에서 jsut가 떨어지며 , 자동으로 실패하면 멈춤 
```haskell
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
```

--------


- [monad2.hs](https://github.com/cheoljoo/educated-functional-programming-haskell/blob/master/monad2.hs)
```haskell
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
```

--------


###  pipeline
- [monad3.hs](https://github.com/cheoljoo/educated-functional-programming-haskell/blob/master/monad3.hs)
```haskell

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

```

--------

