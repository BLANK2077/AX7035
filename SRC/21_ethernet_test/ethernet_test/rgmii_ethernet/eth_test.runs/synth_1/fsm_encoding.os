
 add_fsm_encoding \
       {miim.state} \
       { }  \
       {{0000 0000} {0001 0001} {0010 0010} {0011 0011} {0100 0100} {0101 0101} {0110 0110} {0111 0111} {1000 1000} {1111 1001} }

 add_fsm_encoding \
       {ip_tx.state} \
       { }  \
       {{0000000 111} {0000001 000} {0000010 001} {0000100 010} {0001000 011} {0010000 100} {0100000 101} {1000000 110} }

 add_fsm_encoding \
       {icmp_reply.state} \
       { }  \
       {{000000000000 1010} {000000000001 0000} {000000000010 0001} {000000000100 0100} {000000001000 0011} {000000010000 0010} {000000100000 0101} {000010000000 0111} {000100000000 1000} {001000000000 1001} {010000000000 0110} }