#line 1 "C:/Users/Alcides Ramos/Desktop/dspic/Curso/30f4013/prueba_30f.c"
void main()
 {
 ADPCFG=0xffff;
 TRISB=0;
 TRISF3_bit=0;
 TRISF2_bit=1;
 UART1_Init(9600);



 while (1)

 {
 LATB=~LATB;
 Delay_ms(200);
 UART1_Write_Text ("HOLA MUNDO\r\n");

 }



}
