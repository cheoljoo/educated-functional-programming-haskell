-- 각 자릿수의 합이 15가 되는 최초의 숫자는?
-- 1423 => 1+4+2+3 = 10

-- Data.Char.digitToInt
    --  문자를 하나 받아서 숫자로 변경하는 함수 
-- Data.List.find
    -- 단항 조건자와  리스트를 받아서 조건을 만족하는 첫번째 요소를 찾는다.

import Data.Char
import Data.List

-- digitToSum : 숫자를 받아서 각 자리수를 더한 합을 반환
digitToSum :: Int -> Int
-- digitToSum x = ... ;    -- 일반적인 함수
-- 1423 =show=> "1423" =map=> map digitToInt => [1 4 2 3] =sum=> 10
digitToSum = sum . map digitToInt . show

r1 = digitToSum 1423        -- 10


-- calcTo 15 => 어떤 숫자의 자릿수를 더하면 15가 되는지?
calcTo :: Int -> Maybe Int
calcTo n = find (\x -> digitToSum x == n) [1..]  -- [1,2,3,4, ....]

r2 = calcTo 15   -- 69
r3 = calcTo 49   -- 499999
