#line 1 "C:/Users/Alcides Ramos/Desktop/Software uart/CLASE/mikroc/Software_Uart.c"
#line 1 "c:/users/alcides ramos/desktop/software uart/clase/mikroc/software_uart.h"




void SoftWareUart_Init();
void Software_UART_Write(unsigned char Data);
void Software_UART_Write_Text(char* Text);
void Software_UART_Write_Text_Const(const char* Text);
unsigned char Software_UART_Read ();
void Software_UART_Read_Text(char* Buffer, char StopChar,unsigned int tama);
#line 4 "C:/Users/Alcides Ramos/Desktop/Software uart/CLASE/mikroc/Software_Uart.c"
extern sfr sbit SoftWare_Uart_Tx;
extern sfr sbit SoftWare_Uart_Rx;
extern sfr sbit SoftWare_Uart_Tx_Direction ;
extern sfr sbit SoftWare_Uart_Rx_Direction;





const unsigned char cristal=Clock_MHz();
#line 28 "C:/Users/Alcides Ramos/Desktop/Software uart/CLASE/mikroc/Software_Uart.c"
void SoftWareUart_Init()
{
 SoftWare_Uart_Tx=1;
 SoftWare_Uart_Rx=1;
 SoftWare_Uart_Tx_Direction=0;
 SoftWare_Uart_Rx_Direction=1;
 SoftWare_Uart_Tx=1;
 delay_us( ((1000000/ 115200 )) );
}


void Software_UART_Write(unsigned char Data)
{
 unsigned char mask;
 SoftWare_Uart_Tx = 0;
 delay_us( ((1000000/ 115200 )) );


 for (mask=0x01;mask!=0;mask=mask<<1)
 {
 if(Data&mask) SoftWare_Uart_Tx = 1;
 else SoftWare_Uart_Tx = 0;
 delay_us( ( ((1000000/ 115200 ))  - (4*15/cristal) ) );
 }
 SoftWare_Uart_Tx = 1;
 delay_us( ((1000000/ 115200 )) );
}


void Software_UART_Write_Text(char* Text)
{
 while(*Text)Software_UART_Write(*Text++);
}


void Software_UART_Write_Text_Const(const char* Text)
{
 while(*Text)Software_UART_Write(*Text++);
}




unsigned char Software_UART_Read ()
{
 char mask;
 char Data=0;

 while(SoftWare_Uart_Rx==1);
 delay_us( ( ((1000000/ 115200 )) /2) );
 for(mask=0x01;mask!=0;mask=mask<<1)
 {
 delay_us( ( ((1000000/ 115200 ))  - (4*12/cristal) ) );
 if(SoftWare_Uart_Rx)Data=Data|mask;
 }
 Delay_us( ((1000000/ 115200 )) );
 return Data;
}


void Software_UART_Read_Text(char* Buffer, char StopChar,unsigned int tama)
{
 unsigned int con_t=0;

 while(*(Buffer-1)!=StopChar)
 {
 con_t++;
 *Buffer++=Software_UART_Read();
 if (con_t>=tama) break;
 }
 *--Buffer=0;
}
