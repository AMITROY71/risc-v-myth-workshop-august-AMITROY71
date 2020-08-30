$imem_rd_en = $reset;
         //$instr[31:0] = $imem_rd_data[$imem_rd_addr];
         $instr[31:0] =  $imem_rd_en ? 32'b0 : >>1$imem_rd_data[$imem_rd_addr];
