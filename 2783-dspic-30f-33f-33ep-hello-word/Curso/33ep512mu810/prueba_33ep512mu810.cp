#line 1 "C:/Users/Alcides Ramos/Desktop/dspic/Curso/33ep512mu810/prueba_33ep512mu810.c"

void main()
 {





 CLKDIVbits.PLLPRE = 0;
 CLKDIVbits.PLLPOST = 0;
 PLLFBD=68;


 ANSELA = 0x00;
 ANSELB = 0x00;
 ANSELC = 0x00;
 ANSELD = 0x00;
 ANSELE = 0x00;
 ANSELG = 0x00;
 TRISB=0;

 Unlock_IOLOCK();

 PPS_Mapping_NoLock(101, _OUTPUT, _U1TX);


 Lock_IOLOCK();
 UART1_Init(9600);

 LATB=0;

 while (1)
 {
 LATB=~LATB;
 Delay_ms(200);
 UART1_Write_Text("HOLA MUNDO\r\n");


 }



}
