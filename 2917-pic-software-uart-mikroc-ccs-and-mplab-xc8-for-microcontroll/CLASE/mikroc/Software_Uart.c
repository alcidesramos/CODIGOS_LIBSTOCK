#include "Software_Uart.h"

 //Define pines de conexion del puerto serial tx y rx
extern sfr sbit SoftWare_Uart_Tx;
extern sfr sbit SoftWare_Uart_Rx;
extern sfr sbit SoftWare_Uart_Tx_Direction ;
extern sfr sbit SoftWare_Uart_Rx_Direction;




//Constantes necesarias para el calculo de los baudios y retardos el programa
const unsigned char cristal=Clock_MHz();//obtiene el reloj en mega
#define  DELAY_FOR (4*15/cristal)        //retardo extra en la escritura 15us   // depende del compilador usado
#define  DELAY_FOR_READ (4*12/cristal)   //Retardo extra en la Lectura    10us   // depende del compialdor



#define BITPERIOD ((1000000/BAUDIOS))//  Duración de  1 bit en microsegundos

#define BITPERIOD_FOR (BITPERIOD - DELAY_FOR)//  Retardo real a la Escritura
#define BITPERIOD_FOR_READ (BITPERIOD - DELAY_FOR_READ)//  Retardo real a la lectura
#define HALFBITPERIOD (BITPERIOD/2)// Duración medio bit
//Fin constastes del puerto serial


//funcion para inicializar el puerto serial
void  SoftWareUart_Init()
{
  SoftWare_Uart_Tx=1;
  SoftWare_Uart_Rx=1;
  SoftWare_Uart_Tx_Direction=0;
  SoftWare_Uart_Rx_Direction=1;
  SoftWare_Uart_Tx=1;
  delay_us(BITPERIOD);
}

 //Procedimiento del Envio de un Caracter por el puerto serial
void Software_UART_Write(unsigned char Data)
{
  unsigned char mask;
  SoftWare_Uart_Tx = 0;
  delay_us(BITPERIOD);

 //el for demora 14 ciclos de reloj
  for (mask=0x01;mask!=0;mask=mask<<1)
   {
    if(Data&mask) SoftWare_Uart_Tx = 1;
    else SoftWare_Uart_Tx = 0;
    delay_us(BITPERIOD_FOR);  //para mayor precision acorde al cristal   porque son 14 cilcos de reloj
  }
  SoftWare_Uart_Tx = 1;
  delay_us(BITPERIOD);
}

//Procedimiento Para envviar una cadeda por el puerto serial
void Software_UART_Write_Text(char* Text)
{
 while(*Text)Software_UART_Write(*Text++);
}

//Procedimiento Para envviar una cadeda por el puerto serial  costantes
void Software_UART_Write_Text_Const(const char* Text)
{
 while(*Text)Software_UART_Write(*Text++);
}



//Funcion para leer un Caracter del Puerto Serial   es bloqueante
unsigned char Software_UART_Read ()
{
  char mask;
  char Data=0;

 while(SoftWare_Uart_Rx==1); //sino llega el bit de star se queda a esperarlo
  delay_us(HALFBITPERIOD);
  for(mask=0x01;mask!=0;mask=mask<<1)
  {
    delay_us(BITPERIOD_FOR_READ);   //retardo teniendo en cuenta os del for y el if es de 4 ciclos de reloj
    if(SoftWare_Uart_Rx)Data=Data|mask;
  }
  Delay_us(BITPERIOD);
  return Data;
}


void Software_UART_Read_Text(char* Buffer, char StopChar,unsigned int tama)
{
    unsigned int con_t=0;
    
 while(*(Buffer-1)!=StopChar)   //mientras no llegue el caracter deseado
 {
  con_t++;   
   *Buffer++=Software_UART_Read();  //sigue almacenando en el buffer
   if (con_t>=tama) break; 
 }
 *--Buffer=0; //coloca un cero al final para que sea una cadena
}