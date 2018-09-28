------------------------------ MODULE masters ------------------------------
EXTENDS Integers

CONSTANT ACTION

VARIABLES tableState  

TypeOK == tableState = [match -> {0,1}, normal_forwarding -> {0,1}]
          actionState = [ACTION \in 


 
TableMatch == /\ tableState.match = 1
              /\ tableState.normal_forwarding # tableState.match
              /\ action' =  1
          
Init == /\ big   = 0 
        /\ small = 0

FillSmall == /\ small' = 3 
             /\ big'   = big

FillBig == /\ big'   = 5 
           /\ small' = small

EmptySmall == /\ small' = 0 
              /\ big'   = big

EmptyBig == /\ big'   = 0 
            /\ small' = small

SmallToBig == IF big + small =< 5
               THEN /\ big'   = big + small
                    /\ small' = 0
               ELSE /\ big'   = 5
                    /\ small' = small - (5 - big)

BigToSmall == IF big + small =< 3
               THEN /\ big'   = 0 
                    /\ small' = big + small
               ELSE /\ big'   = small - (3 - big)
                    /\ small' = 3

Next == \/ FillSmall 
        \/ FillBig    
        \/ EmptySmall 
        \/ EmptyBig    
        \/ SmallToBig    
        \/ BigToSmall   




=============================================================================
\* Modification History
\* Last modified Fri Sep 28 18:13:37 BRT 2018 by ricardo
\* Created Fri Sep 28 17:44:37 BRT 2018 by ricardo
