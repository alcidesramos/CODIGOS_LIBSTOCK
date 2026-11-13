#line 1 "C:/Users/Alcides Ramos/Desktop/RFID2019/Clase/rfid.c"
#line 1 "c:/users/alcides ramos/desktop/rfid2019/clase/rc522.h"
extern sfr sbit MFRC522_CS;
extern sfr sbit MFRC522_Rst;
extern sfr sbit MFRC522_CS_Direction;
extern sfr sbit MFRC522_Rst_Direction;
#line 102 "c:/users/alcides ramos/desktop/rfid2019/clase/rc522.h"
static void MFRC522_Wr( char addr, char value )
{
 MFRC522_CS = 0;
 Soft_SPI_Write( ( addr << 1 ) & 0x7E );
 Soft_SPI_Write( value );
 MFRC522_CS = 1;
}
static char MFRC522_Rd( char addr )
{
char value;
 MFRC522_CS = 0;
 Soft_SPI_Write( (( addr << 1 ) & 0x7E) | 0x80 );
 value = Soft_SPI_Read( 0x00 );
 MFRC522_CS = 1;
 return value;
}
static void MFRC522_Clear_Bit( char addr, char mask )
{
 MFRC522_Wr( addr, MFRC522_Rd( addr ) & (~mask) );
}
static void MFRC522_Set_Bit( char addr, char mask )
{
 MFRC522_Wr( addr, MFRC522_Rd( addr ) | mask );
}
void MFRC522_Reset()
{
 MFRC522_Wr(  0x01 ,  0x0F  );
}
void MFRC522_AntennaOn()
{
 MFRC522_Set_Bit(  0x14 , 0x03 );
}
void MFRC522_AntennaOff()
{
 MFRC522_Clear_Bit(  0x14 , 0x03 );
}
void MFRC522_Init()
{
 MFRC522_CS_Direction = 0;
 MFRC522_Rst_Direction = 0;
 MFRC522_CS = 1;
 MFRC522_Rst = 1;

 MFRC522_Reset();

 MFRC522_Wr(  0x2A , 0x8D );
 MFRC522_Wr(  0x2B , 0x3E );
 MFRC522_Wr(  0x2D , 30 );
 MFRC522_Wr(  0x2C , 0 );

 MFRC522_Wr(  0x15 , 0x40 );
 MFRC522_Wr(  0x11 , 0x3D );




 MFRC522_AntennaOn();
}
char MFRC522_ToCard( char command, char *sendData, char sendLen, char *backData, unsigned *backLen )
{
 char _status =  2 ;
 char irqEn = 0x00;
 char waitIRq = 0x00;
 char lastBits;
 char n;
 unsigned i;

 switch (command)
 {
 case  0x0E :
 {
 irqEn = 0x12;
 waitIRq = 0x10;
 break;
 }
 case  0x0C :
 {
 irqEn = 0x77;
 waitIRq = 0x30;
 break;
 }
 default:
 break;
 }
 MFRC522_Wr(  0x02 , irqEn | 0x80 );
 MFRC522_Clear_Bit(  0x04 , 0x80 );
 MFRC522_Set_Bit(  0x0A , 0x80 );
 MFRC522_Wr(  0x01 ,  0x00  );




 for ( i=0; i < sendLen; i++ )
 {
 MFRC522_Wr(  0x09 , sendData[i] );
 }

 MFRC522_Wr(  0x01 , command );
 if (command ==  0x0C  )
 {
 MFRC522_Set_Bit(  0x0D , 0x80 );
 }


 i = 0xFFFF;
 do
 {


 n = MFRC522_Rd(  0x04  );
 i--;
 }
 while ( i && !(n & 0x01) && !( n & waitIRq ) );
 MFRC522_Clear_Bit(  0x0D , 0x80 );
 if (i != 0)
 {
 if( !( MFRC522_Rd(  0x06  ) & 0x1B ) )
 {
 _status =  0 ;
 if ( n & irqEn & 0x01 )
 {
 _status =  1 ;
 }
 if ( command ==  0x0C  )
 {
 n = MFRC522_Rd(  0x0A  );
 lastBits = MFRC522_Rd(  0x0C  ) & 0x07;
 if (lastBits)
 {
 *backLen = (n-1) * 8 + lastBits;
 }
 else
 {
 *backLen = n * 8;
 }
 if (n == 0)
 {
 n = 1;
 }
 if (n > 16)
 {
 n = 16;
 }

 for (i=0; i < n; i++)
 {
 backData[i] = MFRC522_Rd(  0x09  );
 }

 backData[i] = 0;
 }
 }
 else
 {
 _status =  2 ;
 }
 }


 return _status;
}
char MFRC522_Request( char reqMode, char *TagType )
{
 char _status;
 unsigned backBits;
 MFRC522_Wr(  0x0D , 0x07 );
 TagType[0] = reqMode;
 _status = MFRC522_ToCard(  0x0C , TagType, 1, TagType, &backBits );
 if ( (_status !=  0 ) || (backBits != 0x10) )
 {
 _status =  2 ;
 }
 return _status;
}
void MFRC522_CRC( char *dataIn, char length, char *dataOut )
{
char i, n;
 MFRC522_Clear_Bit(  0x05 , 0x04 );
 MFRC522_Set_Bit(  0x0A , 0x80 );


 for ( i = 0; i < length; i++ )
 {
 MFRC522_Wr(  0x09 , *dataIn++ );
 }

 MFRC522_Wr(  0x01 ,  0x03  );

 i = 0xFF;

 do
 {
 n = MFRC522_Rd(  0x05  );
 i--;
 }
 while( i && !(n & 0x04) );

 dataOut[0] = MFRC522_Rd(  0x22  );
 dataOut[1] = MFRC522_Rd(  0x21  );
}
char MFRC522_SelectTag( char *serNum )
{
 char i;
 char _status;
 char size;
 unsigned recvBits;
 char buffer[9];



 buffer[0] =  0x93 ;
 buffer[1] = 0x70;

 for ( i=2; i < 7; i++ )
 {
 buffer[i] = *serNum++;
 }

 MFRC522_CRC( buffer, 7, &buffer[7] );

 _status = MFRC522_ToCard(  0x0C , buffer, 9, buffer, &recvBits );
 if ( (_status ==  0 ) && (recvBits == 0x18) )
 {
 size = buffer[0];
 }
 else
 {
 size = 0;
 }
 return size;
}

void MFRC522_Halt()
{
 unsigned unLen;
 char buff[4];

 buff[0] =  0x50 ;
 buff[1] = 0;
 MFRC522_CRC( buff, 2, &buff[2] );
 MFRC522_Clear_Bit(  0x08 , 0x80 );
 MFRC522_ToCard(  0x0C , buff, 4, buff, &unLen );
 MFRC522_Clear_Bit(  0x08 , 0x08 );
}
char MFRC522_Auth( char authMode, char BlockAddr, char *Sectorkey, char *serNum )
{
 char _status;
 unsigned recvBits;
 char i;
 char buff[12];


 buff[0] = authMode;
 buff[1] = BlockAddr;

 for ( i = 2; i < 8; i++ )
 {
 buff[i] = Sectorkey[i-2];
 }

 for ( i = 8; i < 12; i++ )
 {
 buff[i] = serNum[i-8];
 }

 _status = MFRC522_ToCard(  0x0E , buff, 12, buff, &recvBits );

 if ( ( _status !=  0  ) || !( MFRC522_Rd(  0x08  ) & 0x08 ) )
 {
 _status =  2 ;
 }

 return _status;
}
char MFRC522_Write( char blockAddr, char *writeData )
{
 char _status;
 unsigned recvBits;
 char i;
 char buff[18];
 buff[0] =  0xA0 ;
 buff[1] = blockAddr;

 MFRC522_CRC( buff, 2, &buff[2] );
 _status = MFRC522_ToCard(  0x0C , buff, 4, buff, &recvBits );
 if ( (_status !=  0 ) || (recvBits != 4) || ( (buff[0] & 0x0F) != 0x0A) )
 {
 _status =  2 ;
 }
 if (_status ==  0 )
 {
 for ( i = 0; i < 16; i++ )
 {
 buff[i] = writeData[i];
 }

 MFRC522_CRC( buff, 16, &buff[16] );
 _status = MFRC522_ToCard(  0x0C , buff, 18, buff, &recvBits );
 if ( (_status !=  0 ) || (recvBits != 4) || ( (buff[0] & 0x0F) != 0x0A ) )
 {
 _status =  2 ;
 }
 }
 return _status;
}
char MFRC522_Read( char blockAddr, char *recvData )
{
 char _status;
 unsigned unLen;
 recvData[0] =  0x30 ;
 recvData[1] = blockAddr;

 MFRC522_CRC( recvData, 2, &recvData[2] );

 _status = MFRC522_ToCard(  0x0C , recvData, 4, recvData, &unLen );
 if ( (_status !=  0 ) || (unLen != 0x90) )
 {
 _status =  2 ;
 }
 return _status;
}
char MFRC522_AntiColl( char *serNum )
{
 char _status;
 char i;
 char serNumCheck = 0;
 unsigned unLen;
 MFRC522_Wr(  0x0D , 0x00 );
 serNum[0] =  0x93 ;
 serNum[1] = 0x20;
 MFRC522_Clear_Bit(  0x08 , 0x08 );
 _status = MFRC522_ToCard(  0x0C , serNum, 2, serNum, &unLen );
 if (_status ==  0 )
 {
 for ( i=0; i < 4; i++ )
 {
 serNumCheck ^= serNum[i];
 }

 if ( serNumCheck != serNum[4] )
 {
 _status =  2 ;
 }
 }
 return _status;
}





char MFRC522_isCard( char *TagType )
{
 if (MFRC522_Request(  0x26 , TagType ) ==  0 )
 return 1;
 else
 return 0;
}
char MFRC522_ReadCardSerial( char *str )
{
char _status;
 _status = MFRC522_AntiColl( str );
 str[5] = 0;
 if (_status ==  0 )
 return 1;
 else
 return 0;
}
#line 11 "C:/Users/Alcides Ramos/Desktop/RFID2019/Clase/rfid.c"
sbit MFRC522_CS at LATA0_bit;
sbit MFRC522_Rst at LATA1_bit;
sbit SoftSPI_SDO at LATA2_bit;
sbit SoftSPI_CLK at LATA3_bit;
sbit SoftSPI_SDI at RA4_Bit;

sbit MFRC522_CS_Direction at TRISA0_Bit;
sbit MFRC522_Rst_Direction at TRISA1_Bit;
sbit SoftSPI_SDO_Direction at TRISA2_Bit;
sbit SoftSPI_CLK_Direction at TRISA3_Bit;
sbit SoftSPI_SDI_Direction at TRISA4_Bit;

char texto[10];
char UID[10];


unsigned int TagType;
char cont;



unsigned long codigo_rfid;






unsigned long Hash_algoritmo ()
{
unsigned long hash_acum =  2166136261 ;

 for (cont=0;cont<=4;cont++)
 {

 hash_acum = (hash_acum *  16777619 ) ^ UID[cont];
 }

 return (hash_acum);
}


void main()
{



ADCON1=0B1111;


CMCON=7;

trisb=0;
trisc=0;

trisc.b7=1;
UART1_Init(9600);
RCEN_bit=1;


UART1_Write_Text( "Iniciando\r\n" );

LATB=0;

 Soft_SPI_Init();

 MFRC522_Init();

 while (1)
 {
 if( MFRC522_isCard( &TagType ) )
 {
 if( MFRC522_ReadCardSerial( &UID ) )
 {

 codigo_rfid=Hash_algoritmo();
 LongIntToHex(codigo_rfid,texto);
 UART1_Write_Text("CODIGO_RFID=");
 UART1_Write_Text(texto);
 UART1_Write('\r');
 UART1_Write('\n');



 if (codigo_rfid==0XE753E97B)
 {
  LATB7_bit =~ LATB7_bit ;
 UART1_Write_Text("TAG1\r\n");

 }
 else if (codigo_rfid==0xC34A02A9)
 {
  LATB6_bit =~ LATB6_bit ;
 UART1_Write_Text("TAG2\r\n");

 }

 else if (codigo_rfid==0XDE2ADFD3)
 {
  LATB5_bit =~ LATB5_bit ;
 UART1_Write_Text("TAG3\r\n");

 }

 else if (codigo_rfid==0XABED0215)
 {
  LATB4_bit =~ LATB4_bit ;
 UART1_Write_Text("TAG4\r\n");

 }

 codigo_rfid=0;


 Delay_ms(2000);

 }

 }


 }


}
