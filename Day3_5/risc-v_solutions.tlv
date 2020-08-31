?$valid
         @1
            // YOUR CODE HERE
            // ...
            $pc[31:0] = >>1$reset ? 32'b0 : >>1$inc_pc;
            //$pc[31:0] = >>1$reset ? 32'b0 : $br_tgt_pc ? >>1$br_tgt_pc : >>1$inc_pc;
            $inc_pc[31:0] = $pc + 32'd4;
         
         
            //$imem_rd_addr[M4_IMEM_INDEX_CNT-1:0] = $pc[M4_IMEM_INDEX_CNT+1:2];
         
            $imem_rd_en = $reset;
            //$instr[31:0] = $imem_rd_data[$imem_rd_addr];
            $instr[31:0] =  $imem_rd_en ? 32'b0 : >>1$imem_rd_data[$imem_rd_addr];
            $imem_rd_addr[M4_IMEM_INDEX_CNT-1:0] = $pc[M4_IMEM_INDEX_CNT+1:2];
         
            $is_i_instr = $instr[6:2] ==? 5'b0000x ||
                       $instr[6:2] ==? 5'b001x0 ||
                       $instr[6:2] ==? 5'bxx001;
            $is_s_instr = $instr[6:2] ==? 5'b0100x;
            $is_r_instr = $instr[6:2] ==? 5'b01xxx ||
                       $instr[6:2] ==? 5'b011x0 ||
                       $instr[6:2] ==? 5'bxx100;
            $is_u_instr = $instr[6:2] ==? 5'b0x101;
            $is_b_instr = $instr[6:2] ==? 5'b11000;
            $is_j_instr = $instr[6:2] ==? 5'b11011;
         
            $imm[31:0] = $is_i_instr ? { {21{$instr[31]}}, $instr[30:20] } 
                                  : $is_s_instr ? {{21{$instr[31]}}, $instr[30:25],$instr[11:7]} 
                                  : $is_b_instr ? { {19{$instr[31]}} , $inst[7] , $instr[30:25] , $instr[11:8] ,1'b0}
                                  : $is_u_instr ? { $instr[31] , $instr[30:12], 12'b0 }
                                  : { {12{$instr[31]}} , $instr[20], $instr[30:25], $instr[24:21] ,1'b0 };
         
          
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
               $dec_bits[10:0] = {$funct7[5],$funct3[2:0],$opcode[6:0]};
               $is_beq = $dec_bits ==? 11'bx_000_1100011;
               $is_bne = $dec_bits ==? 11'bx_001_1100011;
               $is_blt = $dec_bits ==? 11'bx_100_1100011;
               $is_bge = $dec_bits ==? 11'bx_101_1100011;
               $is_bltu = $dec_bits ==? 11'bx_110_1100011;
               $is_bgeu = $dec_bits ==? 11'bx_111_1100011;
               $is_addi = $dec_bits ==? 11'bx_000_0010011;
               $is_load = $dec_bits ==? 11'bx_000_0000011;
               
               $is_lui = $dec_bits ==? 11'bx_xxx_0110111;
               $is_auipc = $dec_bits ==? 11'bx_xxx_0010111;
               $is_jal = $dec_bits ==? 11'bx_xxx_1101111;
               $is_jalr = $dec_bits ==? 11'bx_000_1100111;
               $is_sb = $dec_bits ==? 11'bx_000_0100011;
               $is_sh = $dec_bits ==? 11'bx_001_0100011;
               $is_sw = $dec_bits ==? 11'bx_010_0100011;
               $is_sltiu = $dec_bits ==? 11'bx_011_0010011;
               $is_xori = $dec_bits ==? 11'bx_100_0010011;
               $is_ori = $dec_bits ==? 11'bx_110_0010011;
               $is_andi = $dec_bits ==? 11'bx_111_0010011;
               $is_slli = $dec_bits ==? 11'b0_001_0010011;
               $is_srli = $dec_bits ==? 11'b0_101_0010011;
               $is_srai = $dec_bits ==? 11'b1_001_0010011;
               $is_add = $dec_bits ==? 11'b0_000_0110011;
               $is_sub = $dec_bits ==? 11'b1_000_0110011;
               $is_sll = $dec_bits ==? 11'b0_001_0110011;
               $is_slt = $dec_bits ==? 11'b0_010_0110011;
               $is_sltu = $dec_bits ==? 11'b0_011_0110011;
               $is_xor = $dec_bits ==? 11'b0_100_0110011;
               $is_srl = $dec_bits ==? 11'b0_101_0110011;
               $is_sra = $dec_bits ==? 11'b1_101_0110011;
               $is_or = $dec_bits ==? 11'b0_110_0110011;
               $is_and = $dec_bits ==? 11'b0_111_0110011;*/
               
            
               `BOGUS_USE($is_beq $is_bne $is_blt $is_bge $is_bltu $is_bgeu $is_addi $is_load $is_lui
                 $is_auipc $is_jal $is_jalr $is_sb $is_sh $is_sw $is_sltiu $is_xori $is_ori $is_andi
                 $is_slli $is_srli $is_srai $is_add $is_sub $is_sll $is_sltu $is_xor $is_srl $is_sra 
                 $is_or $is_and)
            
            
               //$rf_rd_data1 = $rf_rd_en1 ? $rs1 : 32'bz;
               //$rf_rd_data2 = $rf_rd_en2 ? $rs2 : 32'bz;
               //$rf_rd_en1 = $reset ? 32'b0 : $rf_rd_index1[4:0];
            
               $rf_rd_en1 = $rs1_valid ? $rs1[$rf_rd_index1[4:0]] : 32'b0;
               $rf_rd_en2 = $rs2_valid ? $rs2[$rf_rd_index2[4:0]] : 32'b0;
            
               $src1_value[31:0] = $rf_wr_en && ($rd == $rs1) ? $result : $rf_rd_data1;
               $src2_value[31:0] = $rf_wr_en && ($rd == $rs2) ? $result : $rf_rd_data2;
            
               $result[31:0] = $is_addi ? $src1_value + $imm : :32'bx; /*$is_add
                                        ? $src1_value + $src2_value : $is_sub
                                        ? $src1_value - $src2_value : $is_ori
                                        ? $src1_value | $imm : $is_xori
                                        ? $src1_value ^ $imm : $is_andi
                                        ? $src1_value & $imm : $is_slli
                                        ? $src1_value << $imm : $is_srli
                                        ? $src1_value >> $imm : $is_and
                                        ? $src1_value & $src2_value : $is_or
                                        ? $src1_value | $src2_value : $is_xor
                                        ? $src1_value ^ $src2_value : $is_sll
                                        ? $src1_value << $src2_value[4:0] : $is_srl
                                        ? $src1_value >> $src2_value[4:0] : $is_sltu
                                        ? $src1_value < $src2_value : $is_sltiu
                                        ? $src1_value < $imm : $lui
                                        ? {$imm[31:12] , 12'b0} : $is_auipc
                                        ? $pc + $imm : $is_jal
                                        ? $pc + 4 : $is_jal
                                        ? $pc + 4 : $is_jalr
                                        :32'bx;*/
            
               //$rf_rd_data1 = $rf_wr_en ? $result : 32'bz;
               $rf_wr_en = $rd_valid ? $rd[$rf_wr_index[4:0]]: $rf_wr_data[31:0];
            
               $taken_br = $is_beq ? ($src1_value == $src2_value) :
                        $is_bne ? ($src1_value != $src2_value) :
                        $is_blt ? ($src1_value < $src2_value) ^ ($src1_value[31] != $src2_value[31]) :
                        $is_bge ? ($src1_value >= $src2_value) ^ ($src1_value[31] != $src2_value[31]) :
                        $is_bltu ? ($src1_value < $src2_value) :
                        $is_bgeu ? ($src1_value >= $src2_value) : 1'b0;
                        
               $br_tgt_pc = $pc + $imm;
               //$m_pc[31:0] = $taken_br ? >>1$br_tgt_pc : >>1$pc;
            
            
            
               //$pc[31:0] = >>1$reset ? 32'b0 : $br_tgt_pc ? >>1$br_tgt_pc : >>1$inc_pc;
               //$inc_pc[31:0] = $pc + 32'd4;
            
               *passed = |cpu/xreg[10]>>5$value == (1+2+3+4+5+6+7+8+9);
            
               $valid_taken_br = $valid && $taken_br;
               $m_pc[31:0] = >>3$valid_taken_br ? >>3$br_tgt_pc : >>3$inc_pc;
            
            
