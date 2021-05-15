module issue();
   fetch f1();
   decode d1();
   execute e1();
   write_back wb1();
   commit c1();
endmodule

/* This module gets the instruction from the memory
puts the data in instruction queue */
module fetch();
//reg [3:0]previous_pc,current_pc;// this will account for stall  condition
always@(posedge run.clk)

begin
  #10
  $display("FETCH STAGE : \n");
  if(!run.iq_f)
    begin// it only write in intrucution queue if iq_f = 0;
       run.instruction_queue[run.instruction_queue_tail] = run.instruction_memory[run.pc];
       $display("        PC : %h \n",run.pc);
       $display("        Fetched : %h \n",run.instruction_queue[run.instruction_queue_tail]);
       run.instruction_queue_no_of_enteries = run.instruction_queue_no_of_enteries + 1;
       $display("        Instruction queue\n");
       $display("        Size : %d ",run.instruction_queue_no_of_enteries);
       run.instruction_queue_tail =  run.instruction_queue_tail + 3'b001;
       $display("        Head : %h ",run.instruction_queue_head);
       $display("        Tail : %h \n",run.instruction_queue_tail);
       if(run.instruction_queue_no_of_enteries == 8)//4 = length of instruction_queue
              run.iq_f = 1'b1; // instruction_queue_is_full --> dont allow write for further instructions
       run.pc = run.pc + 4'b0001;// next instruction to be fetched;
    end
 else
  $display("        Stall , IQ : Full , Next PC = %b \n",run.pc);
end
endmodule

/*this module decodes the signal, add the entry to the ROB,
/and the sends the istruction to appropriate  reservation station */
module decode();

integer i ;
integer k ;
integer j ;
always @(posedge run.clk)
  begin
    #7
     $display("DECODE STAGE : \n");
     //$display("ROB HEAD : %h",run.head);
     //$display("ROB TAIL : %h",run.tail);
      if((run.instruction_queue_no_of_enteries != 0) && (run.rob_no_of_enteries < 8))//ensures instruction queue is not empty and rob is not full
         begin
              case(run.instruction_queue[run.instruction_queue_head][6:0])
                      7'b0110011 :
                      begin
                          // check what it is mul or div or add or sub
						  
						  if((run.instruction_queue[run.instruction_queue_head][14:12]==3'b000) && (run.instruction_queue[run.instruction_queue_head][31:25]!=7'b0000001) )
						  begin
                          if(run.res1_no_of_enteries < 3)
                                    begin
                                       // updating ROB
                                       $display("        Decoded : %h , Location : RS1 \n",run.instruction_queue[run.instruction_queue_head]);
                                       $display("        R0B  \n");
                                       $display("        1.ROB Head : %h",run.head);
                                       $display("        2.R0B Tail : %h",run.tail);

                                       run.rob_instruction_feild[run.tail] = run.instruction_queue[run.instruction_queue_head];

                                       run.rob_opcode_feild[run.tail] = run.instruction_queue[run.instruction_queue_head][6:0];// last 4 bits are opcode
                                       $display("        3.Opcode : %h",run.rob_opcode_feild[run.tail]);

                                       run.rob_dest_reg_feild[run.tail] = run.instruction_queue[run.instruction_queue_head][11:7];// destination register
                                       $display("        4.Destination Register : %h",run.rob_dest_reg_feild[run.tail] );

                                       run.v_des[run.tail] = 1'b0;// making valid bit 0;
                                       $display("        5.Valid value : %d", run.v_des[run.tail]);

                                       run.commit[run.tail] = 1'b0;
                                       $display("        6.Committed : %d",run.commit[run.tail]);

                                       run.rob_no_of_enteries = run.rob_no_of_enteries + 1;
                                       $display("        7.Rob Size \n: %d",run.rob_no_of_enteries);

                                       // searching for free entry in reservation station
                                       $display("        Reservation Station 1 \n");

                                       i = 0 ;
                                           while(i < 3)
                                                 begin
                                                   if(run.res1_free_entry[i] == 1'b1)begin
                                                   k = i ;
                                                   run.res1_free_entry[k] = 1'b0;
                                                   $display("         1.Index : %d",k);

                                                   run.res1_no_of_enteries = run.res1_no_of_enteries + 1;
                                                   $display("         2.Size : %d",run.res1_no_of_enteries);
                                                   i = 3 ;end
                                                   else
                                                    i = i+1;
                                            end
                                           //updating reservation station
                                           run.res1_instructions[k] = run.instruction_queue[run.instruction_queue_head];
                                           run.res1_funct7[k] = run.instruction_queue[run.instruction_queue_head][31:25];// opcode
                                           $display("         3.funct7 : %h",run.res1_funct7[k]);

                                           run.res1_ready[k] = 1'b0;// make it initially as not ready
                                           // sr1
                                           if(!run.reg_valid[run.instruction_queue[run.instruction_queue_head][19:15]])
                                              begin
                                                  run.res1_sr1_refrence[k] = 1'b0;// take value from ROB
                                                  run.res1_sr1_ref_value[k]= run.reg_rename[run.instruction_queue[run.instruction_queue_head][19:15]];// check refrence in rename register
                                                  $display("         4.Rs1 : Rob [%h] ",run.res1_sr1_ref_value[k]);
                                                  //$display("sr1 : %h",run.res1_sr1_ref_value[k]);
                                              end
                                          else
                                               begin
                                                 run.res1_sr1_refrence[k] = 1'b1; // value in actual register
                                                 run.res1_sr1[k] = run.reg_file[run.instruction_queue[run.instruction_queue_head][19:15]];//  register
                                                 $display("         5.Rs1 : R[%h] ",run.instruction_queue[run.instruction_queue_head][19:15]);
                                               end

                                            //sr2
                                             if(!run.reg_valid[run.instruction_queue[run.instruction_queue_head][24:20]])
                                                 begin
                                                     run.res1_sr2_refrence[k] = 1'b0; // take value from ROB // refrence to ROB
                                                     run.res1_sr2_ref_value[k] = run.reg_rename[run.instruction_queue[run.instruction_queue_head][24:20]];// check refrence in rename register
                                                     $display("         6.Rs2 : Rob [%h] ",run.res1_sr2_ref_value[k]);
                                                     //$display("sr2 : %h",run.res1_sr2_ref_value[k]);
                                                 end
                                            else
                                                  begin
                                                      run.res1_sr2_refrence[k] = 1'b1; //
                                                      run.res1_sr2[k] = run.reg_file[run.instruction_queue[run.instruction_queue_head][24:20]];//  register
                                                      $display("         7.Rs2 : R[%h] ",run.instruction_queue[run.instruction_queue_head][24:20]);
                                                  end
                                        // register renaming for destination register and updating value
                                          run.res1_dest[k] = run.tail;// storing refrence in ROB
                                          $display("         8.Rd : Rob [%h] ",run.res1_dest[k]);

                                          run.reg_rename[run.instruction_queue[run.instruction_queue_head][11:7]] = run.tail;// pointer to ROB
                                        // making valid bit 0; It also symbolises that the register is renamed and the value has to be fetched from R
                                          run.reg_valid[run.instruction_queue[run.instruction_queue_head][11:7]] = 1'b0; // / making valid bit 0; It also symbolises that the register is renamed and the value has to be fetched from taken corresponding to ROB
                                          run.tail = run.tail + 3'b001;

                                         if((run.res1_sr1_refrence[k] == 1'b1 && run.res1_sr2_refrence[k] == 1'b1) && (run.res1_free_entry[k] == 1'b0)) // if both operands are available make it ready
                                             begin
                                               run.res1_ready[k] = 1'b1;

                                             end
                                          else
                                             run.res1_ready[k] = 1'b0;
                                         $display("         9.Ready : %h ",run.res1_ready[k]);

                                         run.res1_issued[k] = 1'b0;// since this enrty is not issued yet
                                         //$display("         10.Issued : %h \n",run.res1_issued[k]);
                                        // incrementing head pointer in instruction_queue and dercrementing no. of enteries in instruction_queue
                                         run.instruction_queue_head = run.instruction_queue_head + 3'b001;
                                         run.instruction_queue_no_of_enteries = run.instruction_queue_no_of_enteries - 1;

                              end
                          else
                                $display("        Stall , RS1 : Full\n");
						  
                        end
						
						
                       else if(run.instruction_queue[run.instruction_queue_head][31:25]==7'b0000001)
                       begin
                           // check which entry is free and put it in that entry
                           if(run.res2_no_of_enteries < 2)
                                     begin
                                       $display("        Decoded : %h , Location : RS2 \n",run.instruction_queue[run.instruction_queue_head]);
                                        // updating ROB
                                        $display("        R0B : \n");
                                        $display("        1.ROB Head : %h",run.head);
                                        $display("        2.ROB Tail : %h",run.tail);
                                        run.rob_instruction_feild[run.tail] = run.instruction_queue[run.instruction_queue_head];

                                        run.rob_opcode_feild[run.tail] = run.instruction_queue[run.instruction_queue_head][6:0];// last 4 bits are opcode
                                        $display("        3.Opcode : %h",run.rob_opcode_feild[run.tail]);

                                        run.rob_dest_reg_feild[run.tail] = run.instruction_queue[run.instruction_queue_head][11:7];// destination register
                                        $display("        4.Destination Register : %h",run.rob_dest_reg_feild[run.tail] );

                                        run.v_des[run.tail] = 1'b0;// making valid bit 0;
                                        $display("        5.Valid value : %d", run.v_des[run.tail]);

                                        run.commit[run.tail] = 1'b0;
                                        $display("        6.Committed : %d",run.commit[run.tail]);

                                        run.rob_no_of_enteries = run.rob_no_of_enteries + 1;
                                        $display("        7.Rob Size : %d  \n",run.rob_no_of_enteries);

                                      // searching for free entry in reservation station
                                      $display("        Reservation Station 2  \n");

                                        i = 0 ;
                                            while(i < 2)
                                                  begin
                                                    if(run.res2_free_entry[i] == 1'b1)begin
                                                    k = i ;
                                                    $display("         1.Index : %d",k);
                                                    run.res2_free_entry[k] = 1'b0;

                                                    run.res2_no_of_enteries = run.res2_no_of_enteries + 1;
                                                    $display("         2.Size : %d",run.res2_no_of_enteries);
                                                    i = 2 ;end
                                                    else
                                                     i =  i+1;
                                             end
                                              $display("         1.Index : %d",k);
											  //updating reservation station
                                            run.res2_instructions[k] = run.instruction_queue[run.instruction_queue_head];
                                            run.res2_funct3[k] = run.instruction_queue[run.instruction_queue_head][14:12];// opcode
                                            $display("         3.func3 : %h",run.res2_funct3[k]);

                                            run.res2_ready[k] = 1'b0;// make it initially as not ready

                                            // sr1
                                            if(!run.reg_valid[run.instruction_queue[run.instruction_queue_head][19:15]])
                                               begin
                                                   run.res2_sr1_refrence[k] = 1'b0;// take value from ROB
                                                   run.res2_sr1_ref_value[k] = run.reg_rename[run.instruction_queue[run.instruction_queue_head][19:15]];// check refrence in rename register
                                                    $display("         4.Rs1 : Rob [%h] ",run.res2_sr1_ref_value[k]);
                                                end
                                           else
                                                begin
                                                  run.res2_sr1_refrence[k] = 1'b1; // value in actual register
                                                  //$display("sr1 fine");
                                                  run.res2_sr1[k] = run.reg_file[run.instruction_queue[run.instruction_queue_head][19:15]];//  register
                                                  $display("         5.Rs1 : R[%h] ",run.instruction_queue[run.instruction_queue_head][19:15]);

                                                end
                                           
										   

                                             //sr2
                                             if(!run.reg_valid[run.instruction_queue[run.instruction_queue_head][24:20]])
                                                  begin
                                                      run.res2_sr2_refrence[k] = 1'b0; // take value from ROB // refrence to ROB
                                                      run.res2_sr2_ref_value[k] = run.reg_rename[run.instruction_queue[run.instruction_queue_head][24:20]];// check refrence in rename register
                                                      $display("         6.Rs2 : Rob[%h] ",run.res2_sr2_ref_value[k]);
                                                      //$display("sr2 : %h",run.res2_sr2_ref_value[k]);
                                                  end
                                             else
                                                   begin
                                                       run.res2_sr2_refrence[k] = 1'b1; // value in actual register // refrence to regiseterfile;
                                                       //$display("sr2 fine");
                                                       run.res2_sr2[k] = run.reg_file[run.instruction_queue[run.instruction_queue_head][24:20]];//  register
                                                       $display("         7.Rs2 : R[%h] ",run.instruction_queue[run.instruction_queue_head][24:20]);
                                                   end
                                            // register renaming and updating values
                                            run.res2_dest[k] = run.tail;
                                            $display("         8.Rd : Rob [%h] ",run.res2_dest[k]);

                                            run.reg_rename[run.instruction_queue[run.instruction_queue_head][11:7]] = run.tail;// pointer to ROB
                                            // making valid bit 0; It also symbolises that the register is renamed and the value has to be fetched from
                                            run.reg_valid[run.instruction_queue[run.instruction_queue_head][11:7]] = 1'b0; // / making valid bit 0; It also symbolises that the register is renamed and the value has to be fetched from taken corresponding to ROB
                                            run.tail = run.tail + 3'b001;

                                             if((run.res2_sr1_refrence[k] == 1'b1 && run.res2_sr2_refrence[k] == 1'b1)&& (run.res2_free_entry[k] == 1'b0)) // if both operands are available make it ready
                                                  begin
                                                    run.res2_ready[k] = 1'b1;
                                                    //$display("This entry is ready");
                                                  end
                                             else
                                                  run.res2_ready[k] = 1'b0;
                                            $display("         9.Ready : %h ",run.res2_ready[k]);
                                           run.res2_issued[k] = 1'b0; // since this entry is not issued yet;
                                           //$display("         10.Issued : %h \n",run.res1_issued[k]);

                                         // incrementing head pointer in instruction_queue and dercrementing no. of enteries in instruction_queue
                                          run.instruction_queue_head = run.instruction_queue_head + 3'b001;
                                          run.instruction_queue_no_of_enteries = run.instruction_queue_no_of_enteries - 1;

                               end
                           else
                                 $display("        Stall , RS2 : Full\n");
                         end
						end
						
						7'b0000011:
						begin
						 if(run.res3_no_of_enteries < 3)
                                     begin
                                       $display("        Decoded : %h , Location : RS3 \n",run.instruction_queue[run.instruction_queue_head]);
                                        // updating ROB
                                        $display("        R0B : \n");
                                        $display("        1.ROB Head : %h",run.head);
                                        $display("        2.ROB Tail : %h",run.tail);
                                        run.rob_instruction_feild[run.tail] = run.instruction_queue[run.instruction_queue_head];

                                        run.rob_opcode_feild[run.tail] = run.instruction_queue[run.instruction_queue_head][6:0];// last 4 bits are opcode
                                        $display("        3.Opcode : %h",run.rob_opcode_feild[run.tail]);

                                        run.rob_dest_reg_feild[run.tail] = run.instruction_queue[run.instruction_queue_head][11:7];// destination register
                                        $display("        4.Destination Register : %h",run.rob_dest_reg_feild[run.tail] );

                                        run.v_des[run.tail] = 1'b0;// making valid bit 0;
                                        $display("        5.Valid value : %d", run.v_des[run.tail]);

                                        run.commit[run.tail] = 1'b0;
                                        $display("        6.Committed : %d",run.commit[run.tail]);

                                        run.rob_no_of_enteries = run.rob_no_of_enteries + 1;
                                        $display("        7.Rob Size : %d  \n",run.rob_no_of_enteries);

                                      // searching for free entry in reservation station
                                      $display("        Reservation Station 3  \n");
									  
									  
                                        i = 0 ;
                                            while(i < 3)
                                                  begin
                                                    if(run.res3_free_entry[i] == 1'b1)begin
                                                    k = i ;
                                                    $display("         1.Index : %d",k);
                                                    run.res3_free_entry[k] = 1'b0;

                                                    run.res3_no_of_enteries = run.res3_no_of_enteries + 1;
                                                    $display("         2.Size : %d",run.res3_no_of_enteries);
                                                    i = 3 ;end
                                                    else
                                                     i =  i+1;
                                             end
											 
											 
											  //updating reservation station
                                            run.res3_instructions[k] = run.instruction_queue[run.instruction_queue_head];
                                            run.res3_opcode[k] = run.instruction_queue[run.instruction_queue_head][6:0];// opcode
                                            $display("         3. : %h",run.res2_funct3[k]);

                                            run.res3_ready[k] = 1'b0;// make it initially as not ready

                                            // sr1
                                            if(!run.reg_valid[run.instruction_queue[run.instruction_queue_head][19:15]])
                                               begin
                                                   run.res3_sr1_refrence[k] = 1'b0;// take value from ROB
                                                   run.res3_sr1_ref_value[k] = run.reg_rename[run.instruction_queue[run.instruction_queue_head][19:15]];// check refrence in rename register
                                                    $display("         4.Rs1 : Rob [%h] ",run.res3_sr1_ref_value[k]);
                                                end
                                           else
                                                begin
                                                  run.res3_sr1_refrence[k] = 1'b1; // value in actual register
                                                  //$display("sr1 fine");
                                                  run.res3_sr1[k] = run.reg_file[run.instruction_queue[run.instruction_queue_head][19:15]];//  register
                                                  $display("         5.Rs1 : R[%h] ",run.instruction_queue[run.instruction_queue_head][19:15]);

                                                end
     
											/// offset
											run.res3_off[k]=run.instruction_queue[run.instruction_queue_head][31:25];
											////////////////




										run.res3_dest_tag[k] = run.tail;
                                            $display("         8.Rd : Rob [%h] ",run.res3_dest_tag[k]);

                                            run.reg_rename[run.instruction_queue[run.instruction_queue_head][11:7]] = run.tail;// pointer to ROB
                                            // making valid bit 0; It also symbolises that the register is renamed and the value has to be fetched from
                                            run.reg_valid[run.instruction_queue[run.instruction_queue_head][11:7]] = 1'b0; // / making valid bit 0; It also symbolises that the register is renamed and the value has to be fetched from taken corresponding to ROB
                                            run.tail = run.tail + 3'b001;

                                             if((run.res3_sr1_refrence[k] == 1'b1)   && (run.res3_free_entry[k] == 1'b0) &&  (!run.res3_issued[k])) // if both operands are available make it ready
                                                  begin
                                                   $display("         *k : %h ",k);
                                                    $display("         *.run.res3_sr1_refrence[k] : %h ",run.res3_sr1_refrence[k]);
                                                     $display("         *.run.res3_free_entry[k] : %h ",run.res3_free_entry[k]);
                                                      $display("         *.run.res3_issued[k] : %h ",run.res3_issued[k]); 
                                                    run.res3_ready[k] = 1'b1;
                                                    //$display("This entry is ready");
                                                  end
                                             else
                                                  run.res3_ready[k] = 1'b0;
                                            $display("         9.Ready : %h ",run.res3_ready[k]);
                                           run.res3_issued[k] = 1'b0; // since this entry is not issued yet;
                                           //$display("         10.Issued : %h \n",run.res3_issued[k]);

                                         // incrementing head pointer in instruction_queue and dercrementing no. of enteries in instruction_queue
                                          run.instruction_queue_head = run.instruction_queue_head + 3'b001;
                                          run.instruction_queue_no_of_enteries = run.instruction_queue_no_of_enteries - 1;
										
                               end
                           else
                                 $display("        Stall , RS3 : Full\n");
                         end
						
                          default:
                          begin 
                          $display("        Unvalid Opcode %h\n",run.instruction_queue[run.instruction_queue_head][15:12]);
                          run.instruction_queue_no_of_enteries = run.instruction_queue_no_of_enteries - 1;
                           end
                      endcase
                  end
          else
             begin
                if(run.instruction_queue_no_of_enteries == 0)
                      $display("        Stall , IQ : Empty\n");
               else
                 $display("         Stall , ROB : Full\n");
             end

end
endmodule
