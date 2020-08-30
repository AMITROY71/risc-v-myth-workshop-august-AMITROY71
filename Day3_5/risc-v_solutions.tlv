$taken_br = $is_beq ? ($src1_value == $src2_value) :
                        $is_bne ? ($src1_value != $src2_value) :
                        $is_blt ? ($src1_value < $src2_value) ^ ($src1_value[31] != $src2_value[31]) :
                        $is_bge ? ($src1_value >= $src2_value) ^ ($src1_value[31] != $src2_value[31]) :
                        $is_bltu ? ($src1_value < $src2_value) :
                        $is_bgeu ? ($src1_value >= $src2_value) : 1'b0;
