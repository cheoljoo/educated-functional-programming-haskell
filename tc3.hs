-- echo :: Maybe Int -> Maybe Int
-- echo x = x

class XFunctor f where
    xfmap :: (a->b) -> f a -> f b

-- Maybe를 XFunctor의 인스턴스로 만들기
instance XFunctor Maybe where
    xfmap f (Just x) = Just (f x)

r1 = xfmap (*2) (Just 2)   -- 이를 위해서 Maybe를 XFunctor의 instance로 주어야 한다. 
    -- Just 4

instance XFunctor [] where
    xfmap f [] = []
    xfmap f (x:xs) = f x : xfmap f xs

r2 = xfmap (*2) [1,2]

