 module write_back();
integer i,p,q;// for res1 1st
integer k,p1,q1;// for res2 2nd
integer j,p2,q2;


always @(posedge run.clk)
   begin
#4
    
    $display("WRITE BACK STAGE : \n",);
    if(run.res1_v_written == 1'b1)// if value is received
    begin

        $display("        Instruction : %h , Written Back\n",run.res1_i);
        // update all places where that value is being used

        // first ROB value
		run.rob_index1=run.res1_execution_unit_dest;
         run.rob_dest_reg_value[run.rob_index1] = run.res1_v ;
         run.v_des[run.rob_index1] = 1'b1;// ready to retire;
         $display("        ROB\n");
         $display("        1.Index : %h",run.res1_execution_unit_dest);
         $display("        2.Rd : %h", run.rob_dest_reg_feild[run.res1_execution_unit_dest]);
         $display("        3.Value : %h",run.res1_v);
         $display("        4.Ready to Retire : %h",run.v_des[run.res1_execution_unit_dest]);
         $display("        5.Committed : %h\n",run.commit[run.res1_execution_unit_dest]);

         // make that entry free in res1 free;
         //run.res1_free_entry[run.i0] = 1'b1;
         //run.res1_no_of_enteries = run.res1_no_of_enteries - 1;
        /*  $display("        Reservation Station 1\n");
         $display("        Index : %h",run.i0);
         $display("        Free : %h\n",run.res1_free_entry[run.i0]); */
         //make execution unit free
         run.res1_execution_unit = 1'b0; // execution unit is free
         run.res1_v_written = 1'b0 ;

         // update value to all places where ever this value is needed;
         // check in reservation station where ever the value is needed update that
         $display("         Updates\n");
         i = 0 ;
         #6
		 /////////////////////////////////////////////////////////
         while(i < 3)
         begin
           // update sr1 in rs1;
           if(!run.res1_sr1_refrence[i] &&  (run.res1_sr1_ref_value[i] == run.rob_index1))// value to supposed to be taken from ROB
           begin

             $display("        RS : 1");
             run.res1_sr1[i] =  run.rob_dest_reg_value[run.rob_index1];
             $display("        Index : %d",i);
             $display("        Rs1 : %h\n",run.res1_sr1[i] );
             run.res1_sr1_refrence[i] = 1'b1;
            end
            // update sr2 in rs1
            if(!run.res1_sr2_refrence[i] &&  (run.res1_sr2_ref_value[i] == run.res1_dest[run.i0]))// value to supposed to be taken from ROB
            begin
             //$display("Sr2 getting update");
             $display("        RS : 1 ");
             run.res1_sr2[i] =  run.rob_dest_reg_value[run.rob_index1];
             $display("        Index : %d",i);
             $display("        Rs2 : %h\n",run.res1_sr2[i]);
             run.res1_sr2_refrence[i] = 1'b1;
            end
          // check if both sources are ready so that it is ready to get issued

            if(run.res1_sr1_refrence[i] && run.res1_sr2_refrence[i] && (!run.res1_issued[i]))
            begin
             $display("        RS : 1");
             run.res1_ready[i] = 1'b1;
             $display("        Index : %d",i);
             $display("        Ready : %h\n",run.res1_ready[i]);
             //$display("%h , Made Ready",run.res1_instructions[i]);
            end
			i=i+1;
		  end
		  
		  
		  
		  p=0;
		  while(p<2)
		  begin
		   // update sr1 in res2
            //$display("Wrong : %h %h %h ",run.res2_sr1_refrence[i]  ,run.res2_sr1_ref_value[i]   ,  run.res1_dest[run.i0]);
            if(!run.res2_sr1_refrence[p] &&  (run.res2_sr1_ref_value[p] == run.rob_index1))// value to supposed to be taken from ROB
            begin

              //$display("Sr1 getting update");
              run.res2_sr1[p] =  run.rob_dest_reg_value[run.rob_index1];
              run.res2_sr1_refrence[p] = 1'b1;
              $display("        RS : 2");
              $display("        Index : %d",p);
              $display("        Rs1 : %h\n",run.res2_sr1[p]);
             end
            // update sr2 in rs2;
             if(!run.res2_sr2_refrence[p] &&  (run.res2_sr2_ref_value[p] == run.rob_index1))// value to supposed to be taken from ROB
             begin
              //$display("Sr2 getting update");
              run.res2_sr2[p] =  run.rob_dest_reg_value[run.rob_index1];
              run.res2_sr2_refrence[p] = 1'b1;
              $display("        RS : 2");
              $display("        Index : %d",p);
              $display("        Rs2 : %h\n",run.res2_sr2[p]);
             end
           // check if both sources are ready so that it is ready to get issued
             if(run.res2_sr1_refrence[p] && run.res2_sr2_refrence[p] && (!run.res2_issued[p]))
             begin
              run.res2_ready[p] = 1'b1;
              $display("        RS : 2");
              $display("        Index : %d",p);
              $display("        Ready : %h\n",run.res2_ready[p]);
              //$display("%h , Made Ready",run.res1_instructions[i]);
             end
            //
           p = p + 1 ;
          end
		  
		  
		  q=0;
		  while(q<3)
		  begin
		   // update sr1 in res3
            //$display("Wrong : %h %h %h ",run.res2_sr1_refrence[i]  ,run.res2_sr1_ref_value[i]   ,  run.res1_dest[run.i0]);
            if(!run.res3_sr1_refrence[q] &&  (run.res3_sr1_ref_value[q] == run.rob_index1))// value to supposed to be taken from ROB
            begin

              //$display("Sr1 getting update");
              run.res3_sr1[q] =  run.rob_dest_reg_value[run.rob_index1];
              run.res3_sr1_refrence[q] = 1'b1;
              $display("        RS : 3");
              $display("        Index : %d",q);
              $display("        Rs1 : %h\n",run.res3_sr1[q]);
             end
           // check if  source is ready so that it is ready to get issued
             if(run.res3_sr1_refrence[q] && (!run.res3_issued[q]) )
             begin
              run.res3_ready[q] = 1'b1;
              $display("        RS : 3");
              $display("        Index : %d",q);
              $display("        Ready : %h\n",run.res3_ready[q]);
              //$display("%h , Made Ready",run.res1_instructions[i]);
             end
            //
           q = q + 1 ;
          end
      end  
  end

always @(posedge run.clk)
    begin
      #4
      if(run.res2_v_written == 1'b1)// if value is received 
      begin
           $display("        Instruction : %h , Written Back\n",run.res2_i);
          // update all places where that value is being used
          // first ROB value
		  run.rob_index2=run.res2_execution_unit_dest;
         run.rob_dest_reg_value[run.rob_index2] = run.res2_v ;
         run.v_des[run.rob_index2] = 1'b1;// ready to retire;
         $display("        ROB\n");
         $display("        1.Index : %b tail: %b ",run.res2_execution_unit_dest,run.rob_index2);
         $display("        2.Rd : %h", run.rob_dest_reg_feild[run.res2_execution_unit_dest]);
         $display("        3.Value : %h",run.res2_v);
         $display("        4.Ready to Retire : %h      4*.Ready to Retire : %h",run.v_des[run.res2_execution_unit_dest],run.v_des[run.rob_index2]);
         $display("        5.Committed : %h\n",run.commit[run.res2_execution_unit_dest]);
           //run.rob_dest_reg_value[run.res2_dest[run.i1]] = run.res2_v ;
           //run.commit[run.res1_dest[run.i1]] = 1'b0
           //run.v_des[run.res2_dest[run.i1]] = 1'b1;// ready to retire;
          /*  $display("        ROB\n");
           $display("        1.Index : %h",run.res2_dest[run.i1]);
           $display("        2.Rd : %h", run.rob_dest_reg_feild[run.res2_dest[run.i1]]);
           $display("        3.Value : %h",run.res2_v);
           $display("        4.Ready to Retire : %h",run.v_des[run.res2_dest[run.i1]]);
           $display("        5.Committed : %h\n",run.commit[run.res2_dest[run.i1]]); */

           // make that entry free in res1 free;
           //run.res2_free_entry[run.i1] = 1'b1;
           //run.res2_no_of_enteries = run.res2_no_of_enteries - 1;

           //make execution unit free
           run.res2_execution_unit = 1'b0; // execution unit is free
           run.res2_v_written = 1'b0 ;

           // update value to all places where ever this value is needed;
           // check in reservation station where ever the value is needed update that
           /* $display("        Reservation Station 1\n");
           $display("        Index : %h",run.i1);
           $display("        Free : %h\n",run.res2_free_entry[run.i1]);
 */
           $display("        Updates\n");
           #6
           k = 0 ;
           while(k < 3)
           begin
             // update sr1 in rs1
             if(!run.res1_sr1_refrence[k] &&  (run.res1_sr1_ref_value[k] == run.rob_index2 ))// value to supposed to be taken from ROB
             begin
               run.res1_sr1[k] =  run.rob_dest_reg_value[run.rob_index2];
               run.res1_sr1_refrence[k] = 1'b1;
               $display("        RS : 1");
               $display("        Index : %d",k);
               $display("        Rs1 : %h\n",run.res1_sr1[k]);
             end
             // update sr2 in rs1
             if(!run.res1_sr2_refrence[k] &&  (run.res1_sr2_ref_value[k] ==  run.rob_index2))// value to supposed to be taken from ROB
             begin
               run.res1_sr2[k] =  run.rob_dest_reg_value[run.rob_index2];
               run.res1_sr2_refrence[k] = 1'b1;
               $display("        RS : 1");
               $display("        Index : %d",k);
               $display("        Rs2 : %h\n",run.res1_sr2[k]);
             end
            // check if both sources are ready so that it is ready to get issued
            if(run.res1_sr1_refrence[k] && run.res1_sr2_refrence[k] && (!run.res1_issued[k]))
            begin
                   run.res1_ready[k] = 1'b1;
                   $display("        RS : 1");
                   $display("        Index : %d",k);
                   $display("        Ready : %h\n",run.res1_ready[k]);
            end
			k=k+1;
			end
			
			
				  p1=0;
		  while(p1<2)
		  begin
		   // update sr1 in res2
            //$display("Wrong : %h %h %h ",run.res2_sr1_refrence[i]  ,run.res2_sr1_ref_value[i]   ,  run.res1_dest[run.i0]);
            if(!run.res2_sr1_refrence[p1] &&  (run.res2_sr1_ref_value[p1] == run.rob_index2))// value to supposed to be taken from ROB
            begin

              //$display("Sr1 getting update");
              run.res2_sr1[p1] =  run.rob_dest_reg_value[run.rob_index2];
              run.res2_sr1_refrence[p1] = 1'b1;
              $display("        RS : 2");
              $display("        Index : %d",p1);
              $display("        Rs1 : %h\n",run.res2_sr1[p1]);
             end
            // update sr2 in rs2;
             if(!run.res2_sr2_refrence[p1] &&  (run.res2_sr2_ref_value[p1] ==run.rob_index2 ))// value to supposed to be taken from ROB
             begin
              //$display("Sr2 getting update");
              run.res2_sr2[p1] = run.rob_dest_reg_value[run.rob_index2];
              run.res2_sr2_refrence[p1] = 1'b1;
              $display("        RS : 2");
              $display("        Index : %d",p1);
              $display("        Rs2 : %h\n",run.res2_sr2[p1]);
             end
           // check if both sources are ready so that it is ready to get issued
             if(run.res2_sr1_refrence[p1] && run.res2_sr2_refrence[p1] && (!run.res2_issued[p1]))
             begin
              run.res2_ready[p1] = 1'b1;
              $display("        RS : 2");
              $display("        Index : %d",p1);
              $display("        Ready : %h\n",run.res2_ready[p1]);
              //$display("%h , Made Ready",run.res1_instructions[i]);
             end
            //
           p1 = p1 + 1 ;
          end
		  
		  
		    q1=0;
		  while(q1<3)
		  begin
		   // update sr1 in res3
            //$display("Wrong : %h %h %h ",run.res2_sr1_refrence[i]  ,run.res2_sr1_ref_value[i]   ,  run.res1_dest[run.i0]);
            if(!run.res3_sr1_refrence[q1] &&  (run.res3_sr1_ref_value[q1] == run.rob_index2))// value to supposed to be taken from ROB
            begin

              //$display("Sr1 getting update");
              run.res3_sr1[q1] = run.rob_dest_reg_value[run.rob_index2];
              run.res3_sr1_refrence[q1] = 1'b1;
              $display("        RS : 3");
              $display("        Index : %d",q1);
              $display("        Rs1 : %h\n",run.res3_sr1[q1]);
             end
           // check if  source is ready so that it is ready to get issued
             if(run.res3_sr1_refrence[q1] && (!run.res3_issued[q1]) )
             begin
              run.res3_ready[q1] = 1'b1;
              $display("        RS : 3");
              $display("        Index : %d",q1);
              $display("        Ready : %h\n",run.res3_ready[q1]);
              //$  display("%h , Made Ready",run.res1_instructions[i]);
             end
            //
           q1= q1 + 1 ;
          end

           

      end
    end

    always @(posedge run.clk)
      begin
        #7
        if(run.res3_v_written == 1'b1)// if value is received
        begin
             $display("        Instruction : %h , Written Back\n",run.res3_i);
            // update all places where that value is being used
            // update ROB value
            //run.commit[run.res3_dest_tag[run.i2]] = 1'b0;
			run.rob_index3=run.res3_execution_unit_dest;
            run.v_des[run.rob_index3] = 1'b1;// ready to retire;
            run.rob_dest_reg_value[run.rob_index3] = run.res3_v ;
            $display("        ROB\n");
            $display("        1.Index : %h",run.res3_execution_unit_dest);
            $display("        2.Rd : %h", run.rob_dest_reg_feild[run.rob_index3]);
            $display("        3.Value : %h",run.rob_dest_reg_value[run.rob_index3]);
            $display("        4.Ready to Retire : %h",run.v_des[run.rob_index3]);
            $display("        5.Committed : %h\n",run.commit[run.rob_index3]);

             // make that entry free in res1 free;
            /// run.res3_free_entry[run.i2] = 1'b1;
             //run.res3_no_of_enteries = run.res3_no_of_enteries - 1;

             //make execution unit free
             run.res3_execution_unit = 1'b0; // execution unit is free
             run.res3_v_written = 1'b0 ;

             // update value to all places where ever this value is needed;
             // check in reservation station where ever the value is needed update that
             /* $display("        Reservation Station 3\n");
             $display("        Index : %h",run.i2);
             $display("        Free : %h\n",run.res3_free_entry[run.i2]);

             $display("        Updates\n"); */
			  #6
			 
			  k = 0 ;
           while(k < 3)
           begin
             // update sr1 in rs1
             if(!run.res1_sr1_refrence[k] &&  (run.res1_sr1_ref_value[k] == run.rob_index3))// value to supposed to be taken from ROB
             begin
               run.res1_sr1[k] =  run.rob_dest_reg_value[run.rob_index3];
               run.res1_sr1_refrence[k] = 1'b1;
               $display("        RS : 1");
               $display("        Index : %d",k);
               $display("        Rs1 : %h\n",run.res1_sr1[k]);
             end
             // update sr2 in rs1
             if(!run.res1_sr2_refrence[k] &&  (run.res1_sr2_ref_value[k] == run.rob_index3))// value to supposed to be taken from ROB
             begin
               run.res1_sr2[k] =   run.rob_dest_reg_value[run.rob_index3];
               run.res1_sr2_refrence[k] = 1'b1;
               $display("        RS : 1");
               $display("        Index : %d",k);
               $display("        Rs2 : %h\n",run.res1_sr2[k]);
             end
            // check if both sources are ready so that it is ready to get issued
            if(run.res1_sr1_refrence[k] && run.res1_sr2_refrence[k]&&  (!run.res1_issued[k]))
            begin
                   run.res1_ready[k] = 1'b1;
                   $display("        RS : 1");
                   $display("        Index : %d",k);
                   $display("        Ready : %h\n",run.res1_ready[k]);
            end
			k=k+1;
			end
			
			
			
			 p2=0;
		  while(p2<2)
		  begin
		   // update sr1 in res2
            //$display("Wrong : %h %h %h ",run.res2_sr1_refrence[i]  ,run.res2_sr1_ref_value[i]   ,  run.res1_dest[run.i0]);
            if(!run.res2_sr1_refrence[p2] &&  (run.res2_sr1_ref_value[p2] == run.rob_index3))// value to supposed to be taken from ROB
            begin

              //$display("Sr1 getting update");
              run.res2_sr1[p2] = run.rob_dest_reg_value[run.rob_index3];
              run.res2_sr1_refrence[p2] = 1'b1;
              $display("        RS : 2");
              $display("        Index : %d",p2);
              $display("        Rs1 : %h\n",run.res2_sr1[p2]);
             end
            // update sr2 in rs2;
             if(!run.res2_sr2_refrence[p2] &&  (run.res2_sr2_ref_value[p2] ==run.rob_index3) && (!run.res3_issued[p2]))// value to supposed to be taken from ROB
             begin
              //$display("Sr2 getting update");
              run.res2_sr2[p2] = run.rob_dest_reg_value[run.rob_index3];
              run.res2_sr2_refrence[p2] = 1'b1;
              $display("        RS : 2");
              $display("        Index : %d",p2);
              $display("        Rs2 : %h\n",run.res2_sr2[p2]);
             end
           // check if both sources are ready so that it is ready to get issued
             if(run.res2_sr1_refrence[p2] && run.res2_sr2_refrence[p2] && (!run.res2_issued[p2]))
             begin
              run.res2_ready[p2] = 1'b1;
              $display("        RS : 2");
              $display("        Index : %d",p2);
              $display("        Ready : %h\n",run.res2_ready[p2]);
              //$display("%h , Made Ready",run.res1_instructions[i]);
             end
            //
           p2 = p2+ 1 ;
          end
		  
		  
		  
		    q2=0;
		  while(q2<3)
		  begin
		   // update sr1 in res3
            //$display("Wrong : %h %h %h ",run.res2_sr1_refrence[i]  ,run.res2_sr1_ref_value[i]   ,  run.res1_dest[run.i0]);
            if(!run.res3_sr1_refrence[q2] &&  (run.res3_sr1_ref_value[q2] ==run.rob_index3))// value to supposed to be taken from ROB
            begin

              //$display("Sr1 getting update");
              run.res3_sr1[q2] = run.rob_dest_reg_value[run.rob_index3];
              run.res3_sr1_refrence[q2] = 1'b1;
              $display("        RS : 3");
              $display("        Index : %d",q2);
              $display("        Rs1 : %h\n",run.res3_sr1[q2]);
             end
           // check if  source is ready so that it is ready to get issued
             if(run.res3_sr1_refrence[q2] && (!run.res3_issued[q2]) )
             begin
              run.res3_ready[q2] = 1'b1;
              $display("        RS : 3");
              $display("        Index : %d",q2);
              $display("        Ready : %h\n",run.res3_ready[q2]);
              //$  display("%h , Made Ready",run.res1_instructions[i]);
             end
            //
           q2= q2 + 1 ;
          end
			
            
      end
      end
endmodule
