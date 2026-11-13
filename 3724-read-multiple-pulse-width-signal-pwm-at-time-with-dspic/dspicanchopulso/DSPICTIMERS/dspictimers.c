#include "Config_Interrupcion.h"

//#include "Config_timers.h"
#include "Config_timer_frec.h"
unsigned int  pwm_in1,pwm_in2,pwm_in3;
float ancho1,ancho2,ancho3;
char texto[50];

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
 TRISA4_bit=1;// t1ck entrada
 LATB=0;
 
 Unlock_IOLOCK();
 PPS_Mapping(0,_OUTPUT,_U1TX);
 PPS_Mapping(3,_INPUT,_T2CK);
 PPS_Mapping(5,_INPUT,_T3CK);

 UART1_Init(9600);
 Lock_IOLOCK();

 UART1_Write_Text("INCICIANDO\r\n");
  
    //confi_timer_1();
    //confi_timer_32();
    config_timer_frec();
  
   habilita();
  while (1)
  {
    LATB13_bit=!LATB13_bit;
    Delay_ms(200);
    
     ancho1=(pwm_in1*prescalador)/40e6;   //  40 es la velocidad de operacion/2
     //para pasarlo a milisegundos
    ancho1=ancho1*1000.0;

    ancho2=(pwm_in2*prescalador)/40e6;   //  40 es la velocidad de operacion/2
     //para pasarlo a milisegundos
    ancho2=ancho2*1000.0;

    ancho3=(pwm_in3*prescalador)/40e6;   //  40 es la velocidad de operacion/2
     //para pasarlo a milisegundos
    ancho3=ancho3*1000.0;


   sprintf(texto,"Ciclo1=%.2fms    Ciclo2=%.2fms    Ciclo3=%.2fms\r\n", ancho1,ancho2,ancho3);
    UART1_Write_Text(texto);


  }

}