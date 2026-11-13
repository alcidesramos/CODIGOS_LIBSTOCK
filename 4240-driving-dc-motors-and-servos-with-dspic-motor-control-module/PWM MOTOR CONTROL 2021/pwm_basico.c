#include "Librerias\Config_Interrupcion.h"
#include "Librerias\CONFIG_PWM_B.h"
#include "Librerias\CONFIG_PWM_F.h"


const float ser_min=1.0; // tiempo minimo en milisegundo de movimiento del servo
const float ser_max=2.0; // tiempo minimo en milisegundo de movimiento del servo
signed char cuenta;


float salida1, salida2; //salidas pwm


float map(float x_in, float x1_, float y1_, float x2_, float y2_)
{
float pendiente;
  pendiente=(y2_ - y1_) / (x2_ - x1_);
  pendiente=pendiente*(x_in- x1_);
  pendiente=pendiente+y1_;
  return( pendiente);
}


void servo1(float angulo)
{
  angulo=map(angulo,-90.0,ser_min,90.0,ser_max);
  OC1RS=angulo*(float)PR2/20.0;
}


void servo1_ecu(float angulo)
{
  OC1RS=3.4722*angulo + 937.5;
}

void pwm1(float ancho)
{
  OC1RS=ancho*(float)PR2/100.0;
}




void servo2(float angulo)
{
  angulo=map(angulo,-90.0,ser_min,90.0,ser_max);
  OC2RS=angulo*(float)PR2/20.0;
}


void servo2_ecu(float angulo)
{
  OC2RS=3.4722*angulo + 937.5;
}


void pwm2(float ancho)
{
  OC2RS=ancho*(float)PR2/100.0;
}

void servo3(float angulo)
{
  angulo=map(angulo,-90.0,ser_min,90.0,ser_max);
  PDC1=angulo*(float)P1TPER*2.0/20.0;
}


void servo3_ecu(float angulo)
{
  PDC1= 6.9444*angulo + 1874.0;
}

void pwm3(float ancho)
{
  PDC1=ancho*(float)P1TPER*2.0/100.0;
}

void servo4(float angulo)
{
  angulo=map(angulo,-90.0,ser_min,90.0,ser_max);
  PDC2=angulo*(float)P1TPER*2.0/20.0;
}


void servo4_ecu(float angulo)
{
  PDC2=6.9444*angulo + 1874.0;
}


void pwm4(float ancho)
{
  PDC2=ancho*(float)P1TPER*2.0/100.0;
}


void main()
 {
 CLKDIVbits.PLLPRE = 0;      // N1 = 2
  CLKDIVbits.PLLPOST = 0;     // N2 = 2
   PLLFBD=41; // selecciona  M=40;  siempre lo deseado menos 2;    CRISTAL INTERNO

//INICIALIZA PINES DIGITALES
   AD1PCFGL = 0xFFFF;

  //puertos como ENTRADAS
 TRISA=0XFFFF;
 TRISB=0XFFFF;

 Unlock_IOLOCK();
 // UART1
 PPS_Mapping(0,_OUTPUT,_U1TX);
 PPS_Mapping(1,_INPUT,_U1RX);

 //REMAPEO PWM
 PPS_Mapping(2,_OUTPUT,_OC1);
 PPS_Mapping(3,_OUTPUT,_OC2);



 Lock_IOLOCK();

 UART1_Init(9600);
 UART1_Write_Text("INICIANDO\r\n");
   pwm_init_basico();
   pwm_fast_init();
//   servo3_ecu(90);
  // pwm4(90); // porcentaje 90 %
   

   
   
   while (1)
   
   {
      PWM2(90);    //90 %
      PWM4(90);    //90 %


   for (cuenta=-90;cuenta<=90;cuenta+=5)
   {
  // servo1(cuenta);
    servo1_ecu(cuenta);
    servo3_ecu(cuenta);
   Delay_ms(50);
   }
      pwm2(10);  //porcentaje
      pwm4(10);  //porcentaje

       Delay_ms(1000);
   
   
   }


}