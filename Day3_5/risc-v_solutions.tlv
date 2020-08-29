@0
         $reset = *reset;
         //$inc_pc[31:0] =  $pc + 32'd4;
         //$pc[31:0] = $reset ? 32'b0 : >>1$inc_pc + 1; 
         
         //$inc_pc[31:0] =  >>1$pc + 32'4;
         //$pc[31:0] = >>1$reset ? 32'b0 : $inc_pc[31:0] ? $pc;
         
         $pc[M4_IMEM_INDEX_CNT+1:2] = >>1$reset ? 32'b0 : >>1$inc_pc + 32'd4;
         
         //$inc_pc[31:0] = $pc + 32'd4;
         //$imem_rd_data[31:0] = $imem[$imem_rd_addr];
         
         $instr[31:0] =  $imem_rd_en ? 32'b0 : >>1$imem_rd_data[$imem_rd_addr];
         
         $imem_rd_addr[M4_IMEM_INDEX_CNT-1:0] = $pc[M4_IMEM_INDEX_CNT+1:2];
         
         $imem_rd_en = $reset;
         //$imem_rd_data[31:0] = $imem_rd_en  ? 32'b0 : $instr[31:0];
         
