
 add_fsm_encoding \
       {bmp_read.state} \
       { }  \
       {{0000 000} {0001 001} {0010 010} {0011 011} {0100 100} }

 add_fsm_encoding \
       {sd_card_sec_read_write.state} \
       { }  \
       {{00000 0000} {00001 0001} {00010 0010} {00011 0011} {00100 0100} {00101 1000} {00110 1011} {00111 0111} {01000 1001} {01111 1010} {10000 1100} {10001 0110} {10010 0101} }

 add_fsm_encoding \
       {sd_card_cmd.state} \
       { }  \
       {{00000 00000} {00001 00010} {00010 00001} {00011 00011} {00100 00110} {00101 01000} {00110 00100} {00111 01010} {01000 01011} {01001 00101} {01010 01100} {01011 01101} {01100 01110} {01101 01111} {01110 10000} {01111 10001} {10000 00111} {10001 01001} }

 add_fsm_encoding \
       {spi_master.state} \
       { }  \
       {{000 000} {001 010} {010 001} {011 100} {100 011} {101 101} }

 add_fsm_encoding \
       {frame_fifo_write.state} \
       { }  \
       {{0000 000} {0001 001} {0010 010} {0011 011} {0100 100} {0101 101} }

 add_fsm_encoding \
       {frame_fifo_read.state} \
       { }  \
       {{0000 000} {0001 001} {0010 010} {0011 011} {0100 100} {0101 101} }

 add_fsm_encoding \
       {aq_axi_master.wr_state} \
       { }  \
       {{000 000} {001 001} {010 010} {011 011} {100 100} {101 101} {110 110} }

 add_fsm_encoding \
       {aq_axi_master.rd_state} \
       { }  \
       {{000 000} {001 001} {010 010} {011 011} {100 100} {101 101} }