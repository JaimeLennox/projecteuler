module Problem57 where

type Frac = (Integer, Integer) 

add1 :: Frac -> Frac
add1 (n, d) = (n + d, d) 

inverse :: Frac -> Frac
inverse (n, d) = (d, n)

root2 :: Int -> Frac
root2 m = add1 $ root2' m
  where root2' :: Int -> Frac
        root2' 0 = (0,1) 
        root2' n = (inverse . add1 . add1 . root2') (n - 1) 

root2list :: [Frac]
root2list = map root2 [1,2..]

trueL :: Frac -> Bool
trueL (n, d) = (length.show) n > (length.show) d

p57 = length $ filter trueL $ take 1000 root2list
