#include "Config_Interrupcion.h"
#include "Config_timers.h"




void main() 
{

    //Configuración de operacion.
//CONFIGURA VELOCIDAD DE OPERACION    A 80 MEGAHERT CON CRISTAL DE 4 MEGA

//DEJAMOS N1 Y N2  EN 2

//VELOCIDAD= 4M*M/(N1*N2)= 4M*80/4=80M
  CLKDIVbits.PLLPRE = 0;      // N1 = 2
  CLKDIVbits.PLLPOST = 0;     // N2 = 2
   PLLFBD=78; // selecciona  M=80;  siempre lo deseado menos 2;

   deshabilita();

  AD1PCFGL=0xffff;// todo digital
  //puertos como salida
 TRISB=0x0;
 LATB=0;
 
 Unlock_IOLOCK();
 PPS_Mapping(0,_OUTPUT,_U1TX);

 UART1_Init(9600);
 Lock_IOLOCK();

 UART1_Write_Text("INCICIANDO\r\n");
  
    confi_timer_1();
    confi_timer_32();
  
   habilita();
  while (1)
  {
    LATB13_bit=!LATB13_bit;
    Delay_ms(200);
    UART1_Write_Text("Procesando\r\n");


  }

}