{- Generic
 -
 int returnNext (int x){
     return x+1;
 }

-}


returnNext :: Num a=> a->a  -- declare function
returnNext x = x + 1          -- Implementation

