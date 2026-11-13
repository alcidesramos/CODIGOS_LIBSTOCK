#line 1 "C:/Users/Alcides Ramos/Desktop/I2C 2021/Maestro/I2CMEMORIA.c"
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
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for pic/include/built_in.h "
#line 7 "C:/Users/Alcides Ramos/Desktop/I2C 2021/Maestro/I2CMEMORIA.c"
sbit led at LATC5_bit;

unsigned char leido;

char TEXTO[20];

void memoria_i2c_write(unsigned int dir_mem, unsigned char dato_mem)
{
 I2C_STARTBIT();
 I2C_WRITE_BYTE( 0b10100000  & 0b11111110);

 I2C_WRITE_BYTE( ((char *)&dir_mem)[1] );
 I2C_WRITE_BYTE( ((char *)&dir_mem)[0] );

 I2C_WRITE_BYTE(dato_mem);
 I2C_STOPBIT();

 Delay_ms(5);

}

unsigned char memoria_i2c_read(unsigned int dir_mem)
{
 unsigned char i2c_dato_read;

 I2C_STARTBIT();
 I2C_WRITE_BYTE( 0b10100000  & 0b11111110);

 I2C_WRITE_BYTE( ((char *)&dir_mem)[1] );
 I2C_WRITE_BYTE( ((char *)&dir_mem)[0] );

 I2C_REPEATSTARTBIT();
 I2C_WRITE_BYTE( 0b10100000  | 0b00000001);
 i2c_dato_read=I2C_READ_BYTE(0);
 I2C_STOPBIT();
 return(i2c_dato_read);
}


void main()
{

OSCCON=0;
OSCTUNE=0;

SCS1_bit=1;
SCS0_bit=0;


IRCF3_bit=1;
IRCF2_bit=1;
IRCF1_bit=1;
IRCF0_bit=0;
INTCON=0b01000000;

ansela=0;
anselc=0;

UART1_Init(9600);

TRISA=0;
TRISC=0;

TRISc0_bit=1;
TRISC1_bit=1;

TRISA1_bit=1;

RXDTSEL_bit=1;
TXCKSEL_bit=1;



 UART1_Write_Text("INICIANDO\r\n");

 I2C_CONFIG_master(100000);
 Delay_ms(100);
#line 105 "C:/Users/Alcides Ramos/Desktop/I2C 2021/Maestro/I2CMEMORIA.c"
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
