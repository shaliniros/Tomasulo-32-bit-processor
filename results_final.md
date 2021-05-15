# Results

## Cycle : 0

COMMITT STAGE :

        Rob : Empty

EXECUTION3_eac_and memory fetch STAGE :

        F2-Busy : 0

WRITE BACK STAGE :

EXECUTION1 STAGE :

        F0-Busy : 0

EXECUTION2 STAGE :

        F1-Busy : 0

DECODE STAGE :

        Stall , IQ : Empty

FETCH STAGE :

        PC : 0 

        Fetched : 00012183 

        Instruction queue

        Size :           1 
        Head : 0 
        Tail : 1 

## Cycle : 1

COMMITT STAGE :

        Rob : Empty

EXECUTION3_eac_and memory fetch STAGE :

        F2-Busy : 0

WRITE BACK STAGE :

EXECUTION1 STAGE :

        F0-Busy : 0

EXECUTION2 STAGE :

        F1-Busy : 0

DECODE STAGE :

        Decoded : 00012183 , Location : RS3 

        R0B : 

        1.ROB Head : 0
        2.ROB Tail : 0
        3.Opcode : 03
        4.Destination Register : 03
        5.Valid value : 0
        6.Committed : 0
        7.Rob Size :           1  

        Reservation Station 3  

         1.Index :           0
         2.Size :           1
         1. : x
         5.Rs1 : R[02] 
         8.Rd : Rob [0] 
         *k : 00000000 
         *.run.res3_sr1_refrence[k] : 1 
         *.run.res3_free_entry[k] : 0 
         *.run.res3_issued[k] : 0 
         9.Ready : 1 

FETCH STAGE :

        PC : 1 

        Fetched : 0241c133 

        Instruction queue

        Size :           1 
        Head : 1 
        Tail : 2 

## Cycle : 2

COMMITT STAGE :

        Instruction : 00012183 , Waiting for Values

head=000 run.head run.v_des\[run.head\] = 0 run.commit\[run.head\]=0
EXECUTION3_eac_and memory fetch STAGE :

        Res3_ready: 1

run.res3_signext=00000000000000000000000000000000
run.res3_eac=00000000000000000000000000010000 Reservation Station 3

        Index : 00000000
        Free : 1

        Intruction : 00012183 , Executing starts
        Functional Unit : F2
        F2-Busy : 1
        Executing : 00012183

WRITE BACK STAGE :

EXECUTION1 STAGE :

        F0-Busy : 0

EXECUTION2 STAGE :

        F1-Busy : 0

DECODE STAGE :

        Decoded : 0241c133 , Location : RS2 

        R0B : 

        1.ROB Head : 0
        2.ROB Tail : 1
        3.Opcode : 33
        4.Destination Register : 02
        5.Valid value : 0
        6.Committed : 0
        7.Rob Size :           2  

        Reservation Station 2  

         1.Index :           0
         2.Size :           1
         1.Index :           0
         3.func3 : 4
         4.Rs1 : Rob [0] 
         7.Rs2 : R[04] 
         8.Rd : Rob [1] 
         9.Ready : 0 

FETCH STAGE :

        PC : 2 

        Fetched : 026280b3 

        Instruction queue

        Size :           1 
        Head : 2 
        Tail : 3 

## Cycle : 3

COMMITT STAGE :

        Instruction : 00012183 , Waiting for Values

head=000 run.head run.v_des\[run.head\] = 0 run.commit\[run.head\]=0
EXECUTION3_eac_and memory fetch STAGE :

        F2-Busy : 1
        Executing : 00012183

WRITE BACK STAGE :

EXECUTION1 STAGE :

        F0-Busy : 0

EXECUTION2 STAGE :

        F1-Busy : 0

DECODE STAGE :

        Decoded : 026280b3 , Location : RS2 

        R0B : 

        1.ROB Head : 0
        2.ROB Tail : 2
        3.Opcode : 33
        4.Destination Register : 01
        5.Valid value : 0
        6.Committed : 0
        7.Rob Size :           3  

        Reservation Station 2  

         1.Index :           1
         2.Size :           2
         1.Index :           1
         3.func3 : 0
         5.Rs1 : R[05] 
         7.Rs2 : R[06] 
         8.Rd : Rob [2] 
         9.Ready : 1 

FETCH STAGE :

        PC : 3 

        Fetched : 008381b3 

        Instruction queue

        Size :           1 
        Head : 3 
        Tail : 4 

## Cycle : 4

COMMITT STAGE :

        Instruction : 00012183 , Waiting for Values

head=000 run.head run.v_des\[run.head\] = 0 run.commit\[run.head\]=0
EXECUTION3_eac_and memory fetch STAGE :

        F2-Busy : 1
        Executing : 00012183

WRITE BACK STAGE :

EXECUTION1 STAGE :

        F0-Busy : 0

EXECUTION2 STAGE :

        Reservation Station 1

        Index : 00000001
        Free : 1

        Intruction : 026280b3 , Executing starts
        Functional Unit : F1
        Multiplying : 00000003 * 00000004

        F1-Busy : 1
        Executing : 026280b3

DECODE STAGE :

        Decoded : 008381b3 , Location : RS1 

        R0B  

        1.ROB Head : 0
        2.R0B Tail : 3
        3.Opcode : 33
        4.Destination Register : 03
        5.Valid value : 0
        6.Committed : 0
        7.Rob Size 

: 4 Reservation Station 1

         1.Index :           0
         2.Size :           1
         3.funct7 : 00
         5.Rs1 : R[07] 
         7.Rs2 : R[08] 
         8.Rd : Rob [3] 
         9.Ready : 1 

FETCH STAGE :

        PC : 4 

        Fetched : 023080b3 

        Instruction queue

        Size :           1 
        Head : 4 
        Tail : 5 

run.multlat= 1

## Cycle : 5

COMMITT STAGE :

        Instruction : 00012183 , Waiting for Values

head=000 run.head run.v_des\[run.head\] = 0 run.commit\[run.head\]=0
EXECUTION3_eac_and memory fetch STAGE :

        F2-Busy : 1
        Executing : 00012183

WRITE BACK STAGE :

EXECUTION1 STAGE :

        Reservation Station 1

        Index : 00000000
        Free : 1

         Intruction : 008381b3 , Executing starts
         Functional Unit : F0
         adding : 00000001 + 00000002

        F0-Busy : 1
        Executing : 008381b3

EXECUTION2 STAGE :

        F1-Busy : 1
        Executing : 026280b3

DECODE STAGE :

        Decoded : 023080b3 , Location : RS2 

        R0B : 

        1.ROB Head : 0
        2.ROB Tail : 4
        3.Opcode : 33
        4.Destination Register : 01
        5.Valid value : 0
        6.Committed : 0
        7.Rob Size :           5  

        Reservation Station 2  

         1.Index :           1
         2.Size :           2
         1.Index :           1
         3.func3 : 0
         4.Rs1 : Rob [2] 
         6.Rs2 : Rob[3] 
         8.Rd : Rob [4] 
         9.Ready : 0 

FETCH STAGE :

        PC : 5 

        Fetched : 40508233 

        Instruction queue

        Size :           1 
        Head : 5 
        Tail : 6 

run.multlat= 2 lddd

## Cycle : 6

COMMITT STAGE :

        Instruction : 00012183 , Waiting for Values

head=000 run.head run.v_des\[run.head\] = 0 run.commit\[run.head\]=0
EXECUTION3_eac_and memory fetch STAGE :

        F2-Busy : 1
        Executing : 00012183

WRITE BACK STAGE :

EXECUTION1 STAGE :

        F0-Busy : 1
        Executing : 008381b3

EXECUTION2 STAGE :

        F1-Busy : 1
        Executing : 026280b3

DECODE STAGE :

        Decoded : 40508233 , Location : RS1 

        R0B  

        1.ROB Head : 0
        2.R0B Tail : 5
        3.Opcode : 33
        4.Destination Register : 04
        5.Valid value : 0
        6.Committed : 0
        7.Rob Size 

: 6 Reservation Station 1

         1.Index :           0
         2.Size :           1
         3.funct7 : 20
         4.Rs1 : Rob [4] 
         7.Rs2 : R[05] 
         8.Rd : Rob [5] 
         9.Ready : 0 

FETCH STAGE :

        PC : 6 

        Fetched : 002200b3 

        Instruction queue

        Size :           1 
        Head : 6 
        Tail : 7 

run.multlat= 3 Instruction : 008381b3 , Execution Complete

        Functional Unit: F0
        Result : 00000003 

        Instruction : 00012183 , Execution Complete
        Functional Unit: F2
        Result : 00000002 

## Cycle : 7

COMMITT STAGE :

        Instruction : 00012183 , Waiting for Values

head=000 run.head run.v_des\[run.head\] = 0 run.commit\[run.head\]=0
EXECUTION3_eac_and memory fetch STAGE :

        F2-Busy : 1
        Executing : 00012183

WRITE BACK STAGE :

        Instruction : 008381b3 , Written Back

        ROB

        1.Index : 3
        2.Rd : 03
        3.Value : 00000003
        4.Ready to Retire : 1
        5.Committed : 0

         Updates

EXECUTION1 STAGE :

        F0-Busy : 0

EXECUTION2 STAGE :

        F1-Busy : 1
        Executing : 026280b3

DECODE STAGE :

        Decoded : 002200b3 , Location : RS1 

        R0B  

        1.ROB Head : 0
        2.R0B Tail : 6
        3.Opcode : 33
        4.Destination Register : 01
        5.Valid value : 0
        6.Committed : 0
        7.Rob Size 

: 7 Reservation Station 1

         1.Index :           1
         2.Size :           2
         3.funct7 : 00
         4.Rs1 : Rob [5] 
         6.Rs2 : Rob [1] 
         8.Rd : Rob [6] 
         9.Ready : 0 
        Instruction : 00012183 , Written Back

        ROB

        1.Index : 0
        2.Rd : 03
        3.Value : 00000002
        4.Ready to Retire : 1
        5.Committed : 0

FETCH STAGE :

        PC : 7 

        Fetched : xxxxxxxx 

        Instruction queue

        Size :           1 
        Head : 7 
        Tail : 0 

        RS : 2
        Index :           1
        Rs2 : 00000003

        RS : 2
        Index :           0
        Rs1 : 00000002

        RS : 2
        Index :           0
        Ready : 1

run.multlat= 4

## Cycle : 8

COMMITT STAGE :

        Instruction : 00012183 , Committed

         ROB

         1.Head : 1
         2.Committed : 0
         3.Size : 00000006

EXECUTION3_eac_and memory fetch STAGE :

        F2-Busy : 0

WRITE BACK STAGE :

EXECUTION1 STAGE :

        F0-Busy : 0

EXECUTION2 STAGE :

        F1-Busy : 1
        Executing : 026280b3

DECODE STAGE :

        Unvalid Opcode x

FETCH STAGE :

        PC : 8 

        Fetched : xxxxxxxx 

        Instruction queue

        Size :           1 
        Head : 7 
        Tail : 1 

run.multlat= 5

## Cycle : 9

COMMITT STAGE :

        Instruction : 0241c133 , Waiting for Values

head=001 run.head run.v_des\[run.head\] = 0 run.commit\[run.head\]=0
EXECUTION3_eac_and memory fetch STAGE :

        F2-Busy : 0

WRITE BACK STAGE :

EXECUTION1 STAGE :

        F0-Busy : 0

EXECUTION2 STAGE :

        F1-Busy : 1
        Executing : 026280b3

DECODE STAGE :

        Unvalid Opcode x

FETCH STAGE :

        PC : 9 

        Fetched : xxxxxxxx 

        Instruction queue

        Size :           1 
        Head : 7 
        Tail : 2 

run.multlat= 6

## Cycle : 10

COMMITT STAGE :

        Instruction : 0241c133 , Waiting for Values

head=001 run.head run.v_des\[run.head\] = 0 run.commit\[run.head\]=0
EXECUTION3_eac_and memory fetch STAGE :

        F2-Busy : 0

WRITE BACK STAGE :

EXECUTION1 STAGE :

        F0-Busy : 0

EXECUTION2 STAGE :

        F1-Busy : 1
        Executing : 026280b3

DECODE STAGE :

        Unvalid Opcode x

FETCH STAGE :

        PC : a 

        Fetched : xxxxxxxx 

        Instruction queue

        Size :           1 
        Head : 7 
        Tail : 3 

run.multlat= 7

## Cycle : 11

COMMITT STAGE :

        Instruction : 0241c133 , Waiting for Values

head=001 run.head run.v_des\[run.head\] = 0 run.commit\[run.head\]=0
EXECUTION3_eac_and memory fetch STAGE :

        F2-Busy : 0

WRITE BACK STAGE :

EXECUTION1 STAGE :

        F0-Busy : 0

EXECUTION2 STAGE :

        F1-Busy : 1
        Executing : 026280b3

DECODE STAGE :

        Unvalid Opcode x

FETCH STAGE :

        PC : b 

        Fetched : xxxxxxxx 

        Instruction queue

        Size :           1 
        Head : 7 
        Tail : 4 

run.multlat= 8

## Cycle : 12

COMMITT STAGE :

        Instruction : 0241c133 , Waiting for Values

head=001 run.head run.v_des\[run.head\] = 0 run.commit\[run.head\]=0
EXECUTION3_eac_and memory fetch STAGE :

        F2-Busy : 0

WRITE BACK STAGE :

EXECUTION1 STAGE :

        F0-Busy : 0

EXECUTION2 STAGE :

        F1-Busy : 1
        Executing : 026280b3

DECODE STAGE :

        Unvalid Opcode x

FETCH STAGE :

        PC : c 

        Fetched : xxxxxxxx 

        Instruction queue

        Size :           1 
        Head : 7 
        Tail : 5 

run.multlat= 9

## Cycle : 13

COMMITT STAGE :

        Instruction : 0241c133 , Waiting for Values

head=001 run.head run.v_des\[run.head\] = 0 run.commit\[run.head\]=0
EXECUTION3_eac_and memory fetch STAGE :

        F2-Busy : 0

WRITE BACK STAGE :

EXECUTION1 STAGE :

        F0-Busy : 0

EXECUTION2 STAGE :

        F1-Busy : 1
        Executing : 026280b3

DECODE STAGE :

        Unvalid Opcode x

FETCH STAGE :

        PC : d 

        Fetched : xxxxxxxx 

        Instruction queue

        Size :           1 
        Head : 7 
        Tail : 6 

        Instruction : 026280b3 , Execution Complete
        Functional Unit: F1
        Result : 0000000c 

## Cycle : 14

COMMITT STAGE :

        Instruction : 0241c133 , Waiting for Values

head=001 run.head run.v_des\[run.head\] = 0 run.commit\[run.head\]=0
EXECUTION3_eac_and memory fetch STAGE :

        F2-Busy : 0

WRITE BACK STAGE :

        Instruction : 026280b3 , Written Back

        ROB

        1.Index : 010 tail: 010 
        2.Rd : 01
        3.Value : 0000000c
        4.Ready to Retire : 1      4*.Ready to Retire : 1
        5.Committed : 0

        Updates

EXECUTION1 STAGE :

        F0-Busy : 0

EXECUTION2 STAGE :

        Reservation Station 2

        Index : 00000000
        Free : 1

        Intruction : 0241c133 , Executing starts 
        Functional Unit : F1
        Dividing : 00000002 / 00000005

        F1-Busy : 1
        Executing : 0241c133

DECODE STAGE :

        Unvalid Opcode x

FETCH STAGE :

        PC : e 

        Fetched : xxxxxxxx 

        Instruction queue

        Size :           1 
        Head : 7 
        Tail : 7 

        RS : 2
        Index :           1
        Rs1 : 0000000c

        RS : 2
        Index :           1
        Ready : 1

run.divlat= 1

## Cycle : 15

COMMITT STAGE :

        Instruction : 0241c133 , Waiting for Values

head=001 run.head run.v_des\[run.head\] = 0 run.commit\[run.head\]=0
EXECUTION3_eac_and memory fetch STAGE :

        F2-Busy : 0

WRITE BACK STAGE :

EXECUTION1 STAGE :

        F0-Busy : 0

EXECUTION2 STAGE :

        F1-Busy : 1
        Executing : 0241c133

DECODE STAGE :

        Unvalid Opcode x

FETCH STAGE :

        PC : f 

        Fetched : xxxxxxxx 

        Instruction queue

        Size :           1 
        Head : 7 
        Tail : 0 

run.divlat= 2

## Cycle : 16

COMMITT STAGE :

        Instruction : 0241c133 , Waiting for Values

head=001 run.head run.v_des\[run.head\] = 0 run.commit\[run.head\]=0
EXECUTION3_eac_and memory fetch STAGE :

        F2-Busy : 0

WRITE BACK STAGE :

EXECUTION1 STAGE :

        F0-Busy : 0

EXECUTION2 STAGE :

        F1-Busy : 1
        Executing : 0241c133

DECODE STAGE :

        Unvalid Opcode x

FETCH STAGE :

        PC : 0 

        Fetched : 00012183 

        Instruction queue

        Size :           1 
        Head : 7 
        Tail : 1 

run.divlat= 3

## Cycle : 17

COMMITT STAGE :

        Instruction : 0241c133 , Waiting for Values

head=001 run.head run.v_des\[run.head\] = 0 run.commit\[run.head\]=0
EXECUTION3_eac_and memory fetch STAGE :

        F2-Busy : 0

WRITE BACK STAGE :

EXECUTION1 STAGE :

        F0-Busy : 0

EXECUTION2 STAGE :

        F1-Busy : 1
        Executing : 0241c133

DECODE STAGE :

        Unvalid Opcode x

FETCH STAGE :

        PC : 1 

        Fetched : 0241c133 

        Instruction queue

        Size :           1 
        Head : 7 
        Tail : 2 

run.divlat= 4

## Cycle : 18

COMMITT STAGE :

        Instruction : 0241c133 , Waiting for Values

head=001 run.head run.v_des\[run.head\] = 0 run.commit\[run.head\]=0
EXECUTION3_eac_and memory fetch STAGE :

        F2-Busy : 0

WRITE BACK STAGE :

EXECUTION1 STAGE :

        F0-Busy : 0

EXECUTION2 STAGE :

        F1-Busy : 1
        Executing : 0241c133

DECODE STAGE :

        Unvalid Opcode x

FETCH STAGE :

        PC : 2 

        Fetched : 026280b3 

        Instruction queue

        Size :           1 
        Head : 7 
        Tail : 3 

run.divlat= 5

## Cycle : 19

COMMITT STAGE :

        Instruction : 0241c133 , Waiting for Values

head=001 run.head run.v_des\[run.head\] = 0 run.commit\[run.head\]=0
EXECUTION3_eac_and memory fetch STAGE :

        F2-Busy : 0

WRITE BACK STAGE :

EXECUTION1 STAGE :

        F0-Busy : 0

EXECUTION2 STAGE :

        F1-Busy : 1
        Executing : 0241c133

DECODE STAGE :

        Unvalid Opcode x

FETCH STAGE :

        PC : 3 

        Fetched : 008381b3 

        Instruction queue

        Size :           1 
        Head : 7 
        Tail : 4 

run.divlat= 6

## Cycle : 20

COMMITT STAGE :

        Instruction : 0241c133 , Waiting for Values

head=001 run.head run.v_des\[run.head\] = 0 run.commit\[run.head\]=0
EXECUTION3_eac_and memory fetch STAGE :

        F2-Busy : 0

WRITE BACK STAGE :

EXECUTION1 STAGE :

        F0-Busy : 0

EXECUTION2 STAGE :

        F1-Busy : 1
        Executing : 0241c133

DECODE STAGE :

        Unvalid Opcode x

FETCH STAGE :

        PC : 4 

        Fetched : 023080b3 

        Instruction queue

        Size :           1 
        Head : 7 
        Tail : 5 

run.divlat= 7

## Cycle : 21

COMMITT STAGE :

        Instruction : 0241c133 , Waiting for Values

head=001 run.head run.v_des\[run.head\] = 0 run.commit\[run.head\]=0
EXECUTION3_eac_and memory fetch STAGE :

        F2-Busy : 0

WRITE BACK STAGE :

EXECUTION1 STAGE :

        F0-Busy : 0

EXECUTION2 STAGE :

        F1-Busy : 1
        Executing : 0241c133

DECODE STAGE :

        Unvalid Opcode x

FETCH STAGE :

        PC : 5 

        Fetched : 40508233 

        Instruction queue

        Size :           1 
        Head : 7 
        Tail : 6 

run.divlat= 8

## Cycle : 22

COMMITT STAGE :

        Instruction : 0241c133 , Waiting for Values

head=001 run.head run.v_des\[run.head\] = 0 run.commit\[run.head\]=0
EXECUTION3_eac_and memory fetch STAGE :

        F2-Busy : 0

WRITE BACK STAGE :

EXECUTION1 STAGE :

        F0-Busy : 0

EXECUTION2 STAGE :

        F1-Busy : 1
        Executing : 0241c133

DECODE STAGE :

        Unvalid Opcode x

FETCH STAGE :

        PC : 6 

        Fetched : 002200b3 

        Instruction queue

        Size :           1 
        Head : 7 
        Tail : 7 

run.divlat= 9

## Cycle : 23

COMMITT STAGE :

        Instruction : 0241c133 , Waiting for Values

head=001 run.head run.v_des\[run.head\] = 0 run.commit\[run.head\]=0
EXECUTION3_eac_and memory fetch STAGE :

        F2-Busy : 0

WRITE BACK STAGE :

EXECUTION1 STAGE :

        F0-Busy : 0

EXECUTION2 STAGE :

        F1-Busy : 1
        Executing : 0241c133

DECODE STAGE :

        Unvalid Opcode x

FETCH STAGE :

        PC : 7 

        Fetched : xxxxxxxx 

        Instruction queue

        Size :           1 
        Head : 7 
        Tail : 0 

run.divlat= 10

## Cycle : 24

COMMITT STAGE :

        Instruction : 0241c133 , Waiting for Values

head=001 run.head run.v_des\[run.head\] = 0 run.commit\[run.head\]=0
EXECUTION3_eac_and memory fetch STAGE :

        F2-Busy : 0

WRITE BACK STAGE :

EXECUTION1 STAGE :

        F0-Busy : 0

EXECUTION2 STAGE :

        F1-Busy : 1
        Executing : 0241c133

DECODE STAGE :

        Unvalid Opcode x

FETCH STAGE :

        PC : 8 

        Fetched : xxxxxxxx 

        Instruction queue

        Size :           1 
        Head : 7 
        Tail : 1 

run.divlat= 11

## Cycle : 25

COMMITT STAGE :

        Instruction : 0241c133 , Waiting for Values

head=001 run.head run.v_des\[run.head\] = 0 run.commit\[run.head\]=0
EXECUTION3_eac_and memory fetch STAGE :

        F2-Busy : 0

WRITE BACK STAGE :

EXECUTION1 STAGE :

        F0-Busy : 0

EXECUTION2 STAGE :

        F1-Busy : 1
        Executing : 0241c133

DECODE STAGE :

        Unvalid Opcode x

FETCH STAGE :

        PC : 9 

        Fetched : xxxxxxxx 

        Instruction queue

        Size :           1 
        Head : 7 
        Tail : 2 

run.divlat= 12

## Cycle : 26

COMMITT STAGE :

        Instruction : 0241c133 , Waiting for Values

head=001 run.head run.v_des\[run.head\] = 0 run.commit\[run.head\]=0
EXECUTION3_eac_and memory fetch STAGE :

        F2-Busy : 0

WRITE BACK STAGE :

EXECUTION1 STAGE :

        F0-Busy : 0

EXECUTION2 STAGE :

        F1-Busy : 1
        Executing : 0241c133

DECODE STAGE :

        Unvalid Opcode x

FETCH STAGE :

        PC : a 

        Fetched : xxxxxxxx 

        Instruction queue

        Size :           1 
        Head : 7 
        Tail : 3 

run.divlat= 13

## Cycle : 27

COMMITT STAGE :

        Instruction : 0241c133 , Waiting for Values

head=001 run.head run.v_des\[run.head\] = 0 run.commit\[run.head\]=0
EXECUTION3_eac_and memory fetch STAGE :

        F2-Busy : 0

WRITE BACK STAGE :

EXECUTION1 STAGE :

        F0-Busy : 0

EXECUTION2 STAGE :

        F1-Busy : 1
        Executing : 0241c133

DECODE STAGE :

        Unvalid Opcode x

FETCH STAGE :

        PC : b 

        Fetched : xxxxxxxx 

        Instruction queue

        Size :           1 
        Head : 7 
        Tail : 4 

run.divlat= 14

## Cycle : 28

COMMITT STAGE :

        Instruction : 0241c133 , Waiting for Values

head=001 run.head run.v_des\[run.head\] = 0 run.commit\[run.head\]=0
EXECUTION3_eac_and memory fetch STAGE :

        F2-Busy : 0

WRITE BACK STAGE :

EXECUTION1 STAGE :

        F0-Busy : 0

EXECUTION2 STAGE :

        F1-Busy : 1
        Executing : 0241c133

DECODE STAGE :

        Unvalid Opcode x

FETCH STAGE :

        PC : c 

        Fetched : xxxxxxxx 

        Instruction queue

        Size :           1 
        Head : 7 
        Tail : 5 

run.divlat= 15

## Cycle : 29

COMMITT STAGE :

        Instruction : 0241c133 , Waiting for Values

head=001 run.head run.v_des\[run.head\] = 0 run.commit\[run.head\]=0
EXECUTION3_eac_and memory fetch STAGE :

        F2-Busy : 0

WRITE BACK STAGE :

EXECUTION1 STAGE :

        F0-Busy : 0

EXECUTION2 STAGE :

        F1-Busy : 1
        Executing : 0241c133

DECODE STAGE :

        Unvalid Opcode x

FETCH STAGE :

        PC : d 

        Fetched : xxxxxxxx 

        Instruction queue

        Size :           1 
        Head : 7 
        Tail : 6 

run.divlat= 16

## Cycle : 30

COMMITT STAGE :

        Instruction : 0241c133 , Waiting for Values

head=001 run.head run.v_des\[run.head\] = 0 run.commit\[run.head\]=0
EXECUTION3_eac_and memory fetch STAGE :

        F2-Busy : 0

WRITE BACK STAGE :

EXECUTION1 STAGE :

        F0-Busy : 0

EXECUTION2 STAGE :

        F1-Busy : 1
        Executing : 0241c133

DECODE STAGE :

        Unvalid Opcode x

FETCH STAGE :

        PC : e 

        Fetched : xxxxxxxx 

        Instruction queue

        Size :           1 
        Head : 7 
        Tail : 7 

run.divlat= 17

## Cycle : 31

COMMITT STAGE :

        Instruction : 0241c133 , Waiting for Values

head=001 run.head run.v_des\[run.head\] = 0 run.commit\[run.head\]=0
EXECUTION3_eac_and memory fetch STAGE :

        F2-Busy : 0

WRITE BACK STAGE :

EXECUTION1 STAGE :

        F0-Busy : 0

EXECUTION2 STAGE :

        F1-Busy : 1
        Executing : 0241c133

DECODE STAGE :

        Unvalid Opcode x

FETCH STAGE :

        PC : f 

        Fetched : xxxxxxxx 

        Instruction queue

        Size :           1 
        Head : 7 
        Tail : 0 

run.divlat= 18

## Cycle : 32

COMMITT STAGE :

        Instruction : 0241c133 , Waiting for Values

head=001 run.head run.v_des\[run.head\] = 0 run.commit\[run.head\]=0
EXECUTION3_eac_and memory fetch STAGE :

        F2-Busy : 0

WRITE BACK STAGE :

EXECUTION1 STAGE :

        F0-Busy : 0

EXECUTION2 STAGE :

        F1-Busy : 1
        Executing : 0241c133

DECODE STAGE :

        Unvalid Opcode x

FETCH STAGE :

        PC : 0 

        Fetched : 00012183 

        Instruction queue

        Size :           1 
        Head : 7 
        Tail : 1 

run.divlat= 19

## Cycle : 33

COMMITT STAGE :

        Instruction : 0241c133 , Waiting for Values

head=001 run.head run.v_des\[run.head\] = 0 run.commit\[run.head\]=0
EXECUTION3_eac_and memory fetch STAGE :

        F2-Busy : 0

WRITE BACK STAGE :

EXECUTION1 STAGE :

        F0-Busy : 0

EXECUTION2 STAGE :

        F1-Busy : 1
        Executing : 0241c133

DECODE STAGE :

        Unvalid Opcode x

FETCH STAGE :

        PC : 1 

        Fetched : 0241c133 

        Instruction queue

        Size :           1 
        Head : 7 
        Tail : 2 

run.divlat= 20

## Cycle : 34

COMMITT STAGE :

        Instruction : 0241c133 , Waiting for Values

head=001 run.head run.v_des\[run.head\] = 0 run.commit\[run.head\]=0
EXECUTION3_eac_and memory fetch STAGE :

        F2-Busy : 0

WRITE BACK STAGE :

EXECUTION1 STAGE :

        F0-Busy : 0

EXECUTION2 STAGE :

        F1-Busy : 1
        Executing : 0241c133

DECODE STAGE :

        Unvalid Opcode x

FETCH STAGE :

        PC : 2 

        Fetched : 026280b3 

        Instruction queue

        Size :           1 
        Head : 7 
        Tail : 3 

run.divlat= 21

## Cycle : 35

COMMITT STAGE :

        Instruction : 0241c133 , Waiting for Values

head=001 run.head run.v_des\[run.head\] = 0 run.commit\[run.head\]=0
EXECUTION3_eac_and memory fetch STAGE :

        F2-Busy : 0

WRITE BACK STAGE :

EXECUTION1 STAGE :

        F0-Busy : 0

EXECUTION2 STAGE :

        F1-Busy : 1
        Executing : 0241c133

DECODE STAGE :

        Unvalid Opcode x

FETCH STAGE :

        PC : 3 

        Fetched : 008381b3 

        Instruction queue

        Size :           1 
        Head : 7 
        Tail : 4 

run.divlat= 22

## Cycle : 36

COMMITT STAGE :

        Instruction : 0241c133 , Waiting for Values

head=001 run.head run.v_des\[run.head\] = 0 run.commit\[run.head\]=0
EXECUTION3_eac_and memory fetch STAGE :

        F2-Busy : 0

WRITE BACK STAGE :

EXECUTION1 STAGE :

        F0-Busy : 0

EXECUTION2 STAGE :

        F1-Busy : 1
        Executing : 0241c133

DECODE STAGE :

        Unvalid Opcode x

FETCH STAGE :

        PC : 4 

        Fetched : 023080b3 

        Instruction queue

        Size :           1 
        Head : 7 
        Tail : 5 

run.divlat= 23

## Cycle : 37

COMMITT STAGE :

        Instruction : 0241c133 , Waiting for Values

head=001 run.head run.v_des\[run.head\] = 0 run.commit\[run.head\]=0
EXECUTION3_eac_and memory fetch STAGE :

        F2-Busy : 0

WRITE BACK STAGE :

EXECUTION1 STAGE :

        F0-Busy : 0

EXECUTION2 STAGE :

        F1-Busy : 1
        Executing : 0241c133

DECODE STAGE :

        Unvalid Opcode x

FETCH STAGE :

        PC : 5 

        Fetched : 40508233 

        Instruction queue

        Size :           1 
        Head : 7 
        Tail : 6 

run.divlat= 24

## Cycle : 38

COMMITT STAGE :

        Instruction : 0241c133 , Waiting for Values

head=001 run.head run.v_des\[run.head\] = 0 run.commit\[run.head\]=0
EXECUTION3_eac_and memory fetch STAGE :

        F2-Busy : 0

WRITE BACK STAGE :

EXECUTION1 STAGE :

        F0-Busy : 0

EXECUTION2 STAGE :

        F1-Busy : 1
        Executing : 0241c133

DECODE STAGE :

        Unvalid Opcode x

FETCH STAGE :

        PC : 6 

        Fetched : 002200b3 

        Instruction queue

        Size :           1 
        Head : 7 
        Tail : 7 

run.divlat= 25

## Cycle : 39

COMMITT STAGE :

        Instruction : 0241c133 , Waiting for Values

head=001 run.head run.v_des\[run.head\] = 0 run.commit\[run.head\]=0
EXECUTION3_eac_and memory fetch STAGE :

        F2-Busy : 0

WRITE BACK STAGE :

EXECUTION1 STAGE :

        F0-Busy : 0

EXECUTION2 STAGE :

        F1-Busy : 1
        Executing : 0241c133

DECODE STAGE :

        Unvalid Opcode x

FETCH STAGE :

        PC : 7 

        Fetched : xxxxxxxx 

        Instruction queue

        Size :           1 
        Head : 7 
        Tail : 0 

run.divlat= 26

## Cycle : 40

COMMITT STAGE :

        Instruction : 0241c133 , Waiting for Values

head=001 run.head run.v_des\[run.head\] = 0 run.commit\[run.head\]=0
EXECUTION3_eac_and memory fetch STAGE :

        F2-Busy : 0

WRITE BACK STAGE :

EXECUTION1 STAGE :

        F0-Busy : 0

EXECUTION2 STAGE :

        F1-Busy : 1
        Executing : 0241c133

DECODE STAGE :

        Unvalid Opcode x

FETCH STAGE :

        PC : 8 

        Fetched : xxxxxxxx 

        Instruction queue

        Size :           1 
        Head : 7 
        Tail : 1 

run.divlat= 27

## Cycle : 41

COMMITT STAGE :

        Instruction : 0241c133 , Waiting for Values

head=001 run.head run.v_des\[run.head\] = 0 run.commit\[run.head\]=0
EXECUTION3_eac_and memory fetch STAGE :

        F2-Busy : 0

WRITE BACK STAGE :

EXECUTION1 STAGE :

        F0-Busy : 0

EXECUTION2 STAGE :

        F1-Busy : 1
        Executing : 0241c133

DECODE STAGE :

        Unvalid Opcode x

FETCH STAGE :

        PC : 9 

        Fetched : xxxxxxxx 

        Instruction queue

        Size :           1 
        Head : 7 
        Tail : 2 

run.divlat= 28

## Cycle : 42

COMMITT STAGE :

        Instruction : 0241c133 , Waiting for Values

head=001 run.head run.v_des\[run.head\] = 0 run.commit\[run.head\]=0
EXECUTION3_eac_and memory fetch STAGE :

        F2-Busy : 0

WRITE BACK STAGE :

EXECUTION1 STAGE :

        F0-Busy : 0

EXECUTION2 STAGE :

        F1-Busy : 1
        Executing : 0241c133

DECODE STAGE :

        Unvalid Opcode x

FETCH STAGE :

        PC : a 

        Fetched : xxxxxxxx 

        Instruction queue

        Size :           1 
        Head : 7 
        Tail : 3 

run.divlat= 29

## Cycle : 43

COMMITT STAGE :

        Instruction : 0241c133 , Waiting for Values

head=001 run.head run.v_des\[run.head\] = 0 run.commit\[run.head\]=0
EXECUTION3_eac_and memory fetch STAGE :

        F2-Busy : 0

WRITE BACK STAGE :

EXECUTION1 STAGE :

        F0-Busy : 0

EXECUTION2 STAGE :

        F1-Busy : 1
        Executing : 0241c133

DECODE STAGE :

        Unvalid Opcode x

FETCH STAGE :

        PC : b 

        Fetched : xxxxxxxx 

        Instruction queue

        Size :           1 
        Head : 7 
        Tail : 4 

run.divlat= 30

## Cycle : 44

COMMITT STAGE :

        Instruction : 0241c133 , Waiting for Values

head=001 run.head run.v_des\[run.head\] = 0 run.commit\[run.head\]=0
EXECUTION3_eac_and memory fetch STAGE :

        F2-Busy : 0

WRITE BACK STAGE :

EXECUTION1 STAGE :

        F0-Busy : 0

EXECUTION2 STAGE :

        F1-Busy : 1
        Executing : 0241c133

DECODE STAGE :

        Unvalid Opcode x

FETCH STAGE :

        PC : c 

        Fetched : xxxxxxxx 

        Instruction queue

        Size :           1 
        Head : 7 
        Tail : 5 

run.divlat= 31

## Cycle : 45

COMMITT STAGE :

        Instruction : 0241c133 , Waiting for Values

head=001 run.head run.v_des\[run.head\] = 0 run.commit\[run.head\]=0
EXECUTION3_eac_and memory fetch STAGE :

        F2-Busy : 0

WRITE BACK STAGE :

EXECUTION1 STAGE :

        F0-Busy : 0

EXECUTION2 STAGE :

        F1-Busy : 1
        Executing : 0241c133

DECODE STAGE :

        Unvalid Opcode x

FETCH STAGE :

        PC : d 

        Fetched : xxxxxxxx 

        Instruction queue

        Size :           1 
        Head : 7 
        Tail : 6 

run.divlat= 32

## Cycle : 46

COMMITT STAGE :

        Instruction : 0241c133 , Waiting for Values

head=001 run.head run.v_des\[run.head\] = 0 run.commit\[run.head\]=0
EXECUTION3_eac_and memory fetch STAGE :

        F2-Busy : 0

WRITE BACK STAGE :

EXECUTION1 STAGE :

        F0-Busy : 0

EXECUTION2 STAGE :

        F1-Busy : 1
        Executing : 0241c133

DECODE STAGE :

        Unvalid Opcode x

FETCH STAGE :

        PC : e 

        Fetched : xxxxxxxx 

        Instruction queue

        Size :           1 
        Head : 7 
        Tail : 7 

run.divlat= 33

## Cycle : 47

COMMITT STAGE :

        Instruction : 0241c133 , Waiting for Values

head=001 run.head run.v_des\[run.head\] = 0 run.commit\[run.head\]=0
EXECUTION3_eac_and memory fetch STAGE :

        F2-Busy : 0

WRITE BACK STAGE :

EXECUTION1 STAGE :

        F0-Busy : 0

EXECUTION2 STAGE :

        F1-Busy : 1
        Executing : 0241c133

DECODE STAGE :

        Unvalid Opcode x

FETCH STAGE :

        PC : f 

        Fetched : xxxxxxxx 

        Instruction queue

        Size :           1 
        Head : 7 
        Tail : 0 

run.divlat= 34

## Cycle : 48

COMMITT STAGE :

        Instruction : 0241c133 , Waiting for Values

head=001 run.head run.v_des\[run.head\] = 0 run.commit\[run.head\]=0
EXECUTION3_eac_and memory fetch STAGE :

        F2-Busy : 0

WRITE BACK STAGE :

EXECUTION1 STAGE :

        F0-Busy : 0

EXECUTION2 STAGE :

        F1-Busy : 1
        Executing : 0241c133

DECODE STAGE :

        Unvalid Opcode x

FETCH STAGE :

        PC : 0 

        Fetched : 00012183 

        Instruction queue

        Size :           1 
        Head : 7 
        Tail : 1 

run.divlat= 35

## Cycle : 49

COMMITT STAGE :

        Instruction : 0241c133 , Waiting for Values

head=001 run.head run.v_des\[run.head\] = 0 run.commit\[run.head\]=0
EXECUTION3_eac_and memory fetch STAGE :

        F2-Busy : 0

WRITE BACK STAGE :

EXECUTION1 STAGE :

        F0-Busy : 0

EXECUTION2 STAGE :

        F1-Busy : 1
        Executing : 0241c133

DECODE STAGE :

        Unvalid Opcode x

FETCH STAGE :

        PC : 1 

        Fetched : 0241c133 

        Instruction queue

        Size :           1 
        Head : 7 
        Tail : 2 

run.divlat= 36

## Cycle : 50

COMMITT STAGE :

        Instruction : 0241c133 , Waiting for Values

head=001 run.head run.v_des\[run.head\] = 0 run.commit\[run.head\]=0
EXECUTION3_eac_and memory fetch STAGE :

        F2-Busy : 0

WRITE BACK STAGE :

EXECUTION1 STAGE :

        F0-Busy : 0

EXECUTION2 STAGE :

        F1-Busy : 1
        Executing : 0241c133

DECODE STAGE :

        Unvalid Opcode x

FETCH STAGE :

        PC : 2 

        Fetched : 026280b3 

        Instruction queue

        Size :           1 
        Head : 7 
        Tail : 3 

run.divlat= 37

## Cycle : 51

COMMITT STAGE :

        Instruction : 0241c133 , Waiting for Values

head=001 run.head run.v_des\[run.head\] = 0 run.commit\[run.head\]=0
EXECUTION3_eac_and memory fetch STAGE :

        F2-Busy : 0

WRITE BACK STAGE :

EXECUTION1 STAGE :

        F0-Busy : 0

EXECUTION2 STAGE :

        F1-Busy : 1
        Executing : 0241c133

DECODE STAGE :

        Unvalid Opcode x

FETCH STAGE :

        PC : 3 

        Fetched : 008381b3 

        Instruction queue

        Size :           1 
        Head : 7 
        Tail : 4 

run.divlat= 38

## Cycle : 52

COMMITT STAGE :

        Instruction : 0241c133 , Waiting for Values

head=001 run.head run.v_des\[run.head\] = 0 run.commit\[run.head\]=0
EXECUTION3_eac_and memory fetch STAGE :

        F2-Busy : 0

WRITE BACK STAGE :

EXECUTION1 STAGE :

        F0-Busy : 0

EXECUTION2 STAGE :

        F1-Busy : 1
        Executing : 0241c133

DECODE STAGE :

        Unvalid Opcode x

FETCH STAGE :

        PC : 4 

        Fetched : 023080b3 

        Instruction queue

        Size :           1 
        Head : 7 
        Tail : 5 

run.divlat= 39

## Cycle : 53

COMMITT STAGE :

        Instruction : 0241c133 , Waiting for Values

head=001 run.head run.v_des\[run.head\] = 0 run.commit\[run.head\]=0
EXECUTION3_eac_and memory fetch STAGE :

        F2-Busy : 0

WRITE BACK STAGE :

EXECUTION1 STAGE :

        F0-Busy : 0

EXECUTION2 STAGE :

        F1-Busy : 1
        Executing : 0241c133

DECODE STAGE :

        Unvalid Opcode x

FETCH STAGE :

        PC : 5 

        Fetched : 40508233 

        Instruction queue

        Size :           1 
        Head : 7 
        Tail : 6 

run.divlat= 40 Instruction : 0241c133 , Execution Complete Functional
Unit: F1 Result : 00000000

## Cycle : 54

COMMITT STAGE :

        Instruction : 0241c133 , Waiting for Values

head=001 run.head run.v_des\[run.head\] = 0 run.commit\[run.head\]=0
EXECUTION3_eac_and memory fetch STAGE :

        F2-Busy : 0

WRITE BACK STAGE :

        Instruction : 0241c133 , Written Back

        ROB

        1.Index : 001 tail: 001 
        2.Rd : 02
        3.Value : 00000000
        4.Ready to Retire : 1      4*.Ready to Retire : 1
        5.Committed : 0

        Updates

EXECUTION1 STAGE :

        F0-Busy : 0

EXECUTION2 STAGE :

        Reservation Station 1

        Index : 00000001
        Free : 1

        Intruction : 023080b3 , Executing starts
        Functional Unit : F1
        Multiplying : 0000000c * 00000003

        F1-Busy : 1
        Executing : 023080b3

DECODE STAGE :

        Unvalid Opcode x

FETCH STAGE :

        PC : 6 

        Fetched : 002200b3 

        Instruction queue

        Size :           1 
        Head : 7 
        Tail : 7 

        RS : 1
        Index :           1
        Rs2 : 00000000

run.multlat= 1

## Cycle : 55

COMMITT STAGE :

        Instruction : 0241c133 , Committed

         Register File
         R[1] : 00000000

         ROB

         1.Head : 2
         2.Committed : 0
         3.Size : 00000005

EXECUTION3_eac_and memory fetch STAGE :

        F2-Busy : 0

WRITE BACK STAGE :

EXECUTION1 STAGE :

        F0-Busy : 0

EXECUTION2 STAGE :

        F1-Busy : 1
        Executing : 023080b3

DECODE STAGE :

        Unvalid Opcode x

FETCH STAGE :

        PC : 7 

        Fetched : xxxxxxxx 

        Instruction queue

        Size :           1 
        Head : 7 
        Tail : 0 

run.multlat= 2

## Cycle : 56

COMMITT STAGE :

        Instruction : 026280b3 , Committed

         ROB

         1.Head : 3
         2.Committed : 0
         3.Size : 00000004

EXECUTION3_eac_and memory fetch STAGE :

        F2-Busy : 0

WRITE BACK STAGE :

EXECUTION1 STAGE :

        F0-Busy : 0

EXECUTION2 STAGE :

        F1-Busy : 1
        Executing : 023080b3

DECODE STAGE :

        Unvalid Opcode x

FETCH STAGE :

        PC : 8 

        Fetched : xxxxxxxx 

        Instruction queue

        Size :           1 
        Head : 7 
        Tail : 1 

run.multlat= 3

## Cycle : 57

COMMITT STAGE :

        Instruction : 008381b3 , Committed

         Register File
         R[3] : 00000003

         ROB

         1.Head : 4
         2.Committed : 0
         3.Size : 00000003

EXECUTION3_eac_and memory fetch STAGE :

        F2-Busy : 0

WRITE BACK STAGE :

EXECUTION1 STAGE :

        F0-Busy : 0

EXECUTION2 STAGE :

        F1-Busy : 1
        Executing : 023080b3

DECODE STAGE :

        Unvalid Opcode x

FETCH STAGE :

        PC : 9 

        Fetched : xxxxxxxx 

        Instruction queue

        Size :           1 
        Head : 7 
        Tail : 2 

run.multlat= 4

## Cycle : 58

COMMITT STAGE :

        Instruction : 023080b3 , Waiting for Values

head=100 run.head run.v_des\[run.head\] = 0 run.commit\[run.head\]=0
EXECUTION3_eac_and memory fetch STAGE :

        F2-Busy : 0

WRITE BACK STAGE :

EXECUTION1 STAGE :

        F0-Busy : 0

EXECUTION2 STAGE :

        F1-Busy : 1
        Executing : 023080b3

DECODE STAGE :

        Unvalid Opcode x

FETCH STAGE :

        PC : a 

        Fetched : xxxxxxxx 

        Instruction queue

        Size :           1 
        Head : 7 
        Tail : 3 

run.multlat= 5

## Cycle : 59

COMMITT STAGE :

        Instruction : 023080b3 , Waiting for Values

head=100 run.head run.v_des\[run.head\] = 0 run.commit\[run.head\]=0
EXECUTION3_eac_and memory fetch STAGE :

        F2-Busy : 0

WRITE BACK STAGE :

EXECUTION1 STAGE :

        F0-Busy : 0

EXECUTION2 STAGE :

        F1-Busy : 1
        Executing : 023080b3

DECODE STAGE :

        Unvalid Opcode x

FETCH STAGE :

        PC : b 

        Fetched : xxxxxxxx 

        Instruction queue

        Size :           1 
        Head : 7 
        Tail : 4 

run.multlat= 6

## Cycle : 60

COMMITT STAGE :

        Instruction : 023080b3 , Waiting for Values

head=100 run.head run.v_des\[run.head\] = 0 run.commit\[run.head\]=0
EXECUTION3_eac_and memory fetch STAGE :

        F2-Busy : 0

WRITE BACK STAGE :

EXECUTION1 STAGE :

        F0-Busy : 0

EXECUTION2 STAGE :

        F1-Busy : 1
        Executing : 023080b3

DECODE STAGE :

        Unvalid Opcode x

FETCH STAGE :

        PC : c 

        Fetched : xxxxxxxx 

        Instruction queue

        Size :           1 
        Head : 7 
        Tail : 5 

run.multlat= 7

## Cycle : 61

COMMITT STAGE :

        Instruction : 023080b3 , Waiting for Values

head=100 run.head run.v_des\[run.head\] = 0 run.commit\[run.head\]=0
EXECUTION3_eac_and memory fetch STAGE :

        F2-Busy : 0

WRITE BACK STAGE :

EXECUTION1 STAGE :

        F0-Busy : 0

EXECUTION2 STAGE :

        F1-Busy : 1
        Executing : 023080b3

DECODE STAGE :

        Unvalid Opcode x

FETCH STAGE :

        PC : d 

        Fetched : xxxxxxxx 

        Instruction queue

        Size :           1 
        Head : 7 
        Tail : 6 

run.multlat= 8

## Cycle : 62

COMMITT STAGE :

        Instruction : 023080b3 , Waiting for Values

head=100 run.head run.v_des\[run.head\] = 0 run.commit\[run.head\]=0
EXECUTION3_eac_and memory fetch STAGE :

        F2-Busy : 0

WRITE BACK STAGE :

EXECUTION1 STAGE :

        F0-Busy : 0

EXECUTION2 STAGE :

        F1-Busy : 1
        Executing : 023080b3

DECODE STAGE :

        Unvalid Opcode x

FETCH STAGE :

        PC : e 

        Fetched : xxxxxxxx 

        Instruction queue

        Size :           1 
        Head : 7 
        Tail : 7 

run.multlat= 9

## Cycle : 63

COMMITT STAGE :

        Instruction : 023080b3 , Waiting for Values

head=100 run.head run.v_des\[run.head\] = 0 run.commit\[run.head\]=0
EXECUTION3_eac_and memory fetch STAGE :

        F2-Busy : 0

WRITE BACK STAGE :

EXECUTION1 STAGE :

        F0-Busy : 0

EXECUTION2 STAGE :

        F1-Busy : 1
        Executing : 023080b3

DECODE STAGE :

        Unvalid Opcode x

FETCH STAGE :

        PC : f 

        Fetched : xxxxxxxx 

        Instruction queue

        Size :           1 
        Head : 7 
        Tail : 0 

        Instruction : 023080b3 , Execution Complete
        Functional Unit: F1
        Result : 00000024 

## Cycle : 64

COMMITT STAGE :

        Instruction : 023080b3 , Waiting for Values

head=100 run.head run.v_des\[run.head\] = 0 run.commit\[run.head\]=0
EXECUTION3_eac_and memory fetch STAGE :

        F2-Busy : 0

WRITE BACK STAGE :

        Instruction : 023080b3 , Written Back

        ROB

        1.Index : 100 tail: 100 
        2.Rd : 01
        3.Value : 00000024
        4.Ready to Retire : 1      4*.Ready to Retire : 1
        5.Committed : 0

        Updates

EXECUTION1 STAGE :

        F0-Busy : 0

EXECUTION2 STAGE :

        F1-Busy : 0

DECODE STAGE :

        Unvalid Opcode x

FETCH STAGE :

        PC : 0 

        Fetched : 00012183 

        Instruction queue

        Size :           1 
        Head : 7 
        Tail : 1 

        RS : 1
        Index :           0
        Rs1 : 00000024

        RS : 1
        Index :           0
        Ready : 1

## Cycle : 65

COMMITT STAGE :

        Instruction : 023080b3 , Committed

         ROB

         1.Head : 5
         2.Committed : 0
         3.Size : 00000002

EXECUTION3_eac_and memory fetch STAGE :

        F2-Busy : 0

WRITE BACK STAGE :

EXECUTION1 STAGE :

        Reservation Station 1

        Index : 00000000
        Free : 1

        Intruction : 40508233 , Executing starts
        Functional Unit : F0
        subtraction : 00000024  -  00000003

        F0-Busy : 1
        Executing : 40508233

EXECUTION2 STAGE :

        F1-Busy : 0

DECODE STAGE :

        Unvalid Opcode x

FETCH STAGE :

        PC : 1 

        Fetched : 0241c133 

        Instruction queue

        Size :           1 
        Head : 7 
        Tail : 2 

## Cycle : 66

COMMITT STAGE :

        Instruction : 40508233 , Waiting for Values

head=101 run.head run.v_des\[run.head\] = 0 run.commit\[run.head\]=0
EXECUTION3_eac_and memory fetch STAGE :

        F2-Busy : 0

WRITE BACK STAGE :

EXECUTION1 STAGE :

        F0-Busy : 1
        Executing : 40508233

EXECUTION2 STAGE :

        F1-Busy : 0

DECODE STAGE :

        Unvalid Opcode x

FETCH STAGE :

        PC : 2 

        Fetched : 026280b3 

        Instruction queue

        Size :           1 
        Head : 7 
        Tail : 3 

        Instruction : 40508233 , Execution Complete

        Functional Unit: F0
        Result : 00000021 

## Cycle : 67

COMMITT STAGE :

        Instruction : 40508233 , Waiting for Values

head=101 run.head run.v_des\[run.head\] = 0 run.commit\[run.head\]=0
EXECUTION3_eac_and memory fetch STAGE :

        F2-Busy : 0

WRITE BACK STAGE :

        Instruction : 40508233 , Written Back

        ROB

        1.Index : 5
        2.Rd : 04
        3.Value : 00000021
        4.Ready to Retire : 1
        5.Committed : 0

         Updates

EXECUTION1 STAGE :

        F0-Busy : 0

EXECUTION2 STAGE :

        F1-Busy : 0

DECODE STAGE :

        Unvalid Opcode x

FETCH STAGE :

        PC : 3 

        Fetched : 008381b3 

        Instruction queue

        Size :           1 
        Head : 7 
        Tail : 4 

        RS : 1
        Index :           1
        Rs1 : 00000021

        RS : 1
        Index :           1
        Ready : 1

## Cycle : 68

COMMITT STAGE :

        Instruction : 40508233 , Committed

         Register File
         R[5] : 00000021

         ROB

         1.Head : 6
         2.Committed : 0
         3.Size : 00000001

EXECUTION3_eac_and memory fetch STAGE :

        F2-Busy : 0

WRITE BACK STAGE :

EXECUTION1 STAGE :

        Reservation Station 1

        Index : 00000001
        Free : 1

         Intruction : 002200b3 , Executing starts
         Functional Unit : F0
         adding : 00000021 + 00000000

        F0-Busy : 1
        Executing : 002200b3

EXECUTION2 STAGE :

        F1-Busy : 0

DECODE STAGE :

        Unvalid Opcode x

FETCH STAGE :

        PC : 4 

        Fetched : 023080b3 

        Instruction queue

        Size :           1 
        Head : 7 
        Tail : 5 

## Cycle : 69

COMMITT STAGE :

        Instruction : 002200b3 , Waiting for Values

head=110 run.head run.v_des\[run.head\] = 0 run.commit\[run.head\]=0
EXECUTION3_eac_and memory fetch STAGE :

        F2-Busy : 0

WRITE BACK STAGE :

EXECUTION1 STAGE :

        F0-Busy : 1
        Executing : 002200b3

EXECUTION2 STAGE :

        F1-Busy : 0

DECODE STAGE :

        Unvalid Opcode x

FETCH STAGE :

        PC : 5 

        Fetched : 40508233 

        Instruction queue

        Size :           1 
        Head : 7 
        Tail : 6 

        Instruction : 002200b3 , Execution Complete

        Functional Unit: F0
        Result : 00000021 

## Cycle : 70

COMMITT STAGE :

        Instruction : 002200b3 , Waiting for Values

head=110 run.head run.v_des\[run.head\] = 0 run.commit\[run.head\]=0
EXECUTION3_eac_and memory fetch STAGE :

        F2-Busy : 0

WRITE BACK STAGE :

        Instruction : 002200b3 , Written Back

        ROB

        1.Index : 6
        2.Rd : 01
        3.Value : 00000021
        4.Ready to Retire : 1
        5.Committed : 0

         Updates

EXECUTION1 STAGE :

        F0-Busy : 0

EXECUTION2 STAGE :

        F1-Busy : 0

DECODE STAGE :

        Unvalid Opcode x

FETCH STAGE :

        PC : 6 

        Fetched : 002200b3 

        Instruction queue

        Size :           1 
        Head : 7 
        Tail : 7 

## Cycle : 71

COMMITT STAGE :

        Instruction : 002200b3 , Committed

         Register File
         R[6] : 00000021

         ROB

         1.Head : 7
         2.Committed : 0
         3.Size : 00000000

EXECUTION3_eac_and memory fetch STAGE :

        F2-Busy : 0

WRITE BACK STAGE :

EXECUTION1 STAGE :

        F0-Busy : 0

EXECUTION2 STAGE :

        F1-Busy : 0

DECODE STAGE :

        Unvalid Opcode x

FETCH STAGE :

        PC : 7 

        Fetched : xxxxxxxx 

        Instruction queue

        Size :           1 
        Head : 7 
        Tail : 0 

## Cycle : 72

COMMITT STAGE :

        Rob : Empty

EXECUTION3_eac_and memory fetch STAGE :

        F2-Busy : 0

WRITE BACK STAGE :

EXECUTION1 STAGE :

        F0-Busy : 0

EXECUTION2 STAGE :

        F1-Busy : 0

DECODE STAGE :

        Unvalid Opcode x

FETCH STAGE :

        PC : 8 

        Fetched : xxxxxxxx 

        Instruction queue

        Size :           1 
        Head : 7 
        Tail : 1 

## Cycle : 73

COMMITT STAGE :

        Rob : Empty

EXECUTION3_eac_and memory fetch STAGE :

        F2-Busy : 0

WRITE BACK STAGE :

EXECUTION1 STAGE :

        F0-Busy : 0

EXECUTION2 STAGE :

        F1-Busy : 0

DECODE STAGE :

        Unvalid Opcode x

FETCH STAGE :

        PC : 9 

        Fetched : xxxxxxxx 

        Instruction queue

        Size :           1 
        Head : 7 
        Tail : 2 

## Cycle : 74

COMMITT STAGE :

        Rob : Empty

EXECUTION3_eac_and memory fetch STAGE :

        F2-Busy : 0

WRITE BACK STAGE :

EXECUTION1 STAGE :

        F0-Busy : 0

EXECUTION2 STAGE :

        F1-Busy : 0

DECODE STAGE :

        Unvalid Opcode x

\$finish called at time : 1500 ns : File
