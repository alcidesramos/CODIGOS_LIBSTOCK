#include "Config_Interrupcion.h"
//#include "Config_timers.h"
//#include "Config_timer_frec.h"

  #include "config_Input_capture_33f_util.h"


 sbit disparo at LATA1_bit;


float ancho1,ancho2,ancho3,ancho4;
float dis1,dis2,dis3,dis4;
char texto[50];
unsigned int prescalador=64;


  unsigned int pulso_1,pulso_2,pulso_3,pulso_4;

  sbit in_pulso_1 at  RB2_bit;
  sbit in_pulso_2 at RB3_bit;
 sbit in_pulso_3 at RB4_bit;
 sbit in_pulso_4 at RB5_bit;


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
  TRISA=0;
 TRISB=0x0;
 LATB=0;
 TRISA4_bit=1;
 Unlock_IOLOCK();
 PPS_Mapping(0,_OUTPUT,_U1TX);
 PPS_Mapping(2,_INPUT,_IC1);
 PPS_Mapping(3,_INPUT,_IC2);
 PPS_Mapping(4,_INPUT,_IC7);
 PPS_Mapping(5,_INPUT,_IC8);

 UART1_Init(9600);
 Lock_IOLOCK();

 UART1_Write_Text("INCICIANDO\r\n");
  
   // confi_timer_1();
   // confi_timer_32();
     //config_timer_frec();
     config_inputcapure();

   habilita();
  while (1)
  {


   disparo=0;
  Delay_us(10);

  disparo=1;
    LATB13_bit=!LATB13_bit;
    Delay_ms(200);
    

    ancho1=((float)pulso_1*(float)prescalador)/40e6;   //  40 es la velocidad de operacion/2

     dis1=ancho1/58e-6;
  //  dis1=100.0*ancho1*340.0/2.0;   // el 100 es para pasar a centimetros
 
    ancho2=((float)pulso_2*(float)prescalador)/40e6;   //  40 es la velocidad de operacion/2
     //para pasarlo a milisegundos
//    dis2=100.0*ancho2*340.0/2.0;
        dis2=ancho2/58e-6;

    ancho3=((float)pulso_3*(float)prescalador)/40e6;   //  40 es la velocidad de operacion/2
     //para pasarlo a milisegundos
    // dis3=100.0*ancho3*340.0/2.0;
           dis3=ancho3/58e-6;

  
   ancho4=((float)pulso_4*(float)prescalador)/40e6;   //  40 es la velocidad de operacion/2
     //para pasarlo a milisegundos
    // dis3=100.0*ancho3*340.0/2.0;
           dis4=ancho4/58e-6;

  
  sprintf(texto,"dis1=%.1fcm    dis2=%.1fcm   dis3=%.1fcm  dis4=%.1fcm\r\n", dis1,dis2,dis3,dis4);
    UART1_Write_Text(texto);


  }

}