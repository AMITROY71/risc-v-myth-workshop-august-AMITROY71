$dec_bits[10:0] = {$funct7[5],$funct3[2:0],$opcode[6:0]};
            $is_beq = $dec_bits ==? 11'bx_000_1100011;
            $is_bne = $dec_bits ==? 11'bx_001_1100011;
            $is_blt = $dec_bits ==? 11'bx_100_1100011;
            $is_bge = $dec_bits ==? 11'bx_101_1100011;
            $is_bltu = $dec_bits ==? 11'bx_110_1100011;
            $is_bgeu = $dec_bits ==? 11'bx_111_1100011;
            $is_addi = $dec_bits ==? 11'bx_000_0010011;
            
            `BOGUS_USE($is_beq $is_bne $is_blt $is_bge $is_bltu $is_bgeu $is_addi)
                  
