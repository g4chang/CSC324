{- Assignment 3 - Memory and Mutation

This file contains code which uses the mutation library found in Mutation.hs
-}

import Mutation (
    get, set, def, Mutable, Pointer(..), StateOp(..), Memory, (>>>), (>~>),
    returnVal, Value(..), runOp)

-- | Takes a number <n> and memory, and stores two new values in memory:
--   - the integer (n + 3) at location 100
--   - the boolean (n > 0) at location 500
--   Return the pointer to each stored value, and the new memory.
--   You may assume these locations are not already used by the memory.
--   Original:
-- pointerTest :: Integer -> Memory -> ((Pointer Integer, Pointer Bool), Memory)
pointerTest :: Integer -> StateOp (Pointer Integer, Pointer Bool)
pointerTest num = def 100 (num + 3) >~> \p1 ->
                      def 500 (num > 0) >~> \p2 ->
                      returnVal (p1, p2)
                        {-((firstPtr, secondPtr), secondMem) where
                            firstLambda = (def 100 (num + 3))
                            firstPair = firstLambda mem
                            firstPtr = fst firstPair
                            firstMem = snd firstPair
                            secondLambda = (def 500 (num > 0))
                            secondPair = secondLambda firstMem
                            secondPtr = fst secondPair
                            secondMem = snd secondPair-}

swap :: Mutable a => Pointer a -> Pointer a -> StateOp ()
swap (P p1) (P p2) = undefined

swapCycle :: Mutable a => [Pointer a] -> StateOp ()
swapCycle ((P p):ps) = undefined
