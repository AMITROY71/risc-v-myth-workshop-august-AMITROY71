$rf_rd_data1 = $rf_rd_en1 ? $rs1 : 32'bz;
            $rf_rd_data2 = $rf_rd_en2 ? $rs2 : 32'bz;
            $rf_rd_en1 = $reset ? 32'b0 : $rf_rd_index1[4:0]; 
