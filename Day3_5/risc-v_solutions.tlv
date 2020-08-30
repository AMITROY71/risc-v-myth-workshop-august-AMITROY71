$rs2_valid = $is_r_instr || $is_s_instr || $is_b_instr;
      ?$rs2_valid
         @1   
            $rs2[4:0] = $instr[24:20];
            $rs1_valid = $is_r_instr ||  $is_i_instr ||$is_s_instr || $is_b_instr;
      ?$rs1_valid   
         @1
            $rs1[4:0] = $instr[19:15];
            $func3_valid = $is_r_instr || $is_i_instr || $is_s_instr || $is_b_instr;
      ?$func3_valid
         @1
            $func3[2:0] = $instr[14:12];
            $func7_valid = $is_r_instr;
      ?$func7_valid   
         @1
            $func7[6:0] = $instr[31:25];
            $rd_valid = $is_r_instr || $is_i_instr || $is_u_instr || $is_j_instr;
      ?$rd_valid
         @1
            $rd[4:0] = $instr[11:7];
            $opcode_valid = $is_r_instr || $is_i_instr || $is_s_instr || $is_b_instr || $is_u_instr || $is_j_instr;
      ?$opcode_valid
         @1
            $opcode[6:0] = $instr[6:0];
