 unsigned int  codigo;
 float voltaje;
 float temperatura;
 
 char texto[20];

void Uart1_write_text_const(const char *info)
{
 while(*info) UART1_Write(*info++);
}


void main() 
{
 //adcon1=0b0100;// 3 analogos en el 16f87x

 adcon1=0b1101;// 2 analogos en el 18f25x

 // entradas analogas
 TRISA0_bit=1;
 TRISA1_bit=1;
 
 
 TRISC6_bit=0;// saluida tx
 TRISC7_bit=1; // entrada rx
 UART1_Init(9600);
 Uart1_write_text_const("INICIANDO\r\n");
 
 while (1)
 {
   codigo=ADC_Read(0);
   voltaje=codigo*5.0/1023.0;
/*floattostr_(voltaje,texto,2);
   Uart1_write_text_const("Voltaje=");
   UART1_Write_Text(texto);
   Uart1_write_text_const(" V\r\n");*/
   
   sprintf(texto,"Voltaje=%.2f V\r\n",voltaje);
   UART1_Write_Text(texto);


   
   
   
      codigo=ADC_Read(1);
   temperatura=codigo*500.0/1023.0;
   sprintf(texto,"Temperatura=%.1f \r\n",temperatura);
   UART1_Write_Text(texto);
   
   
   

   
   
   
 
 
 Delay_ms(800);
 
 }
 
 

}