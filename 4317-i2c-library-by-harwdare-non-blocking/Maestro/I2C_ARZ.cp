#line 1 "C:/Users/Alcides Ramos/Desktop/I2C 2021/Maestro/I2C_ARZ.c"
#line 1 "c:/users/alcides ramos/desktop/i2c 2021/maestro/i2c_arz.h"


void I2C_CONFIG_master(unsigned long i2c_velo);
void I2C_WAIT();
void I2C_STARTBIT();
void I2C_STOPBIT();
void I2C_REPEATSTARTBIT();
void I2C_ACKBIT();
void I2C_NOACKBIT();
char I2C_ACK_READBIT();
char I2C_WRITE_BYTE(unsigned char dato_i2c);
unsigned char I2C_READ_BYTE(char ack_bit) ;
#line 2 "C:/Users/Alcides Ramos/Desktop/I2C 2021/Maestro/I2C_ARZ.c"
const unsigned long cristal=Clock_MHz()*1e6/4;



void I2C_CONFIG_master(unsigned long i2c_velo)
{

 SSP1STAT =0;
 SSP1CON1=0b1000;
 SSP1CON2 =0;
 SSP1ADD = (cristal/i2c_velo)-1;
 SSPEN_bit=1;

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


void I2C_ACKBIT()
{

ACKDT_bit=0;
ACKEN_bit=1;
while(ACKEN_bit==1);
 SSP1IF_bit=0;

}


void I2C_NOACKBIT()
{

ACKDT_bit=1;
ACKEN_bit=1;
while(ACKEN_bit==1);
 SSP1IF_bit=0;

}

char I2C_ACK_READBIT()
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

 RCEN_bit=1;

 while (RCEN_bit==1);
 SSP1IF_bit=0;
 i2c_dato_read1=SSP1BUF;
 if (ack_bit==0) I2C_NOACKBIT();else I2C_ACKBIT();
 return(i2c_dato_read1);

 }
