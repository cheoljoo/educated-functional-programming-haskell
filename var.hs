{- 
 -- make variable

-}

one::Int->Int
one x=x


-- no argument  (this is variable as interger)
no::Int
no=1       -- binding (only once)
--no=2       -- error

removeLower ss = [c | c<-ss,elem c ['A'..'Z']]
size xs=sum[1|x<-xs]
