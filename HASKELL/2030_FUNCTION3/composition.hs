-- 리스트에 있는 모든 요소를 음수로 변경한후
-- 리스트의 합을 구하고 싶다.
-- [1,-2,-3,4,-5]

r1 = map negate [1,-2,-3,4,-5]   -- [-1,2,3,-4,5]

r2 = map (negate . abs) [1,-2,-3,4,-5]   -- [-1,-2,-3,-4,-5]

r3 = sum $ map (negate . abs) [1,-2,-3,4,-5]
