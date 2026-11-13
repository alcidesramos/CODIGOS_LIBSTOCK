#line 1 "C:/Users/Alcides Ramos/Desktop/dspic/Curso/33fj128gp710/prueba_33fj128gp710.c"
void main()
 {









 CLKDIVbits.PLLPRE = 0;
 CLKDIVbits.PLLPOST = 0;
 PLLFBD=30;

 ADPCFG=0xffff;
 AD1PCFGH=0xffff;
 AD1PCFGL=0xffff;
 TRISB=0;
 TRISF3_bit=0;
 TRISF2_bit=1;

 UART1_Init(9600);




 while (1)
 {
 LATB=~LATB;
 Delay_ms(200);
 UART1_Write_Text("HOLA MUNDO\r\n");


 }




 }
