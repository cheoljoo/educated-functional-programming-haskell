

# Function

## Pattern Matching & Guard
- 패턴 매치을 사용한 함수 만들기
  - 함수의 인자의 패턴에 따라 서로 다른 구현을 제공
  - 매칭은 위에서부터 match를 한다. 
  - func5.hs
```haskell
 translate::Int -> String -- [Char]
translate 1 = "one"
translate 2 = "two"
translate _ = "sorry"
```

### tuple을 사용하는 패턴 매칭 (func5.hs)
- addPair (1,1) (2,3)
- func5.hs
  - pair 이용
  - pattern matching 이용
  - + generic 이용
- 3개 인자에서 1번째 , 2번째 , 3번째 요소를 꺼내는 함수
  - 패턴 매칭을 사용하기에 바로 요소를 접근할수 있다. 
```haskell
-- addPair::(Int,Int)->(Int,Int)->(Int,Int)
-- addPair p1 p2 = (fst p1 + fst p2 , snd p1 + snd p2)
-- addPair (x1,y1) (x2,y2) = (x1 + x2 , y1 + y2)  -- no need pair

addPair :: Num a => (a,a) -> (a,a) -> (a,a)  -- generic
addPair (x1,y1) (x2,y2) = (x1 + x2 , y1 + y2)  -- no need pair


-- get each element
-- fst (1,1)  but how to get in three...
first :: (a,b,c) -> a
--first (x,y,z) = x
first (x,_,_) = x
second (_,x,_) = x
third (_,_,x) = x
```

