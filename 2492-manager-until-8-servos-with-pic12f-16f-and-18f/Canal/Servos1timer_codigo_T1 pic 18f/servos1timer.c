#include "servos_T1.h"
#include "Servos_T1.c"

//PINES DE LOS SERVOS
sbit servo1 at latb.b0;
sbit servo2 at latb.b1;
sbit servo3 at latb.b2;
sbit servo4 at latb.b3;
sbit servo5 at latb.b4;
sbit servo6 at latb.b5;
sbit servo7 at latc.b0;
sbit servo8 at latc.b1;      //pueden ir a cualquier pin

sbit servo1_direction at trisb.b0;
sbit servo2_direction at trisb.b1;
sbit servo3_direction at trisb.b2;
sbit servo4_direction at trisb.b3;
sbit servo5_direction at trisb.b4;
sbit servo6_direction at trisb.b5;
sbit servo7_direction at trisc.b0;
sbit servo8_direction at trisc.b1;
 // fin de los pines de los servos


void INt_Servos() iv 0x0008 ics ICS_AUTO

 {
   servos_interrupcion();
}


void main()

{

 init_servos(0.5,2.5);
 GIE_bit=1;
 while (1)
 
 {
 
  servo_valor(1,0);
  servo_valor(2,90);



 }


}