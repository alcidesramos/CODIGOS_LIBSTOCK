#line 1 "C:/Users/Alcides Ramos/Desktop/clase 29/Mikroc/_RX.c"










char dato_rx;


void m1derecha()
{
 RB0_bit =1;
 RB1_bit =0;
}

void m1izquierda()
{
 RB0_bit =0;
 RB1_bit =1;

}

void m1quieto()
{
 RB0_bit =0;
 RB1_bit =0;
}


void main()
{

TRISB=0 ;
TRISC=0;
TRISC7_bit=1;

UART1_Init(9600);
PWM1_Init(300);
PWM1_Set_Duty(127);
PWM1_Start();
 UART1_Write_Text("HOLA MUNDO");
 RCEN_bit=1;

 while (1)
 {
 while (UART1_Data_Ready() == 0) ;

 dato_rx = UART1_Read();

 switch (dato_rx)
 {
 case 'a':
  RC5_bit =1;
 break;

 case 'b':
  RC5_bit =0;
 break;

 case 'c':
  RC4_bit =1;
 break;

 case 'd':
  RC4_bit =0;
 break;

 case '0':
 m1derecha();
 break;


 case '1':
 m1izquierda();
 break;

 case '2':
 m1quieto();
 break;





 }



  RC0_bit =! RC0_bit ;
 Delay_ms(500);

 }




}
