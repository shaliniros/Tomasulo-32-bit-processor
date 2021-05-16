> Implemented a OOO processor Tomasulo algorithm with an 8-entry
> re-order buffer. The number of reservation stations is shown below.
> Contents of the architectural register file (ARF) are shown. We have
> one execution unit for Add, one for MUL/Div (not pipelined)

1.  Issue and Write take one cycle each. So, if data is written to CDB
    > in clock cycle ‘a’, the data is read from the reservation station
    > or register in the next clock cycle ‘a+1’

2.  Similarly, if execution completes in cycle ‘a’, it is written to CDB
    > in cycle ‘a+1’

3.  Latency: Add : 1 cycle. Mult: 10 cycles. Divide: 40 cycles, Load: 5
    > cycles

> Implement a single-issue RISC-V processor which reads in the
> instructions shown in the table and runs the instructions out of
> order. Follow the RISC-V instruction encodings as in the RISC-V
> Specification. The MUL and DIV are part of the ‘M’ extensions of
> RISC-V. The number of stages in the pipeline as per the
> Tomasulo algorithm (4 stages) pipeline. 				
	 				
	
>
> The Tomasulo structure with RoB is shown below (CDB is an important
> component of the design). RAT also needs to be a part of the design.
>
> **Three Reservation station (Add/Sub)**

<table>
<thead>
<tr class="header">
<th><blockquote>
<p>Instruction</p>
</blockquote></th>
<th><blockquote>
<p>Busy</p>
</blockquote></th>
<th><blockquote>
<p>Destination tag</p>
</blockquote></th>
<th><blockquote>
<p>Source tag1</p>
</blockquote></th>
<th><blockquote>
<p>Source tag2</p>
</blockquote></th>
<th><blockquote>
<p>Value of source 1</p>
</blockquote></th>
<th><blockquote>
<p>Value of source 2</p>
</blockquote></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>ADD</td>
<td>1</td>
<td>ROB3</td>
<td></td>
<td></td>
<td>1--R7</td>
<td>2--R8 ISSUED IN 5</td>
</tr>
<tr class="even">
<td>SUB</td>
<td>1</td>
<td>ROB5</td>
<td></td>
<td></td>
<td>36</td>
<td>R5--3</td>
</tr>
<tr class="odd">
<td>ADD</td>
<td>1</td>
<td>ROB6</td>
<td></td>
<td></td>
<td>33</td>
<td>0</td>
</tr>
</tbody>
</table>

> **Two Reservation stations (Multiplier/Divide)**

<table>
<thead>
<tr class="header">
<th><blockquote>
<p>Instruction</p>
</blockquote></th>
<th><blockquote>
<p>Busy</p>
</blockquote></th>
<th><blockquote>
<p>Destination tag</p>
</blockquote></th>
<th><blockquote>
<p>Source tag1</p>
</blockquote></th>
<th><blockquote>
<p>Source tag2</p>
</blockquote></th>
<th><blockquote>
<p>Value of source 1</p>
</blockquote></th>
<th><blockquote>
<p>Value of source 2</p>
</blockquote></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>DIV</td>
<td>1</td>
<td>ROB3</td>
<td></td>
<td></td>
<td>2</td>
<td>R4--5</td>
</tr>
<tr class="even">
<td>MUL</td>
<td>1</td>
<td>ROB4</td>
<td></td>
<td></td>
<td>12</td>
<td>3</td>
</tr>
</tbody>
</table>

> **Three Load/Store buffers**

<table>
<thead>
<tr class="header">
<th><blockquote>
<p>Instruction</p>
</blockquote></th>
<th><blockquote>
<p>Busy</p>
</blockquote></th>
<th><blockquote>
<p>Destination tag</p>
</blockquote></th>
<th><blockquote>
<p>Address offset</p>
</blockquote></th>
<th><blockquote>
<p>Source register</p>
</blockquote></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>LW</td>
<td>1</td>
<td>ROB0</td>
<td>0</td>
<td>R2--16 ISSUED TO EX IN CYCLE 2</td>
</tr>
<tr class="even">
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
</tr>
<tr class="odd">
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
</tr>
</tbody>
</table>

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

<table>
<thead>
<tr class="header">
<th></th>
<th><blockquote>
<p>IF</p>
</blockquote></th>
<th><blockquote>
<p>ID-</p>
</blockquote>
<p>DECODING AND SENDING TO RS</p></th>
<th><blockquote>
<p>Execute start/Addres s calculation for LD</p>
</blockquote></th>
<th><blockquote>
<p>Execute/ Memory access complete</p>
</blockquote></th>
<th><blockquote>
<p>Write to CDB</p>
</blockquote></th>
<th><blockquote>
<p>Commit</p>
</blockquote></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><blockquote>
<p>LW R3, 0(R2)</p>
</blockquote></td>
<td>0</td>
<td>1</td>
<td>2</td>
<td>6</td>
<td>7</td>
<td>8</td>
</tr>
<tr class="even">
<td><blockquote>
<p>DIV R2, R3, R4</p>
</blockquote></td>
<td>1</td>
<td>2</td>
<td>14</td>
<td>53</td>
<td>54</td>
<td>55</td>
</tr>
<tr class="odd">
<td><blockquote>
<p>MUL R1, R5, R6</p>
</blockquote></td>
<td>2</td>
<td>3</td>
<td>4</td>
<td>13</td>
<td>14</td>
<td>56</td>
</tr>
<tr class="even">
<td><blockquote>
<p>ADD R3, R7, R8</p>
</blockquote></td>
<td>3</td>
<td>4</td>
<td>5</td>
<td>6</td>
<td>7</td>
<td>57</td>
</tr>
<tr class="odd">
<td><blockquote>
<p>MUL R1, R1, R3</p>
</blockquote></td>
<td>4</td>
<td>5</td>
<td>54</td>
<td>63</td>
<td>64</td>
<td>65</td>
</tr>
<tr class="even">
<td><blockquote>
<p>SUB R4, R1, R5</p>
</blockquote></td>
<td>5</td>
<td>6</td>
<td>65</td>
<td>66</td>
<td>67</td>
<td>68</td>
</tr>
<tr class="odd">
<td><blockquote>
<p>ADD R1, R4, R2</p>
</blockquote></td>
<td>6</td>
<td>7</td>
<td>68</td>
<td>69</td>
<td>70</td>
<td>71</td>
</tr>
</tbody>
</table>

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

<table>
<thead>
<tr class="header">
<th></th>
<th><blockquote>
<p>Instruction type</p>
</blockquote></th>
<th><blockquote>
<p>Destination</p>
</blockquote></th>
<th><blockquote>
<p>Value</p>
</blockquote></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><blockquote>
<p>RoB0</p>
</blockquote></td>
<td>LW</td>
<td>R3</td>
<td>2 COMITTED IN 8</td>
</tr>
<tr class="even">
<td><blockquote>
<p>RoB1</p>
</blockquote></td>
<td>DIV</td>
<td>R2</td>
<td>0 COMMITTED IN 55</td>
</tr>
<tr class="odd">
<td><blockquote>
<p>RoB2</p>
</blockquote></td>
<td>MUL</td>
<td>R1</td>
<td>12 COMMITTED IN 56</td>
</tr>
<tr class="even">
<td><blockquote>
<p>RoB3</p>
</blockquote></td>
<td>ADD</td>
<td>R3</td>
<td>3 COMMITTED IN 57</td>
</tr>
<tr class="odd">
<td><blockquote>
<p>RoB4</p>
</blockquote></td>
<td>MUL</td>
<td>R1</td>
<td>36 COMMITTED IN 65</td>
</tr>
<tr class="even">
<td><blockquote>
<p>RoB5</p>
</blockquote></td>
<td>SUB</td>
<td>R4</td>
<td>33 COMMITTED IN 68</td>
</tr>
<tr class="odd">
<td><blockquote>
<p>RoB6</p>
</blockquote></td>
<td>ADD</td>
<td>R1</td>
<td>33 COMMITTED IN 71</td>
</tr>
<tr class="even">
<td><blockquote>
<p>RoB7</p>
</blockquote></td>
<td></td>
<td></td>
<td></td>
</tr>
</tbody>
</table>

<img src="media/image1.png" style="width:4.61915in;height:5.51906in" />

> CA QA, H&P Ch 3.6
