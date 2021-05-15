module execute();
  integer i;// used for res1
  integer  k ;// used for res2
  reg [5:0] u;
  //reg [1:0] p;
      always @ (posedge run.clk)
      begin
      if(run.divcounter)
      begin
      run.divlat=run.divlat+1;
      $display("   run.divlat=%d",run.divlat);
      if(run.divlat==40)
      begin
      run.res2_v = run.res2_execution_unit_rs1 / run.res2_execution_unit_rs2;
      run.res2_v_received =   1'b1; 
      run.divcounter=0;
      end
      end
      else if(run.res2_v_received)
      begin
      run.divlat=0;
      run.res2_v_written = 1'b1;
      $display("        Instruction : %h , Execution Complete",run.res2_i);
      $display("        Functional Unit: F1");
      $display("        Result : %h \n",run.res2_v);
      run.res2_v_received = 1'b0;
      end
      end

   always @ (posedge run.clk)
    begin
    if(run.multcounter)
    begin
    run.multlat=run.multlat+1;
    $display("   run.multlat=%d",run.multlat);
      
      if(run.multlat==9)
          begin
          run.res2_v = run.res2_execution_unit_rs1 * run.res2_execution_unit_rs2;
          run.res2_v_received =   1'b1;
          run.multcounter=0;
          end
    end       
    else if (run.res2_v_received)
    begin
        run.res2_v_written = 1'b1;
        $display("        Instruction : %h , Execution Complete",run.res2_i);
        $display("        Functional Unit: F1");
        $display("        Result : %h \n",run.res2_v);
        run.res2_v_received = 1'b0;
        run.multlat=0;
    end

    end


    always @ (posedge run.clk)
	begin
	if(run.addcounter)
  begin
     
      if(run.addlat==1)
      begin
      run.res1_v =    run.res1_execution_unit_rs1 + run.res1_execution_unit_rs2;
      run.res1_v_received =   1'b1;
      run.addcounter=0;  
      end
      run.addlat=run.addlat+1;
  end
  else if(run.res1_v_received)
    begin
      run.addlat=0;
      run.res1_v_written = 1'b1;
      $display("        Instruction : %h , Execution Complete\n",run.res1_i);
      $display("        Functional Unit: F0");
      $display("        Result : %h \n",run.res1_v);
      run.res1_v_received = 1'b0;
    end
  end
  
  always @ (posedge run.clk)
	begin
	if(run.subcounter)
  begin
  run.sublat=run.sublat+1;
  if(run.sublat==1)
  begin
   run.res1_v =    run.res1_execution_unit_rs1 - run.res1_execution_unit_rs2;
   run.res1_v_received =   1'b1;
   run.subcounter=0;  
  end
  end
  else if(run.res1_v_received)
    begin
      run.sublat=0;
      run.res1_v_written = 1'b1;
      $display("        Instruction : %h , Execution Complete\n",run.res1_i);
      $display("        Functional Unit: F0");
      $display("        Result : %h \n",run.res1_v);
      run.res1_v_received = 1'b0;
    end
  end
  
  always @ (posedge run.clk)
  begin
    if (run.ldcounter)
    begin
            run.ldlat=run.ldlat+1;

      if(run.ldlat==4)
      begin
       for(u=0;u<63;u=u+1'b1)
        begin
          if(run.res3_eac[5:0]==u)
          begin
        run.res3_v<=  run.data_memory[u];
        run.res3_v_received<=  1'b1;
        run.ldcounter=0;
        $display("lddd");
        end
        end 
      end
    end
      else if (run.res3_v_received)
      begin
        run.res3_v_written = 1'b1;
            $display("        Instruction : %h , Execution Complete",run.res3_i);
            $display("        Functional Unit: F2");
            $display("        Result : %h \n",run.res3_v);
            run.res3_v_received = 1'b0;
            run.ldlat=0;
        
      end

  end


    always@(posedge run.clk)
    begin
     #6
     $display("EXECUTION1 STAGE : \n");
      i = 0 ;
      while(i < 3)// 0 1 2 
      begin
           if(run.res1_ready[i] && (!run.res1_execution_unit))//only start execution if execution unit is free as well as res1 is ready
           begin
                // executing that entry;
                run.res1_i = run.res1_instructions[i];
                run.i0 = i;
                if( run.res1_funct7[i] == 7'b0000000 )// if add
                begin 
				        run.res1_execution_unit_rs1=run.res1_sr1[i];
                run.res1_execution_unit_rs2=run.res1_sr2[i];
                run.res1_execution_unit_dest=run.res1_dest[ run.i0];
                run.res1_free_entry[run.i0] = 1'b1;
                run.res1_ready[run.i0]=0;
                run.res1_issued[run.i0]=1;
                $display("        Reservation Station 1\n");
                $display("        Index : %h",run.i0);
                $display("        Free : %h\n",run.res1_free_entry[run.i0]);
                run.res1_no_of_enteries = run.res1_no_of_enteries - 1;
                run.res1_v_received = 1'b0;
                run.addcounter=1;
                $display("         Intruction : %h , Executing starts",run.res1_i);
                $display("         Functional Unit : F0");
                $display("         adding : %h + %h\n",run.res1_execution_unit_rs1 , run.res1_execution_unit_rs2);
			          end

                else if(run.res1_funct7[i] == 7'b0100000 )// if sub
                begin
				   
                run.res1_execution_unit_rs1=run.res1_sr1[i];
                run.res1_execution_unit_rs2=run.res1_sr2[i];
                run.res1_execution_unit_dest=run.res1_dest[ run.i0];
                run.res1_free_entry[run.i0] = 1'b1;
                run.res1_ready[run.i0]=0;
                run.res1_issued[run.i0]=1;
                $display("        Reservation Station 1\n");
                $display("        Index : %h",run.i0);
                $display("        Free : %h\n",run.res1_free_entry[run.i0]);
                run.res1_no_of_enteries = run.res1_no_of_enteries - 1;
                run.res1_v_received =   1'b0;
                run.subcounter=1;
                //run.res1_v <= #10  run.res1_execution_unit_rs1 - run.res1_execution_unit_rs2 ;
                //run.res1_v_received <= #10  1'b1;
                $display("        Intruction : %h , Executing starts",run.res1_i);
                $display("        Functional Unit : F0");
                $display("        subtraction : %h  -  %h\n", run.res1_execution_unit_rs1,run.res1_execution_unit_rs2);
                end
               // run.res1_issued[i] = 1'b1;// this entry is issued , no need to issue that again;
			    //run.res1_free_entry[run.i0] = 1'b1;//RS IS FREE NOW
                i = i + 1;
                run.res1_execution_unit = 1'b1;// it became busy now

           end
           else 
           i=i+1;
		end

       $display("        F0-Busy : %h",run.res1_execution_unit);
      if(run.res1_execution_unit)
      $display("        Executing : %h\n ",run.res1_i);


  end
    always@(posedge run.clk)
     begin
      #6
              $display("EXECUTION2 STAGE : \n");
              k = 0 ;
              while(k < 2)// 0 1 
              begin
              if( run.res2_ready[k]&& (!run.res2_execution_unit)) //only start execution if execution unit is free as well as res1 is ready
              begin
              // executing that entry;
              run.i1 = k;
             // $display("    run.res2_ready[k]=%b   run.res2_execution_unit=%b run.pop[k]=%b k=%d",run.res2_ready[k],run.res2_execution_unit,run.pop[k],k);
              run.res2_i = run.res2_instructions[k];
              run.res2_v_received =   1'b0;
              if(run.res2_funct3[k] == 3'b000)// if multiply
              begin

              run.res2_execution_unit_rs1=run.res2_sr1[k];
              run.res2_execution_unit_rs2=run.res2_sr2[k];
              run.res2_execution_unit_dest=run.res2_dest[ run.i1];
              run.res2_free_entry[run.i1] = 1'b1;
              run.res2_ready[run.i1]=0;
              run.res2_issued[run.i1]=1;
              $display("        Reservation Station 1\n");
              $display("        Index : %h",run.i1);
              $display("        Free : %h\n",run.res2_free_entry[run.i1]);
              run.res2_no_of_enteries = run.res2_no_of_enteries - 1;
              run.multcounter=1;
              run.res2_v_received =   1'b0;
               //$display("     1. condintion true run.multlat=%d",run.multlat);
              //run.multcounter=0;
              $display("        Intruction : %h , Executing starts",run.res2_i);
              $display("        Functional Unit : F1");
              $display("        Multiplying : %h * %h\n",run.res2_execution_unit_rs1 , run.res2_execution_unit_rs2);

              end

              else if(run.res2_funct3[k] == 3'b100)// if divide
              begin
              run.res2_execution_unit_rs1=run.res2_sr1[k];
              run.res2_execution_unit_rs2=run.res2_sr2[k];
              run.res2_execution_unit_dest=run.res2_dest[ run.i1];
              run.res2_free_entry[run.i1] = 1'b1;
              run.res2_ready[run.i1]=0;
              run.res2_issued[run.i1]=1;
              $display("        Reservation Station 2\n");
              $display("        Index : %h",run.i1);
              $display("        Free : %h\n",run.res2_free_entry[run.i1]);
              run.res2_no_of_enteries = run.res2_no_of_enteries - 1;
              run.divcounter=1;
              run.res2_v_received =   1'b0;
              //$display("     1. condintion true run.divlat=%d",run.divlat);
              $display("        Intruction : %h , Executing starts ",run.res2_i);
              $display("        Functional Unit : F1");
              $display("        Dividing : %h / %h\n",run.res2_execution_unit_rs1,run.res2_execution_unit_rs2);

					    end
            // run.res2_issued[k] = 1'b1;
            //run.res2_free_entry[run.i1] = 1'b1;
            run.res2_execution_unit = 1'b1;// it  busy now
            k = k + 1;
            end
            else
            k = k + 1 ;

            end
            $display("        F1-Busy : %h",run.res2_execution_unit);
            if(run.res2_execution_unit)
            $display("        Executing : %h\n",run.res2_i);
    end
	  
	  always@(posedge run.clk)
     begin
        #3
        $display("EXECUTION3_eac_and memory fetch STAGE : \n");
        k = 0 ;
        while(k < 3)// 0 1 2
        begin
        if(run.res3_ready[k] && (!run.res3_execution_unit) )
        begin
        $display("        Res3_ready: %h",run.res3_ready[k]);
        run.i2 = k;
        run.res3_i = run.res3_instructions[k];

        if(run.res3_opcode[k] == 7'b0000011)// if ld
        begin
        //run.res3_signextoff={run.res3_off[11],run.res3_off[11],run.res3_off[11],run.res3_off[11],run.res3_off[11],run.res3_off[11],run.res3_off[11],run.res3_off[11],run.res3_off[11],run.res3_off[11],run.res3_off[11],run.res3_off[11],run.res3_off[11],run.res3_off[11],run.res3_off[11],run.res3_off[11],run.res3_off[11],run.res3_off[11],run.res3_off[11],run.res3_off[11],run.res3_off[k]};
        //run.res3_signextoff[11:0]=run.res3_off[11:0];
        //if(run.res3_off[11])
        //run.res3_signextoff[31:12]=20'b11111111111111111111;
        //else
        //run.res3_signextoff[31:12]=20'b00000000000000000000;

        run.res3_signextoff=32'h00000000;
        run.res3_eac =  run.res3_sr1[k] + run.res3_signextoff;
        $display("run.res3_signext=%b",run.res3_signextoff);
        $display("run.res3_eac=%b",run.res3_eac);
        run.res3_v_received =  1'b0;
        run.res3_execution_unit_dest=run.res3_dest_tag[ run.i2];
        run.res3_free_entry[run.i2] = 1'b1;
        run.res3_ready[run.i2]=1'b0;
        run.res3_issued[run.i2]=1'b1;
        run.ldcounter=1;
        $display("        Reservation Station 3\n");
        $display("        Index : %h",run.i2);
        $display("        Free : %h\n",run.res3_free_entry[run.i2]);
        /*
//					    run.ldcounter=1;
//					 if(run.ldlat==5)
//					 begin
//				      run.res3_v= 2;
//				      run.res3_v_received=1'b1;
//				      run.ldcounter=0;*/
					 
                      
                      $display("        Intruction : %h , Executing starts",run.res3_i);
                      $display("        Functional Unit : F2");
                     
                     //else
                     //run.ldcounter=1;
                     
		          //run.res3_free_entry[run.i2] = 1'b1;
				  //run.res3_issued[k] = 1'b1;
                  run.res3_execution_unit = 1'b1;// it  busy now
                  k = k + 1;
             end
            end 
             else
                 k = k + 1 ;

        end
		
		$display("        F2-Busy : %h",run.res3_execution_unit);
        if(run.res3_execution_unit)
        $display("        Executing : %h\n",run.res3_i);
        /*if(run.res3_v_received == 1'b1)
        begin
            run.res3_v_written = 1'b1;
            $display("        Instruction : %h , Execution Complete",run.res3_i);
            $display("        Functional Unit: F2");
            $display("        Result : %h \n",run.res3_v);
            run.res3_v_received = 1'b0;
        end*/
      end
	 
	 
	    
	  
endmodule
   