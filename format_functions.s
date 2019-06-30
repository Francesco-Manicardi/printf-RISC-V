



    print_as_char:
        #l'interpretazione come char è la più facile:
        # dirigo su stdout
		li	a0, 0
        li	a2, 1
        #codice per write
        li	a7, 64
        #stampo
		ecall
        jr ra


    print_as_binary:
        #per interpretare come binario prendo il valore che si trova all'indirizzo puntato da a1,
        #preparo lo spazio necessario nello stack, e per 8 volte (1 bit alla volta * 8 = 1 byte)
        #faccio l'and del valore con 1, in modo che rimanga l'ultima cifra binaria memorizzata.
        #Se il risultato dell'and è 1 vuol dire che il numero rimasto era dispari, altrimenti era pari.
        #dopodichè faccio uno shift a destra e ripeto il procedimento.
        #purtroppo questo procedimento ricava i bit da destra a sinistra quindi non posso stamparli direttamente
        #ma devo metterli nello stack e poi stamparli al contrario

        addi sp,sp, -8

        lb a1, (a1)  # mi serve il valore, non l'indirizzo del parametro
        addi t0, a1,0 #salvo in t0 a1 perchè a1 verrà modificato
        #ma mi serve tenere traccia del parametro orginale
        
        addi t3, sp, 8 #t3 terrà l'indirizzo in memoria da riempire con gli 1 o 0
        
        #Lunghezza del ciclo (8 bit = 1 byte)
        li t1,9

        binary_algo: #per fare la interpretazione in binario. verrà poi stampato successivamente

        addi a1, t0, 0 #ripristino a1 originale, eventualmente shiftato a destra di 1
        andi t2, a1, 1
        
        #Se il risultato dell'and con 1 è 1, devo stampare 1, altrimenti devo stampare 0.
        li a1, 48 #48 è il codice dello 0 in ascii. Se il risultato dell'and era 1, aggiungo uno in modo che diventi 49 cioè il codice dell'1 in ascii
        beq t2, x0, store_result
        
        addi a1, a1, 1

        store_result:
        sb a1, (t3)

        srli t0, t0, 1 #shift a destra
        addi t1,t1, -1 #logica di controllo del for e dell'indirizzo dove memorizzare i bit
        addi t3,t3,-1
        bne t1,x0,binary_algo

        #stampo il risultato memorizzato finora
        # dirigo su stdout
		li	a0, 0
        mv a1, sp
        addi a1,a1,1
        li	a2, 8 #lunghezza 1
        li	a7, 64 #codice write
        #stampo
		ecall

        #restore original sp and return
        addi sp,sp, 8
        jr ra


    print_as_decimal:
        #eventuale sviluppo futuro.
        # dirigo su stdout
		li	a0, 0
        
        li	a2, 1
        #codice per write
        li	a7, 64
        #stampo
		ecall
        jr ra


