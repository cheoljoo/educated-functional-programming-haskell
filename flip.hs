myflip:: (a->b->c) -> (b->a->c)
myflip f = g
    where g x y = f y x

myflip2:: (a->b->c) -> b->a->c      -- 3 arguments : func(a,b)->c , b , a
myflip2 f x y = f y x
