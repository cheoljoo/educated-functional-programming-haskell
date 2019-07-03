{-
data List = Empty | Node Int List   deriving Show    -- 재귀적 data type (자기 이름을 또 쓴다.)

r1 = Empty
r2 = Node 10 Empty
r3 = Node 20 (Node 10 Empty)
r4 = Node 30 (Node 20 (Node 10 Empty))

- Empty 생성자 : 비어있는 리스트 생성
- Node생성자 : 값과 다음 List 를 가지고 List 생성
-}

{-
data List a = Empty | Node a (List a)   deriving Show    -- 재귀적 data type (자기 이름을 또 쓴다.)
r5 = Node 3.3 Empty
r6 = Node 2.2 (Node 3.3 Empty)
-}

-- 특수 문자로 생성자 만들기
-- Node => :+
-- Node 10 Empty => 10 :+ Empty
data List a = Empty | a :+ (List a) deriving Show
r7 = 10 :+ Empty
r8 = 20 :+ (10 :+ Empty)
    -- haskell이 가지고 있던 원래 있던 list
    -- Empty == []
    -- 1:[] == 1 :+ Empty



