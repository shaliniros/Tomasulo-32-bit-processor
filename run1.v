
module run;

//Initializing memory
reg [31:0]instruction_memory[0:7];//
reg [31:0] data_memory[0:63];

//Initializing register File
//register_file[0]=R0 and so on--------
reg [31:0]reg_file[0:31];// we have 32 register each 4 byte in size;
reg reg_valid[0:31];
reg [2:0]reg_rename[0:31];  // renaming corresponding to ROB // this is poiner to ROB



//Instruction Queue
reg [31:0]instruction_queue[0:7];
reg iq_f;// if instruction_queue_full = 1 else 0;
integer instruction_queue_no_of_enteries ;
//reg [1:0]instruction_queue_tail;// this points to the next empty location in instruction_queue
//reg [1:0]instruction_queue_head;// this points to first address which is ready for decoding;
reg [2:0]instruction_queue_tail;// this points to the next empty location in instruction_queue
reg [2:0]instruction_queue_head;// this points to first address which is ready for decoding;


// ROB
  //(opcode des_name value v_des commit)
  // ROB size is = 8
reg [6:0]rob_opcode_feild[0:7];//ROB isntruction feild
reg [4:0]rob_dest_reg_feild[0:7];// ROB destination register feild
reg [31:0]rob_dest_reg_value[0:7];//destination register value
reg v_des[0:7];// 0 = unvalid ,1 = valid ; Ready to retire once it = 1
reg commit[0:7];// indicates whether the particular entry has committed or not.
reg [2:0]head;// ROB head
reg [2:0]tail;// ROB tail// this points to first empty location
reg rob_full; // this is 1 when ROB is full and 0 when it has space;
reg [31:0]rob_instruction_feild[0:7];
integer rob_no_of_enteries;
reg [2:0] rob_index1;
reg [2:0] rob_index2;
reg [2:0] rob_index3;


// Reservation station for add and sub = res1
       // Size of res = 3 instruction;
integer res1_no_of_enteries;
reg [31:0] res1_instructions[0:2];
reg res1_free_entry[0:2];// gives us the list of free enteries; 1 = free ,0 = busy
reg [6:0]res1_funct7[0:2];

reg res1_sr1_refrence[0:2]; // This indicates whether value to be taken  from register file or refrence;1 = register file . 0 = refrence
reg [31:0]res1_sr1[0:2];//This stores refrence either value
reg [2:0]res1_sr1_ref_value[0:2];//This stores pointer to R
reg res1_sr2_refrence[0:2]; // This indicates whether value to be taken  from register file or refrence;1 = register file . 0 = refrence
reg [31:0]res1_sr2[0:2];//This stores refrence either to ROB or values;
reg [2:0]res1_sr2_ref_value[0:2];

reg [2:0]res1_dest[0:2];// This stores refrence to ROB
reg res1_ready[0:2];// this indicates whic enrty is ready to  executed
reg res1_issued[0:2];// this indicates whether the entry is issued to execution stage or not;
//Reservation station for mul and divide
    // Size of res2 = 4 instruction;
/////////////////////////////////////////////////////////
integer res2_no_of_enteries;
reg [31:0]res2_instructions[0:1];
reg res2_free_entry[0:1];// gives us the list of free enteries; 1 = free ,0 = busy
reg [2:0]res2_funct3[0:1];

reg res2_sr1_refrence[0:1]; // This indicates whether value to be taken  from register file or refrence;1 = register file . 0 = refrence to ROB
reg [31:0]res2_sr1[0:1];//This stores refrence either to ROB or value;
reg [2:0]res2_sr1_ref_value[0:1];

reg res2_sr2_refrence[0:1]; // This indicates whether value to be taken  from register file or refrence;1 = refrence register file . 0 = refrence ROB
reg [31:0]res2_sr2[0:1];//This stores refrence either to ROB or value;
reg [2:0]res2_sr2_ref_value[0:1];// this stores ROB pointer

reg [2:0]res2_dest[0:1];// This stores refrence to ROB
reg res2_ready[0:1];// this indicates which entry is ready to  executed
reg res2_issued[0:1];// this indicates whether the entry is issued to execution stage or not;
// LSQ
//reservationstation for lsq=3
integer res3_no_of_enteries;
reg [31:0] res3_instructions[0:2];
reg res3_free_entry[0:2];
reg [6:0]res3_opcode[0:2];
reg res3_sr1_refrence[0:2];
reg [31:0]res3_sr1[0:2];
reg [2:0] res3_sr1_ref_value[0:2];
reg [11:0]res3_off[0:2];
reg [2:0]res3_dest_tag[0:2];
reg res3_ready[0:2];// this indicates which entry is ready to  executed
reg res3_issued[0:2];//to memory stage

//Excecution
reg res1_execution_unit; // this indicates whether res1 exe. units are busy or free. 1 = busy , 0 = free
reg res2_execution_unit;
reg res3_execution_unit; // this indicates whether res2 exe. units are busy or free.
reg[31:0] res1_v; reg res1_v_received;integer i0;reg res1_v_written;// this stores which entry of reservation station rs1 was being used.
reg[31:0] res2_v; reg res2_v_received;integer i1;reg res2_v_written;// this stores which entry of reservation station rs1 was being used.
reg[31:0] res3_v;  reg res3_v_received;integer i2;reg res3_v_written;// this stores which entry of reservation station rs2 was being used.
reg[31:0] res3_signextoff;
reg[31:0] res3_eac;
reg [31:0]res1_i;// store instruction of f1 ;
reg [31:0]res2_i;// store instruction f2;
reg [31:0]res3_i;// store instruction f3;
reg [31:0] res1_execution_unit_rs1;
reg [31:0] res1_execution_unit_rs2;
reg [31:0] res2_execution_unit_rs1;
reg [31:0] res2_execution_unit_rs2;
reg [31:0] res3_execution_unit_rs1;
reg [11:0] res3_execution_unit_off;
reg [2:0]res1_execution_unit_dest;
reg [2:0]res2_execution_unit_dest;
reg [2:0]res3_execution_unit_dest;

//
reg [1:0] pop = 2'b00;
reg clk;
reg [3:0]pc ;

integer addlat=0,sublat=0,multlat=0,divlat=0,ldlat=0;
reg addcounter=0,subcounter=0,multcounter=0,divcounter=0,ldcounter=0;
//
issue i();
integer m ;
integer n ;
integer p;
integer j,h;
initial begin
  clk = 1'b0;
  pc = 4'b0000;

  //Initializing instruction_queue
  iq_f = 1'b0;
  instruction_queue_head = 3'b000;
  instruction_queue_tail = 3'b000;
  instruction_queue_no_of_enteries = 0;

 // Initializing ROB
  head = 3'b000;
  tail = 3'b000;
  rob_no_of_enteries = 0;
  m = 0;
  while(m < 8) begin
    commit[m] = 1'b0 ; // this while loops just initializes commit array to 0;
    v_des[m] = 1'b0;
	 reg_valid[2*m+1] = 1'b1;
	 reg_valid[2*m] = 1'b1;
     m = m + 1;
  end
  j=11;
  reg_file[0] = 32'd0;
  reg_file[1] = 32'd12;
  reg_file[2]=32'd16;
  reg_file[3]=32'd45;
  reg_file[4]=32'd5;
  reg_file[5]=32'd3;
  reg_file[6]=32'd4;
  reg_file[7]=32'd1;
  reg_file[8]=32'd2;
  reg_file[9]=32'd2;
  reg_file[10]=32'd3;
  while (j<32)
  begin
  reg_file[j]=0;
  j=j+1;
  end
  
  // Initializing reservation station
  res1_no_of_enteries = 0;
  res2_no_of_enteries = 0;
  res3_no_of_enteries=0;
  n = 0 ;
  while(n < 3)begin
    res1_free_entry[n] = 1'b1;
    res3_free_entry[n] = 1'b1;
    res1_sr1_refrence[n] = 1'b0;
    res1_sr2_refrence[n] = 1'b0;
    res3_sr1_refrence[n] = 1'b0;
    res1_ready[n] = 1'b0;
    res3_ready[n] = 1'b0;
    res1_issued[n] = 1'b0;
    res3_issued[n] = 1'b0;
    n = n + 1;
  end
  h = 0 ;
  while(h < 2)begin
    res2_free_entry[h] = 1'b1;
    res2_sr1_refrence[h] = 1'b0;
    res2_sr2_refrence[h] = 1'b0;
    res2_ready[h] = 1'b0;
    res2_issued[h] = 1'b0;
    h = h + 1;
  end
  
  
  
  // execution_unit
   res1_execution_unit = 1'b0;//free
   res2_execution_unit = 1'b0;// free
   res3_execution_unit = 1'b0;
   res1_v_received = 1'b0;
   res2_v_received = 1'b0;
   res3_v_received = 1'b0;

   res1_v_written = 1'b0;
   res2_v_written = 1'b0;
   res3_v_written = 1'b0;
  $readmemh("instruction_memory.dat",instruction_memory);
  $readmemh("data_memory.dat",data_memory);
end
always begin
   #10 clk =~clk ;
end

initial #1500 $finish ;
endmodule