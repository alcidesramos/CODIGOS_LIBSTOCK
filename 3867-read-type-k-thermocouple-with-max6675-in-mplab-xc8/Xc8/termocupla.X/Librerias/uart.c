
#include "uart.h"
// funciones serial

void Uart1_Init(const long int baudios)
{

unsigned int temp_;    

   TXSTA=0;  //LIMPIA REGISTRO DE TRANSMISION
   RCSTA=0;// LIMPIA REGISTRO DE RECEPCION
  BAUDCTL=0;//registro de contol d baudios
   
   TXEN=1; // HABILITA LA TRANSMISION
   
   SPEN=1; // HABILITA MODULO UART
   CREN=1; //HABILITA RECEPCION CONTINUA Y LIMPIA ERRORES DEL BUFFER
 
   BRG16=0; //trabaja a 8 bits
   BRGH=1;  //Baudios a alta velocidad

   
   

SPBRG = (_XTAL_FREQ / (baudios * 16))-1; 


 
}

void Uart1_Write(unsigned char txData)
{
    while(0 == PIR1bits.TXIF)   {}

    TXREG = txData;    // Write the data byte to the USART.
}

void Uart1_write_text(unsigned char *info)
{
 while(*info) Uart1_Write(*info++);
}

unsigned char Uart1_Read(void)
{
    while(!PIR1bits.RCIF)
    {
    }

    
    if(1 == RCSTAbits.OERR)
    {
        // EUSART error - restart

        RCSTAbits.CREN = 0; 
        RCSTAbits.CREN = 1; 
    }

    return RCREG;
}


void Uart1_Read_Text(char* Buffer, char StopChar,unsigned int tama)
{
    unsigned int con_t=0;
    
 while(*(Buffer-1)!=StopChar)   //mientras no llegue el caracter deseado
 {
  con_t++;   
   *Buffer++=Uart1_Read();  //sigue almacenando en el buffer
   if (con_t>=tama) break; 
 }
 *--Buffer=0; //coloca un cero al final para que sea una cadena
}
