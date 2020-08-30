  $is_i_instr = $instr[6:2] ==? 5’b0000x ||
                       $instr[6:2] ==? 5’b001x0 ||
                       $instr[6:2] ==? 5’bxx001;
         $is_s_instr = $instr[6:2] ==? 5’b0100x;
         $is_r_instr = $instr[6:2] ==? 5’b01xxx ||
                       $instr[6:2] ==? 5’b011x0 ||
                       $instr[6:2] ==? 5’bxx100;
         $is_u_instr = $instr[6:2] ==? 5’b0x101;
         $is_b_instr = $instr[6:2] ==? 5’b11000;
         $is_j_instr = $instr[6:2] ==? 5’b11011;
