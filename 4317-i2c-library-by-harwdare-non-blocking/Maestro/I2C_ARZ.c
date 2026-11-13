#include "I2C_ARZ.h"
const unsigned long cristal=Clock_MHz()*1e6/4;//obtiene el reloj en mega



void I2C_CONFIG_master(unsigned long  i2c_velo)
{

  SSP1STAT =0;// limpia registro de estado
  SSP1CON1=0b1000; // i2c en modo master
   SSP1CON2 =0;
   SSP1ADD  = (cristal/i2c_velo)-1;    // carga valor del registro de velocidad
 SSPEN_bit=1; // habilita el i2c

}

void I2C_WAIT()
{
 while (SSP1IF_bit==0);
 SSP1IF_bit=0;
}

void I2C_STARTBIT()
{
 SSP1IF_bit=0;
  SEN_bit=1;
  while(SEN_bit==1);

}

void I2C_STOPBIT()
{
 SSP1IF_bit=0;
PEN_bit=1;
while(PEN_bit==1);

}

void I2C_REPEATSTARTBIT()
{
 SSP1IF_bit=0;
  RSEN_bit=1;
  while (RSEN_bit==1);
}

// manda reconocimient0
void I2C_ACKBIT()
{
// SSP1IF_bit=0;
ACKDT_bit=0;
ACKEN_bit=1; // inicia secuencia de envio;
while(ACKEN_bit==1); // espera que termine
 SSP1IF_bit=0;

}

// no pide  reconocimient
void I2C_NOACKBIT()
{
// SSP1IF_bit=0;
ACKDT_bit=1;
ACKEN_bit=1; // inicia secuencia de envio;
while(ACKEN_bit==1); // espera que termine
 SSP1IF_bit=0;

}

char  I2C_ACK_READBIT() //LEE BIT DE RECONOCIMIENTO
{
 return (ACKSTAT);
}

char I2C_WRITE_BYTE(unsigned char dato_i2c)
{
 SSP1IF_bit=0;
SSP1BUF=dato_i2c;
I2C_WAIT();
if (ACKSTAT_bit==0) return (1); else return (0);
}

unsigned char I2C_READ_BYTE(char ack_bit)
 {
  unsigned char i2c_dato_read1;

     RCEN_bit=1; // SE PROGRAMA COMO RECEPTOR
    // I2C_WAIT(); // espera la recpcoón.
     while (RCEN_bit==1);  // espera que lleguen los datos
     SSP1IF_bit=0;
     i2c_dato_read1=SSP1BUF; // lee el dato  // PROCEDE A LEER EL DATO
     if (ack_bit==0) I2C_NOACKBIT();else I2C_ACKBIT();  // manda el bit asociado al reconocimiento
     return(i2c_dato_read1); // retorna el dato leido

  }
  
