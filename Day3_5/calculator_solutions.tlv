\TLV
   |calc
      @1
         $reset = *reset;
         $valid = $reset ? 32'b0 : (>>1$valid + 1 );
         $rst[31:0] = ($valid | $reset);
      ?$valid
         @1   
            // YOUR CODE HERE
            // ...
            $val1[31:0] = >>2$out;
            $val2[31:0] = $rand2[3:0];
            $out[31:0] = $reset ? 32'b0 : $op[0] ? $val1[31:0]  + $val2[31:0] 
                                             : $op[1] ? $val1[31:0] - $vel2[31:0]
                                                     :$op[2] ? $val1[31:0] * $val2[31:0]
                                                              : $op[3] ? $val1[31:0] / $val2[31:0]
                                                                        : >>2$mem[31:0];
            $mem[31:0] = $reset ? 32'b0 : $op[0] ? >>2$mem[31:0] : >>2$out;                                                            
         
            
