
 add_fsm_encoding \
       {i2c_master_bit_ctrl.c_state} \
       { }  \
       {{000000000000000000 00000} {000000000000000001 00001} {000000000000000010 00010} {000000000000000100 00011} {000000000000001000 00100} {000000000000010000 00101} {000000000000100000 00110} {000000000001000000 00111} {000000000010000000 01000} {000000000100000000 01001} {000000001000000000 01110} {000000010000000000 01111} {000000100000000000 10000} {000001000000000000 10001} {000010000000000000 01010} {000100000000000000 01011} {001000000000000000 01100} {010000000000000000 01101} }

 add_fsm_encoding \
       {i2c_master_byte_ctrl.c_state} \
       { }  \
       {{00000 000} {00001 001} {00010 010} {00100 011} {01000 100} {10000 101} }

 add_fsm_encoding \
       {i2c_master_top.state} \
       { }  \
       {{0000 0000000000000001} {0001 0000000000000010} {0010 0000000000010000} {0011 0000000001000000} {0100 0000010000000000} {0101 0000000000001000} {0110 0000000000000100} {0111 0000100000000000} {1000 0010000000000000} {1001 0100000000000000} {1010 1000000000000000} {1011 0000000010000000} {1100 0000001000000000} {1101 0000000000100000} {1110 0001000000000000} {1111 0000000100000000} }

 add_fsm_encoding \
       {i2c_config.state} \
       { }  \
       {{000 00} {001 01} {010 10} {011 11} }

 add_fsm_encoding \
       {wav_read.state} \
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
