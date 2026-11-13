#include "RC522.h"


#define led1 LATB7_bit
#define led2 LATB6_bit
#define led3 LATB5_bit
#define led4 LATB4_bit

//conección de modulo RFID   usando SPI pot software

sbit MFRC522_CS at LATA0_bit;  // SDA    SS
sbit MFRC522_Rst at LATA1_bit;   // RST
sbit SoftSPI_SDO at LATA2_bit;      //MOSI
sbit SoftSPI_CLK at LATA3_bit;        //SCK
sbit SoftSPI_SDI at RA4_Bit;           //MISO

sbit MFRC522_CS_Direction at TRISA0_Bit;
sbit MFRC522_Rst_Direction at TRISA1_Bit;
sbit SoftSPI_SDO_Direction at TRISA2_Bit;
sbit SoftSPI_CLK_Direction at TRISA3_Bit;
sbit SoftSPI_SDI_Direction at TRISA4_Bit;

char texto[10];
char UID[10];  // almacena el buffer del codigo de rfid


unsigned int TagType; // almacena el tipo de tag
char cont;   // para for

 //algoritmo has

unsigned long codigo_rfid;

#define FNV_PRIME 16777619
#define FNV_BASIS  2166136261



unsigned long  Hash_algoritmo ()
{
unsigned long  hash_acum = FNV_BASIS;

      for (cont=0;cont<=4;cont++)   // se guardan cinco datos del uid
          {
                 // Add value into the hash
                hash_acum = (hash_acum * FNV_PRIME) ^ UID[cont];
        }

        return (hash_acum);
}


void main()
{

// CONVERSOR ANALOGO

ADCON1=0B1111;// TODO DIGITAL

//EL COMPARADOR
CMCON=7; // APAGA EL COMPARADOR.

trisb=0;
trisc=0;

trisc.b7=1; //entrada rx
UART1_Init(9600);
RCEN_bit=1; //recepcion continua.


UART1_Write_Text( "Iniciando\r\n" );

LATB=0;

   Soft_SPI_Init();    //inicia modulo SPI

   MFRC522_Init();  //inicializa la tarjeta

  while (1)
  {
      if( MFRC522_isCard( &TagType ) )
       {
           if( MFRC522_ReadCardSerial( &UID ) )
         {
               // lee coigo unico
            codigo_rfid=Hash_algoritmo();
             LongIntToHex(codigo_rfid,texto);
             UART1_Write_Text("CODIGO_RFID=");
             UART1_Write_Text(texto);
              UART1_Write('\r');
               UART1_Write('\n');
               
                // procesa codigo
               
       if (codigo_rfid==0XE753E97B)
        {
         led1=~led1;
         UART1_Write_Text("TAG1\r\n");

         }
       else if (codigo_rfid==0xC34A02A9)
        {
         led2=~led2;
         UART1_Write_Text("TAG2\r\n");

         }

          else if (codigo_rfid==0XDE2ADFD3)
        {
         led3=~led3;
         UART1_Write_Text("TAG3\r\n");

         }

          else if (codigo_rfid==0XABED0215)
        {
         led4=~led4;
         UART1_Write_Text("TAG4\r\n");

         }

         codigo_rfid=0;

               
               Delay_ms(2000);

            } // lee el codigo de la tarjeta
       
       }//  detecta precencia RFID

  
  }


}