#line 1 "C:/Users/Alcides Ramos/Desktop/prueb/prueba.c"
void main()
 {
ADCON1=0b1111;
TRISB=0;
LATB=0;
 while (1)

 {
 LATB=~LATB;
 Delay_ms(500);


 }

}
