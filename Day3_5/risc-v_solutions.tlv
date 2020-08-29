$is_i_instr = $instr[6:2] ==? 5’b0000x ||
                                    $instr[6:2] ==? 5’b001x0 ||
                                    $instr[6:2] ==? 5’b001x0 ||
                                    $instr[6:2] ==? 5’b100x0 ||
                                    $instr[6:2] ==? 5’b100x0;
