$br_tgt_pc = $pc + $imm;
            $m_pc[31:0] = $br_tgt_pc ? >>1$br_tgt_pc : >>1$pc;
            
