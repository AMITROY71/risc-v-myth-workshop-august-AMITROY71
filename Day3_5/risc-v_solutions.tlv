$pc[31:0] = >>1$reset ? 32'b0 : >>1$inc_pc;
         $inc_pc[31:0] = $pc + 32'd4;
