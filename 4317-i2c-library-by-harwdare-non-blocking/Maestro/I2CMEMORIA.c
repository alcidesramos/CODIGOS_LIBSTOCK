#include "I2C_ARZ.h"

#define  dir_exclavo 0b10100000

#include "built_in.h "

sbit led at LATC5_bit;

unsigned char leido;

char TEXTO[20];

void memoria_i2c_write(unsigned int dir_mem, unsigned char dato_mem)
{
       I2C_STARTBIT();
      I2C_WRITE_BYTE(dir_exclavo & 0b11111110);   //para escribir
     //Dirección
      I2C_WRITE_BYTE(Hi(dir_mem));
     I2C_WRITE_BYTE(Lo(dir_mem));
     //dato
     I2C_WRITE_BYTE(dato_mem);
     I2C_STOPBIT();
     //retardo de escritura
     Delay_ms(5);

}

unsigned char memoria_i2c_read(unsigned int dir_mem)
{
   unsigned char i2c_dato_read;

      I2C_STARTBIT();
      I2C_WRITE_BYTE(dir_exclavo & 0b11111110);   //para escribir
     //Dirección
      I2C_WRITE_BYTE(Hi(dir_mem));
     I2C_WRITE_BYTE(Lo(dir_mem));
     //inica proceso de leer
     I2C_REPEATSTARTBIT();
    I2C_WRITE_BYTE(dir_exclavo | 0b00000001);    // para DECIRLE QUE VA A LEER
     i2c_dato_read=I2C_READ_BYTE(0);// lee  1= con reconocimiento 0 sin
     I2C_STOPBIT();
    return(i2c_dato_read);
}


void main()
{
//configuración Oscilador
OSCCON=0;
OSCTUNE=0; //frecuancia centrada
//oscilador interno
SCS1_bit=1;
SCS0_bit=0;

//OScialdor Interno a 8 MHZ
IRCF3_bit=1;
IRCF2_bit=1;
IRCF1_bit=1;
IRCF0_bit=0;
INTCON=0b01000000;
//Todo Digital
ansela=0;
anselc=0;

UART1_Init(9600);
//configuracon de los pines comos alida
TRISA=0;
TRISC=0;
 //pines i2c entardas
TRISc0_bit=1;
TRISC1_bit=1;

TRISA1_bit=1; // entrada rx

RXDTSEL_bit=1; // RX en RA1  sino RC5
TXCKSEL_bit=1; // tX en RA0  sino RC4
//RXDTSEL_bit=0; // RX en RC5  sino RA1
//TXCKSEL_bit=0; // tX en RC4  sino RA0

 UART1_Write_Text("INICIANDO\r\n");
 //I2C1_Init(100000);
 I2C_CONFIG_master(100000);
 Delay_ms(100);


  /*   I2C1_Start();
    I2C1_Wr(dir_exclavo & 0b11111110)  ;
    // direccion a escribir
     I2C1_Wr(0)  ;
     I2C1_Wr(0) ;
     //el datp
     I2C1_Wr(0xf)  ;
     I2C1_Stop();
    */
    
    /*      I2C_STARTBIT();
        if( I2C_WRITE_BYTE(dir_exclavo & 0b11111110)==0)  UART1_Write_Text("no hubo reconicimiento esclavo");
     //Dirección
      I2C_WRITE_BYTE(0);
     I2C_WRITE_BYTE(0);
     //dato
     I2C_WRITE_BYTE(0xf);
     I2C_STOPBIT();
      */
     memoria_i2c_write(0,10);

      memoria_i2c_write(1,11);

      memoria_i2c_write(2,12);

      memoria_i2c_write(3,13);

      memoria_i2c_write(4,14);
      
       leido=memoria_i2c_read(0);
     sprinti(texto,"leido1= %u  \r\n",(unsigned int)leido);
      UART1_Write_Text(texto);
      Delay_ms(10);

      leido=memoria_i2c_read(1);
      sprinti(texto,"leido2= %u  \r\n",(unsigned int)leido);
       UART1_Write_Text(texto);


      leido=memoria_i2c_read(2);
      sprinti(texto,"leido3= %u  \r\n",(unsigned int)leido);
      UART1_Write_Text(texto);

       leido=memoria_i2c_read(3);
      sprinti(texto,"leido4= %u  \r\n",(unsigned int)leido);
      UART1_Write_Text(texto);



 
   while (1)
   {
    led=!led;
    Delay_ms(200);
   
   }


}