
#include "mcc_generated_files/mcc.h"
#include "Librerias/ff.h"
#include	<string.h>

//conexion del ds18b20
#define OW_PORT PORTAbits.RA0
#define OW_TRIS TRISA0
#include "Librerias/DS18B20.h"



//Software I2C connections
 #define Soft_I2C_Scl           PORTCbits.RC0
 #define Soft_I2C_Sda            PORTCbits.RC1
#define Soft_I2C_Scl_Direction  TRISC0
#define Soft_I2C_Sda_Direction  TRISC1
// End Software I2C connections

#include  "Librerias/ds1307_SH.h"
reloj  ds1307;   //crea una  estructura con el formato del reloj  llamada ds1307



FATFS sd_mem;	//nombre de la tarjeta
FIL fila;		//variabe para maneja un archivo, una por cada archivo
unsigned int nada;   //variable para apuntar al escribir constantes   	

float temperatura;
char texto[50];

void main(void)
{
    // Initialize the device
    SYSTEM_Initialize();
    //TODO DIGITAL
    ANSELA=0;
    ANSELB=0;
    ANSELC=0;

    // If using interrupts in PIC18 High/Low Priority Mode you need to enable the Global High and Low Interrupts
    // If using interrupts in PIC Mid-Range Compatibility Mode you need to enable the Global and Peripheral Interrupts
    // Use the following macros to:

    // Enable the Global Interrupts
    //INTERRUPT_GlobalInterruptEnable();

    // Disable the Global Interrupts
    //INTERRUPT_GlobalInterruptDisable();

    // Enable the Peripheral Interrupts
    //INTERRUPT_PeripheralInterruptEnable();

    // Disable the Peripheral Interrupts
    //INTERRUPT_PeripheralInterruptDisable();
    
   printf("INICIANDO\r\n");
    //espera que este la memoria
     
     while  (f_mount(&sd_mem, "0", 1) != FR_OK) ;
      printf("MEMORIA INICIADA\r\n");
    
    // abre o crea el archivo 
  	if (f_open(&fila, "0:datos.txt", FA_OPEN_ALWAYS | FA_READ | FA_WRITE) == FR_OK)
    {
          //Escribe las cabeceras
    printf("ARCHIVO CREADO\r\n");        
     f_write(&fila, "TEMPE\t", 6, &nada);	//Escribe Temperatura
     f_write(&fila, "HORA\t\t", 6, &nada);  //Escribe Hora
     f_write(&fila, "FECHA\r\n", 7, &nada); // Escribe Fecha
     // f_close(&fila); //cierra el archivo 
     }
      
     //lectura inical para evItar error en la primera lectura del ds18b20
      ds18b20_read();
 __delay_ms(1000); 
      
    while (1)
    {
        // Add your application code
         leertodo_s();//lee el reloj
        
            // Add your application code
       temperatura= ds18b20_read();
        memset(texto,0,50);  //limpia la trama
       sprintf(texto,"%06.3f\t",temperatura);
       printf(texto);
  
       if(PORTBbits.RB7==1)   f_write(&fila, &texto, strlen(texto), &nada); // Escribe Fecha
              
       
    
            //arma la trama  de hora  dando tab
        memset(texto,0,50);  //limpia la trama
        sprintf(texto,"%02u:%02u:%02u\t",(unsigned int)ds1307._hora,(unsigned int)ds1307._minuto,(unsigned int)ds1307._segundo);
      printf(texto);
      
      if(PORTBbits.RB7==1)   f_write(&fila, &texto, strlen(texto), &nada); // Escribe Fecha
      
      //arma trama de mes año y dia   poniendo enter
        memset(texto,0,50);  //limpia la trama
       sprintf(texto,"%02u/%02u/20%02u\r\n",(unsigned int)ds1307._fecha,(unsigned int)ds1307._mes,(unsigned int)ds1307._anho);
      
      if(PORTBbits.RB7==1)   f_write(&fila, &texto, strlen(texto), &nada); // Escribe Fecha
       
       //lo manda serial
      printf(texto);
     
       if(PORTBbits.RB7==0) 
       {
        f_close(&fila); //cierra el archivo 
        printf("CERRADA\r\n");
       }
       
       __delay_ms(1000);
    }
}
/**
 End of File
*/