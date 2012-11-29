module Problem23 where

limit :: Int
limit = 28213 

abundant :: [Int]
abundant = abundant' 1
         where abundant' :: Int ->[Int]
               abundant' n
                 | n == limit   = []
                 | isAbundant n = n : abundant' (n + 1)
                 | otherwise    = abundant' (n + 1)

isAbundant :: Int -> Bool
isAbundant n = sumDivisors n > n

sumDivisors :: Int -> Int
sumDivisors n = sumDivisors' 1
              where sumDivisors' :: Int -> Int
                    sumDivisors' m
                      | n == m         = 0
                      | n `mod` m == 0 = m + sumDivisors' (m + 1) 
                      | otherwise      = 0 + sumDivisors' (m + 1)

p23 = abundant
              
