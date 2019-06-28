



    print_as_char:

        # dirigo su stdout
		li	a0, 0
        add a1,a1,s3
        li	a2, 1
        #codice per write
        li	a7, 64
        #stampo
		ecall
        jr ra


    print_as_binary:
        
        # dirigo su stdout
		li	a0, 0
        
        add a1,a1,s3
        li	a2, 1
        #codice per write
        li	a7, 64
        #stampo
		ecall
        jr ra


    print_as_decimal:

        # dirigo su stdout
		li	a0, 0
        
        add a1,a1,s3
        li	a2, 1
        #codice per write
        li	a7, 64
        #stampo
		ecall
        jr ra


