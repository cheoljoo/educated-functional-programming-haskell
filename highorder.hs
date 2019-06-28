-- Int -> Int -> Int

-- run twice with specific function
-- first argument is function with 1 argument
-- second argument is value
applyTwice :: (a->a)->a->a
applyTwice f x = f (f x)
