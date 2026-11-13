#line 1 "C:/Users/Alcides Ramos/Desktop/Software uart/CLASE/mikroc/soft_uart1.c"
#line 1 "c:/users/alcides ramos/desktop/software uart/clase/mikroc/software_uart.h"




void SoftWareUart_Init();
void Software_UART_Write(unsigned char Data);
void Software_UART_Write_Text(char* Text);
void Software_UART_Write_Text_Const(const char* Text);
unsigned char Software_UART_Read ();
void Software_UART_Read_Text(char* Buffer, char StopChar,unsigned int tama);
#line 5 "C:/Users/Alcides Ramos/Desktop/Software uart/CLASE/mikroc/soft_uart1.c"
sbit SoftWare_Uart_Tx at gpio.b0;
sbit SoftWare_Uart_Rx at gpio.b1;
sbit SoftWare_Uart_Tx_Direction at trisio.b0;
sbit SoftWare_Uart_Rx_Direction at trisio.b1;


 char contador=0;
 unsigned char dato;
 char texto[10];

void main()
{
 CMCON = 7;

 SoftWareUart_Init();

 dato=Software_UART_Read();

 Software_UART_Write_Text_Const("INICIANDO");



 while (1)
 {

 Software_UART_Read_Text(texto,'*',10);
 Software_UART_Write_text(texto);
 Software_UART_Write_Text("\r\n\r\n") ;


 dato=Software_UART_Read();
 Software_UART_Write_Text_Const("Mandaste=");
 Software_UART_Write(dato);

 Software_UART_Write_Text_Const("\r\n\r\n") ;


 Software_UART_Write_Text_Const("Contador=");
 wordtostr(contador,texto);
 Software_UART_Write_text(texto);

 Software_UART_Write_Text_Const("\r\n\r\n") ;
 contador++;
 Delay_ms(20);


 }


}
