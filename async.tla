------------------------------- MODULE async -------------------------------


EXTENDS Naturals

CONSTANT Data

VARIABLE chan

TypeInvariant == chan \in [val:Data, rdy:{0,1}, ack:{0,1}]

TCInit == /\ TypeInvariant
          /\ chan.ack = chan.rdy
          
Send(d) == /\ chan.rdy = chan.ack
           /\ chan' = [chan EXCEPT !.val = d, !.rdy = 1 - @]

Rcv == /\ chan.rdy # chan.ack
       /\ chan' = [chan EXCEPT !.ack = 1 - @]
          
TCNext == (\exists v \in Data: Send(v)) \/ Rcv

Spec == TCInit /\ [][TCNext]_chan

THEOREM Spec  => []TypeInvariant


=============================================================================
\* Modification History
\* Last modified Wed Sep 26 17:12:49 BRT 2018 by ricardo
\* Created Wed Sep 26 16:48:18 BRT 2018 by ricardo
