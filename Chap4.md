

# Module

## Module

### Module Import
- [module1.hs](https://github.com/cheoljoo/educated-functional-programming-haskell/blob/master/module1.hs)
- Module
  - 관련된 함숭와 타입을 묶어놓는 제공하는 단위
- Prelude
  - Haskell 기본 모듈
  - 기본 타입과 다양한 기본 함수 제공
  - default import
- 모듈을 import하는 방법
  - import Data.List
    - import Data.List (sort)   : sort함수만 import
    - import Data.List hiding (sort)  : sort함수만 제외
    - import qualified Data.List  : Data.List.sort 로 완전한 전체 이름을 써 달라.
    - import qualified DAta.List as L   : L.sort로 사용
    - :m - Data.List    : Data.List unload
    - :m + Data.List    : import Data.List
```haskell
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
```

--------


