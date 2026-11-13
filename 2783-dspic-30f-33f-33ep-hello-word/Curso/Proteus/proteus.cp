#line 1 "C:/Users/Alcides Ramos/Desktop/dspic/Curso/Proteus/proteus.c"
void main()
 {







 CLKDIVbits.PLLPRE = 0;
 CLKDIVbits.PLLPOST = 0;
 PLLFBD=78;


 AD1PCFGL=0xffff;

 TRISB=0x0;
 latb=0;
 Unlock_IOLOCK();
 PPS_Mapping(12,_OUTPUT,_U1TX);

 UART1_Init(9600);

 Lock_IOLOCK();

 while (1)
 {
 LATB0_bit=~LATB0_bit;
 Delay_ms(200);

 UART1_Write_Text("HOLA MUNDO\r\n");


 }

}
