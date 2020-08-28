\m4_TLV_version 1d: tl-x.org
\SV
//Calculator labs solutions here
$val1[31:0] = $rand1[3:0];
         $val2[31:0] = $rand2[3:0];
         //$op[0] = $rand1[1:0];
         //$op[1] = $rand2[1:0];
         $sum[31:0] = $val1[31:0] + $val2[31:0];
         $diff[31:0] = $val1[31:0] - $val2[31:0];
         $prod[31:0] = $val1[31:0] * $val2[31:0];
         $qout[31:0] = $val1[31:0] / $val2[31:0];
         
         //assign $out[31:0] = $op[1] ? ($op[0] ? $qout[31:0] : $prod[31:0])
          //                          : ($op[0] ? $diff[31:0] : sum[31:0]);  
         
         $out[31:0] = $op[0] ? $sum[31:0] : $op[1]
                             ? $diff[31:0] : $op[2]
                            ? $prod[31:0] : $qout[31:0];
                       
