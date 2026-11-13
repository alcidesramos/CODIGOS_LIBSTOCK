#line 1 "C:/Users/Alcides Ramos/Desktop/Clase 27/serial.c"
 unsigned int codigo;
 float voltaje;
 float temperatura;

 char texto[20];

void Uart1_write_text_const(const char *info)
{
 while(*info) UART1_Write(*info++);
}


void main()
{


 adcon1=0b1101;


 TRISA0_bit=1;
 TRISA1_bit=1;


 TRISC6_bit=0;
 TRISC7_bit=1;
 UART1_Init(9600);
 Uart1_write_text_const("INICIANDO\r\n");

 while (1)
 {
 codigo=ADC_Read(0);
 voltaje=codigo*5.0/1023.0;
#line 38 "C:/Users/Alcides Ramos/Desktop/Clase 27/serial.c"
 sprintf(texto,"Voltaje=%.2f V\r\n",voltaje);
 UART1_Write_Text(texto);





 codigo=ADC_Read(1);
 temperatura=codigo*500.0/1023.0;
 sprintf(texto,"Temperatura=%.1f \r\n",temperatura);
 UART1_Write_Text(texto);









 Delay_ms(800);

 }



}
