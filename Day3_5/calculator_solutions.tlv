\m4_TLV_version 1d: tl-x.org
\SV
//Calculator labs solutions here
\TLV
   |calc
      @1
         $reset = *reset;
         
         
         // YOUR CODE HERE
         // ...
         $val1[31:0] = >>1$out;
         $val2[31:0] = $rand2[3:0];
         $out[31:0] = $reset ? 32'b0 : $op[0] ? $val1[31:0]  + $val2[31:0] 
                                             : $op[1] ? $val1[31:0] - $vel2[31:0]
                                                     :$op[2] ? $val1[31:0] * $val2[31:0]
                                                              : $val1[31:0] / $val2[31:0];
         $cnt[31:0] = $reset ? 32'b0 : (>>1$cnt + 1 );
         
