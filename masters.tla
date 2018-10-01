------------------------------ MODULE masters ------------------------------
EXTENDS Integers

CONSTANT ACT

VARIABLES tableState, actionState, flowRegister 

TypeOK == /\ tableState = [match:{0,1}, normal_forwarding:{0,1}, flowRegister:{0,1}, high_threshold:{0,1}] 
          /\ actionState \in [ACT -> {"proactive_phase", "reative_phase", "warning"}]


TCInit == /\ TypeOK
          /\ actionState = "proactive_phase"


TableMatch == /\ tableState.match = 1
              /\ tableState.normal_forwarding # tableState.match
              /\ actionState' = "proactive_phase"
                
Action == /\ actionState = "proactive_phase"
          /\ tableState.normal_forwarding = 0
          /\ tableState.match # tableState.normal_forwarding
          /\ \/ actionState' = "reactive_phase"
             \/ tableState.normal_forwarding' = 1
             
Reactive == /\ actionState = "reactive_phase"
            /\ tableState.normal_forwarding = 0
            /\ tableState.match # tableState.normal_forwarding
            /\ \/ /\ tableState.high_threshold = 1
                  /\ actionState' = "warning"
               \/ /\ tableState.high_threshold = 0
                  /\ tableState.normal_forwarding' = 1
               
             
TCNext == 
              
              
         



=============================================================================
\* Modification History
\* Last modified Mon Oct 01 17:29:28 BRT 2018 by ricardo
\* Created Fri Sep 28 17:44:37 BRT 2018 by ricardo
