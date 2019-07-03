-- int 의 문제점 : 잘못된 값 (값 없음) 을 표현할수 없다.

{-
int foo( return 실패; }

struct Maybe
{
    bool b; // 유효성 
    int value;
};

template<typename T> struct Maybe
{
    bool b; 
    T value;
};
Maybe<int> m; // int를 보관하고 , 값 을 나타낼수 있다. 
            // optional
-}

-- data Shape a = Circle | Rectangle a
-- data Maybe a = Nothing | Just a

-- :i Maybe
-- data Maybe a = Nothing | Just a 

-- 입력된 값이 5이상이면 다음수를 반환 / 5 이하이면 실패 반환
{-
next :: Int -> Int
next x
    | x>5 = succ x
    | othersize = ??;
-}
next :: Int -> Maybe Int     -- 일종이 template
next x
    | x>5 = Just (succ x)
    | otherwise = Nothing ;

r5 = next 5


-- Maybe Int 를 받아서 Int 반환
-- getValue (Just 8)
getValue :: Maybe Int -> Int
getValue (Just m) = m
getValue (Nothing) = 0

r6 = getValue (Just 8)   -- 8
r7 = getValue (next 8)   -- 9 
r8 = getValue (next 3)   -- 0



