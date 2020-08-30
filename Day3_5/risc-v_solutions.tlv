$rf_rd_data1 = $rf_wr_en ? $result : 32'bz;
            $rf_wr_en = $reset ? 32'b0 : $rf_wr_data[31:0]; 
