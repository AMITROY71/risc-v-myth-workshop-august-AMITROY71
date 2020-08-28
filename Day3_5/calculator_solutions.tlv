\m4_TLV_version 1d: tl-x.org
\SV
//Calculator labs solutions here
\TLV
   $val2[31:0] = $rand2[3:0];
         $out[31:0] = $rst ? 32'b0 : $op[0] ? $val1[31:0]  + $val2[31:0] 
                                             : $op[1] ? $val1[31:0] - $vel2[31:0]
                                                     :$op[2] ? $val1[31:0] * $val2[31:0]
                                                              : $val1[31:0] / $val2[31:0];
         
         $cnt[31:0] = $reset ? 32'b0 : (>>1$cnt + 1 );
          
         $val1[31:0] = >>2$out; 
         $valid[31:0] = !$cnt;
         $rst[31:0] = !($valid | $reset);
