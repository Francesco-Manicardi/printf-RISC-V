



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
        
        addi sp,sp, -1

        # dirigo su stdout
		li	a0, 0
        lb a1, (a1)  # mi serve il valore, non l'indirizzo del parametro
        addi t0, a1,0 #salvo in t0 a1 perchè a1 verrà modificato
        #ma mi serve tenere traccia del parametro orginale

        #Lunghezza del ciclo (8 bit = 1 byte)
        li t1,8

        binary_algo: #per fare la stampa in binario

        addi a1, t0, 0 #ripristino a1 originale, eventualmente shiftato a destra di 1
        andi t2, a1, 1
        
        #Se il risultato dell'and con 1 è 1, devo stampare 1, altrimenti devo stampare 0.
        li a1, 48 #48 è il codice dello 0 in ascii. Se il risultato dell'and era 1, aggiungo uno in modo che diventi 49 cioè il codice dell'1 in ascii
        beq t2, x0, print_it
        
        addi a1, a1, 1

        print_it:
        sb a1, (sp)
        mv a1, sp
        li	a2, 1 #lunghezza 1
        li	a7, 64 #codice write
        #stampo
		ecall

        srli t0, t0, 1
        addi t1,t1, -1
        bne t1,x0,binary_algo

        addi sp,sp, 1
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


