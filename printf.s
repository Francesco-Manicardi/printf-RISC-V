.global _start

.include "params.s"
    
.section .text

.include "format_functions.s"

_start:

    li s0, 0 #contiene indice byte
                #corrente da stampare
    li s1, 0  #conterrà il byte da stampare (da format)
    #s2 contiene il terminatore di stringa
    li s2, '\q'
    li s3, 0 #contiene l'indice dei parametri stampati finora

    loop:

		#
		# eventuali operazioni con il byte
		#
        

        la a1, format
        add a1, a1, s0


        lb	s1, (a1)
        beq s1, s2, exit

        li t0, '%'
        beq s1,t0, found_percentage

        normal_print:
		# dirigo su stdout
		li	a0, 0
        #lunghezza: 2 byte
        li	a2, 1
        #codice per write
        li	a7, 64
        #stampo
		ecall

        loop_logic:
		#
		# logica di controllo del for
		#
		addi s0,s0,1
		bne	s1, s2, loop
    
    
    
    
    exit:

		# dirigo su stdout
		li	a0, 0
        la a1, end_line
        li	a2, 1
        #codice per write
        li	a7, 64
        #stampo
		ecall
	
		li a7,93
		ecall


	found_percentage:
    
        #aggiungo uno all'indice dei caratteri processati perchè il % non si stampa
		addi s0,s0,1

        #carico il formattatore esempio: c, d,... (%d, %c...)
        la t0, format
        add t0, t0, s0
        #prendo il valore memorizzato nell'indirizzo
        lb	t0, (t0)

        #carico in a1 l'address dei byte in ogni caso, poi faccio uno switch case
        la a1, params

        #una sorta di switch case:
        li t1, 'c'
        bne t0, t1, case_label_1
        jal print_as_char

        case_label_1:
        li t1, 'd'
        bne t0, t1, case_label_2
        jal print_as_decimal

        case_label_2:
        li t1, 'b'
        bne t0, t1, case_label_3
        jal print_as_binary
        
        case_label_3:
        nop


        #aggiungo 1 al contatore dei parametri stampati
        addi s3,s3,1

        j loop_logic







