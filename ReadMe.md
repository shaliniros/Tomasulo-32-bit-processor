> Implemented a OOO processor Tomasulo algorithm with an 8-entry
> re-order buffer. The number of reservation stations is shown below.
> Contents of the architectural register file (ARF) are shown. We have
> one execution unit for Add, one for MUL/Div (not pipelined)

1.  Issue and Write take one cycle each. So, if data is written to CDB
    > in clock cycle 'a', the data is read from the reservation station
    > or register in the next clock cycle 'a+1'

2.  Similarly, if execution completes in cycle 'a', it is written to CDB
    > in cycle 'a+1'

3.  Latency: Add : 1 cycle. Mult: 10 cycles. Divide: 40 cycles, Load: 5
    > cycles

> Implement a single-issue RISC-V processor which reads in the
> instructions shown in the table and runs the instructions out of
> order. Follow the RISC-V instruction encodings as in the RISC-V
> Specification. The MUL and DIV are part of the 'M' extensions of
> RISC-V. You can choose the number of stages in the pipeline as per the
> Tomasulo algorithm (4 stages) or you can implement a 7-stage pipeline.
>
> The Tomasulo structure with RoB is shown below (CDB is an important
> component of the design). RAT also needs to be a part of the design.
>
> **Three Reservation station (Add/Sub)**

+---------+--------+---------+---------+---------+---------+---------+
| > Inst  | > Busy | > Dest  | >       | >       | > Value | > Value |
| ruction |        | ination |  Source |  Source | > of    | > of    |
|         |        | > tag   | > tag1  | > tag2  | >       | >       |
|         |        |         |         |         |  source |  source |
|         |        |         |         |         | > 1     | > 2     |
+=========+========+=========+=========+=========+=========+=========+
| ADD     | 1      | ROB3    |         |         | 1\--R7  | 2\--R8  |
|         |        |         |         |         |         | ISSUED  |
|         |        |         |         |         |         | IN 5    |
+---------+--------+---------+---------+---------+---------+---------+
| SUB     | 1      | ROB5    |         |         | 36      | R5\--3  |
+---------+--------+---------+---------+---------+---------+---------+
| ADD     | 1      | ROB6    |         |         | 33      | 0       |
+---------+--------+---------+---------+---------+---------+---------+

> **Two Reservation stations (Multiplier/Divide)**

+---------+--------+---------+---------+---------+---------+---------+
| > Inst  | > Busy | > Dest  | >       | >       | > Value | > Value |
| ruction |        | ination |  Source |  Source | > of    | > of    |
|         |        | > tag   | > tag1  | > tag2  | >       | >       |
|         |        |         |         |         |  source |  source |
|         |        |         |         |         | > 1     | > 2     |
+=========+========+=========+=========+=========+=========+=========+
| DIV     | 1      | ROB3    |         |         | 2       | R4\--5  |
+---------+--------+---------+---------+---------+---------+---------+
| MUL     | 1      | ROB4    |         |         | 12      | 3       |
+---------+--------+---------+---------+---------+---------+---------+

> **Three Load/Store buffers**

+--------------+--------+--------------+--------------+--------------+
| >            | > Busy | >            | > Address    | > Source     |
|  Instruction |        |  Destination | > offset     | > register   |
|              |        | > tag        |              |              |
+==============+========+==============+==============+==============+
| LW           | 1      | ROB0         | 0            | R2\--16      |
|              |        |              |              | ISSUED TO EX |
|              |        |              |              | IN CYCLE 2   |
+--------------+--------+--------------+--------------+--------------+
|              |        |              |              |              |
+--------------+--------+--------------+--------------+--------------+
|              |        |              |              |              |
+--------------+--------+--------------+--------------+--------------+

> **Architectural Register file (ARF)**

<table>
<thead>
<tr class="header">
<th><blockquote>
<p>R1</p>
</blockquote></th>
<th><blockquote>
<p>R2</p>
</blockquote></th>
<th><blockquote>
<p>R3</p>
</blockquote></th>
<th><blockquote>
<p>R4</p>
</blockquote></th>
<th><blockquote>
<p>R5</p>
</blockquote></th>
<th><blockquote>
<p>R6</p>
</blockquote></th>
<th><blockquote>
<p>R7</p>
</blockquote></th>
<th><blockquote>
<p>R8</p>
</blockquote></th>
<th><blockquote>
<p>R9</p>
</blockquote></th>
<th><blockquote>
<p>R10</p>
</blockquote></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><blockquote>
<p>33</p>
</blockquote></td>
<td><blockquote>
<p>0</p>
</blockquote></td>
<td><blockquote>
<p>3</p>
</blockquote></td>
<td><blockquote>
<p>33</p>
</blockquote></td>
<td><blockquote>
<p>3</p>
</blockquote></td>
<td><blockquote>
<p>4</p>
</blockquote></td>
<td><blockquote>
<p>1</p>
</blockquote></td>
<td><blockquote>
<p>2</p>
</blockquote></td>
<td><blockquote>
<p>2</p>
</blockquote></td>
<td><blockquote>
<p>3</p>
</blockquote></td>
</tr>
</tbody>
</table>

> **Instructions**

+---------+------+---------+---------+---------+---------+---------+
|         | > IF | > ID-   | >       | > E     | > Write | >       |
|         |      |         | Execute | xecute/ | > to    |  Commit |
|         |      | D       | > start | >       | > CDB   |         |
|         |      | ECODING | /Addres |  Memory |         |         |
|         |      | AND     | > s     | >       |         |         |
|         |      | SENDING | > calc  |  access |         |         |
|         |      | TO RS   | ulation | > c     |         |         |
|         |      |         | > for   | omplete |         |         |
|         |      |         | > LD    |         |         |         |
+=========+======+=========+=========+=========+=========+=========+
| > LW    | 0    | 1       | 2       | 6       | 7       | 8       |
| > R3,   |      |         |         |         |         |         |
| > 0(R2) |      |         |         |         |         |         |
+---------+------+---------+---------+---------+---------+---------+
| > DIV   | 1    | 2       | 14      | 53      | 54      | 55      |
| > R2,   |      |         |         |         |         |         |
| > R3,   |      |         |         |         |         |         |
| > R4    |      |         |         |         |         |         |
+---------+------+---------+---------+---------+---------+---------+
| > MUL   | 2    | 3       | 4       | 13      | 14      | 56      |
| > R1,   |      |         |         |         |         |         |
| > R5,   |      |         |         |         |         |         |
| > R6    |      |         |         |         |         |         |
+---------+------+---------+---------+---------+---------+---------+
| > ADD   | 3    | 4       | 5       | 6       | 7       | 57      |
| > R3,   |      |         |         |         |         |         |
| > R7,   |      |         |         |         |         |         |
| > R8    |      |         |         |         |         |         |
+---------+------+---------+---------+---------+---------+---------+
| > MUL   | 4    | 5       | 54      | 63      | 64      | 65      |
| > R1,   |      |         |         |         |         |         |
| > R1,   |      |         |         |         |         |         |
| > R3    |      |         |         |         |         |         |
+---------+------+---------+---------+---------+---------+---------+
| > SUB   | 5    | 6       | 65      | 66      | 67      | 68      |
| > R4,   |      |         |         |         |         |         |
| > R1,   |      |         |         |         |         |         |
| > R5    |      |         |         |         |         |         |
+---------+------+---------+---------+---------+---------+---------+
| > ADD   | 6    | 7       | 68      | 69      | 70      | 71      |
| > R1,   |      |         |         |         |         |         |
| > R4,   |      |         |         |         |         |         |
| > R2    |      |         |         |         |         |         |
+---------+------+---------+---------+---------+---------+---------+

> **Register allocation table (RAT)**

<table>
<thead>
<tr class="header">
<th><blockquote>
<p>R1</p>
</blockquote></th>
<th><blockquote>
<p>R2</p>
</blockquote></th>
<th><blockquote>
<p>R3</p>
</blockquote></th>
<th><blockquote>
<p>R4</p>
</blockquote></th>
<th><blockquote>
<p>R5</p>
</blockquote></th>
<th><blockquote>
<p>R6</p>
</blockquote></th>
<th><blockquote>
<p>R7</p>
</blockquote></th>
<th><blockquote>
<p>R8</p>
</blockquote></th>
<th><blockquote>
<p>R9</p>
</blockquote></th>
<th><blockquote>
<p>R10</p>
</blockquote></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>ROB2--ROB4--ROB5</td>
<td>ROB1</td>
<td>ROB0--ROB3</td>
<td>ROB5</td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
</tr>
</tbody>
</table>

> **ROB**

+--------+--------------------+---------------+--------------------+
|        | > Instruction type | > Destination | > Value            |
+========+====================+===============+====================+
| > RoB0 | LW                 | R3            | 2 COMITTED IN 8    |
+--------+--------------------+---------------+--------------------+
| > RoB1 | DIV                | R2            | 0 COMMITTED IN 55  |
+--------+--------------------+---------------+--------------------+
| > RoB2 | MUL                | R1            | 12 COMMITTED IN 56 |
+--------+--------------------+---------------+--------------------+
| > RoB3 | ADD                | R3            | 3 COMMITTED IN 57  |
+--------+--------------------+---------------+--------------------+
| > RoB4 | MUL                | R1            | 36 COMMITTED IN 65 |
+--------+--------------------+---------------+--------------------+
| > RoB5 | SUB                | R4            | 33 COMMITTED IN 68 |
+--------+--------------------+---------------+--------------------+
| > RoB6 | ADD                | R1            | 33 COMMITTED IN 71 |
+--------+--------------------+---------------+--------------------+
| > RoB7 |                    |               |                    |
+--------+--------------------+---------------+--------------------+

![](media/image1.png){width="4.619145888013998in"
height="5.519061679790026in"}

> CA QA, H&P Ch 3.6
