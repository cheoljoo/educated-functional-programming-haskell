-- ghc io1.hs

-- 출력
-- main = putStrLn "hello"


-- 입력 : io monad 로 부작용이 있을수 있다는 것을알리며 , 그래서 이 안에선만 사용
main = do
    name <- getLine
    addr <- getLine
    putStrLn (name ++ " " ++ addr)


