 
 #include "Software_Uart.h"

 //Define pines de conexion del puerto serial tx y rx
sbit SoftWare_Uart_Tx at gpio.b0;
sbit SoftWare_Uart_Rx at gpio.b1;
sbit SoftWare_Uart_Tx_Direction at trisio.b0;
sbit SoftWare_Uart_Rx_Direction at trisio.b1;


 char contador=0;
 unsigned char dato;
 char texto[10];

void main()
{
  CMCON = 7;   // desgsabilita el comparador
  
 SoftWareUart_Init();
 //Software_UART_Write('a');
     dato=Software_UART_Read(); //lee un Dato

 Software_UART_Write_Text_Const("INICIANDO");
   
   
   
     while (1)
     {
     
      Software_UART_Read_Text(texto,'*',10); //lee una cadeda hasta que llegue el  asterisco
       Software_UART_Write_text(texto);     //reenvia lo que recibido
       Software_UART_Write_Text("\r\n\r\n") ;


       dato=Software_UART_Read(); //lee un Dato
       Software_UART_Write_Text_Const("Mandaste=");
       Software_UART_Write(dato); //  lo reenvia

       Software_UART_Write_Text_Const("\r\n\r\n") ;


      Software_UART_Write_Text_Const("Contador=");
      wordtostr(contador,texto);
      Software_UART_Write_text(texto);

       Software_UART_Write_Text_Const("\r\n\r\n") ;
        contador++;
       Delay_ms(20);

     
     }


}