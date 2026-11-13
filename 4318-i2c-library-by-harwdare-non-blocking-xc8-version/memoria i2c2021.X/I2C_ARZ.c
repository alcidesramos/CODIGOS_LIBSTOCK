#include "I2C_ARZ.h"
#include "mcc_generated_files/mcc.h"

const unsigned long cristal=_XTAL_FREQ*1e6/4;//obtiene el reloj en mega



void I2C_CONFIG_master(unsigned long  i2c_velo)
{

  SSP1STAT =0;// limpia registro de estado
  SSP1CON1=0b1000; // i2c en modo master
   SSP1CON2 =0;
   SSP1ADD  = (cristal/i2c_velo)-1;    // carga valor del registro de velocidad
 SSPEN=1; // habilita el i2c

}

void I2C_WAIT()
{
 while (SSP1IF==0);
 SSP1IF=0;
}

void I2C_STARTBIT()
{
 SSP1IF=0;
  SEN=1;
  while(SEN==1);

}

void I2C_STOPBIT()
{
 SSP1IF=0;
PEN=1;
while(PEN==1);

}

void I2C_REPEATSTARTBIT()
{
 SSP1IF=0;
  RSEN=1;
  while (RSEN==1);
}

// manda reconocimient0
void I2C_ACKBIT()
{
// SSP1IF=0;
ACKDT=0;
ACKEN=1; // inicia secuencia de envio;
while(ACKEN==1); // espera que termine
 SSP1IF=0;

}

// no pide  reconocimient
void I2C_NOACKBIT()
{
// SSP1IF=0;
ACKDT=1;
ACKEN=1; // inicia secuencia de envio;
while(ACKEN==1); // espera que termine
 SSP1IF=0;

}

char  I2C_ACK_READBIT() //LEE BIT DE RECONOCIMIENTO
{
 return (ACKSTAT);
}

char I2C_WRITE_BYTE(unsigned char dato_i2c)
{
 SSP1IF=0;
SSP1BUF=dato_i2c;
I2C_WAIT();
if (ACKSTAT==0) return (1); else return (0);
}

unsigned char I2C_READ_BYTE(char ack)
 {
  unsigned char i2c_dato_read1;

     RCEN=1; // SE PROGRAMA COMO RECEPTOR
    // I2C_WAIT(); // espera la recpcoón.
     while (RCEN==1);  // espera que lleguen los datos
     SSP1IF=0;
     i2c_dato_read1=SSP1BUF; // lee el dato  // PROCEDE A LEER EL DATO
     if (ack==0) I2C_NOACKBIT();else I2C_ACKBIT();  // manda el bit asociado al reconocimiento
     return(i2c_dato_read1); // retorna el dato leido

  }
  
