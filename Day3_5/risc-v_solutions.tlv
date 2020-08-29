$imm[31:0] = $is_i_instr ? { {21{$instr[31]}}, $instr[30:20] } 
                                  : $is_s_instr ? {{21{$instr[31]}}, $instr[30:25],$instr[11:7]} 
                                  : $is_b_instr ? { {19{$instr[31]}} , $inst[7] , $instr[30:25] , $instr[11:8] ,1'b0}
                                  : $is_u_instr ? { $instr[31] , $instr[30:12], 12'b0 }
                                  : $is_j_instr ? { {12{$instr[31]}} , $instr[20], $instr[30:25], $instr[24:21] ,1'b0 };
