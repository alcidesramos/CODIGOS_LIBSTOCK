#include "Librerias\DS18B20.h"
#include "librerias\ds1307_SH.h"




float temperatura;
char texto[50];

 // MMC module connections
sbit Mmc_Chip_Select           at LATB4_bit;  // for writing to output pin always use latch (PIC18 family)
sbit Mmc_Chip_Select_Direction at TRISB4_bit;
// end MMC module connections


//Software I2C connections
sbit Soft_I2C_Scl           at RC0_BIT;
sbit Soft_I2C_Sda           at RC1_bit;
sbit Soft_I2C_Scl_Direction at TRISC0_bit;
sbit Soft_I2C_Sda_Direction at TRISC1_bit;
// End Software I2C connections

//declaracion de la estructura del reloj
reloj  ds1307;   //crea una  estructura con el formato del reloj  llamada ds1307


void reloj_carga_inicial()
{
ds1307._hora=9;
ds1307._minuto=10;
ds1307._segundo=0;
ds1307._fecha=11;
ds1307._mes=8;
ds1307._anho=18;
ds1307._dia=6;  //dia de la semana
guardatodo_s();
}




void main() 
{
//TODO DIGITAL
ANSELA=0;
ANSELB=0;
ANSELC=0;

//tofdo salida
TRISA=0;
TRISB=0;
TRISC=0;
 
 RBPU_bit=0; //HABILITA LAS PULL UP POR B
 TRISB7_bit=1; //ENTRADA PULSADOR

UART1_Init(9600);

TRISB0_bit=1; //SDI ENTRADA
TRISB3_bit=0; //SD0 SALIDA
TRISB1_bit=0; //SCK SALIDA

UART1_Write_Text("INICIANDO\r\n");



//hace dos lecturas no almacenables para ininiar el sensor
ds18b20_read(&porta,0);
Delay_ms(1000);
ds18b20_read(&porta,0);
Delay_ms(800);


//INICANDO LA MEMORIA

// Initialize SPI1 module a baja velidad
  SPI1_Init_Advanced(_SPI_MASTER_OSC_DIV64, _SPI_DATA_SAMPLE_MIDDLE, _SPI_CLK_IDLE_LOW, _SPI_LOW_2_HIGH);

  while (Mmc_Fat_Init()!=0) ;
  
  // reinitialize spi at higher speed
   SPI1_Init_Advanced(_SPI_MASTER_OSC_DIV4, _SPI_DATA_SAMPLE_MIDDLE, _SPI_CLK_IDLE_LOW, _SPI_LOW_2_HIGH);
   UART1_Write_Text("MEMORIA INICIADA\r\n");
     //si quiere nformatearla
 //  Mmc_Fat_QuickFormat("ARZ");

//busca el archivo UN ARCHIVO  si existe anexa datos y sino exiate lo crear
  Mmc_Fat_Assign("Datos.TXT",0xA0);
  Mmc_Fat_Write("TEMPE\t", 6);
  Mmc_Fat_Write("HORA\t\t", 6);
    Mmc_Fat_Write("FECHA\r\n", 7);
    
    reloj_init_s();
   //reloj_carga_inicial();




  while (1)
  {
  //lee la temperatura
     temperatura=ds18b20_read(&porta,0);
     memset(texto,0,50);  //limpia la trama
  //arma la trama dando tab
     sprintf(texto,"%06.3f\t",temperatura);
    //la guarda en la sd
    if(RB7_bit==1)   Mmc_Fat_Write(texto, strlen(texto));
     //la manda serial
     UART1_Write_Text(texto);
     
           //lee el leloj
          leertodo_s();
           //arma la trama  de hora  dando tab
        memset(texto,0,50);  //limpia la trama
        sprintf(texto,"%02u:%02u:%02u\t",(unsigned int)ds1307._hora,(unsigned int)ds1307._minuto,(unsigned int)ds1307._segundo);
      //lo manda  ala lcd
         if(RB7_bit==1)    Mmc_Fat_Write(texto, strlen(texto));
       //lo manda serial
        UART1_Write_Text(texto);
        //arma trama de mes año y dia   poniendo enter
        memset(texto,0,50);  //limpia la trama
       sprintf(texto,"%02u/%02u/20%02u\r\n",(unsigned int)ds1307._fecha,(unsigned int)ds1307._mes,(unsigned int)ds1307._anho);
      //lo manda  ala lcd
         if(RB7_bit==1)    Mmc_Fat_Write(texto, strlen(texto));
       //lo manda serial
        UART1_Write_Text(texto);
     if(RB7_bit==0) Mmc_Fat_Close();
     
       Delay_ms(2000);//retardo de adquisicion de datos

  }


}

