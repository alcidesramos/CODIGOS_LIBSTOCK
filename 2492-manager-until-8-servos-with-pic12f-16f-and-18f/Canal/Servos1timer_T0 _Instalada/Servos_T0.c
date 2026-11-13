#include "servos_T0.h"


  unsigned char servos[8];


 const unsigned long cristal=Clock_kHz();
const char preescalador=64;
const float tmr0_reg=256.0 -((cristal*2.5)/(4.0*preescalador));
const float  tmr0_reg_ini=256.0 -((cristal*1.5)/(4.0*preescalador));
const char tmr0_1_5ms=tmr0_reg_ini;
const  char tmr0_2_5ms=tmr0_reg;
const unsigned int tmr0_periodo=256+tmr0_2_5ms;


float pwm_min;
float _m;
float servo_tempo;
enum servo_estado {hi_1,lo_1,hi_2,lo_2,hi_3,lo_3,hi_4,lo_4,hi_5,lo_5,hi_6,lo_6,hi_7,lo_7,hi_8,lo_8};
char estado_servos=hi_1;

void init_servos(float pwm_min_,float pwm_max)
{
 if (pwm_max>=2.5) pwm_max=2.49;

_m=(pwm_max-pwm_min_)/180.0;
pwm_min=pwm_min_;

PEIE_bit=1;
servo1_direction=0;
servo2_direction=0;
servo3_direction=0;
servo4_direction=0;
servo5_direction=0;
servo6_direction=0;
servo7_direction=0;
servo8_direction=0;

servo1=0;
servo2=0;
servo3=0;
servo4=0;
servo5=0;
servo6=0;
servo7=0;
servo8=0;

 //configuracion tmr0  a 64 preescalador, acepta cristales de 4 a 20 mhz
 T0CS_bit=0;
 PSA_bit=0;
OPTION_REG.ps2=1;
OPTION_REG.ps1=0;
OPTION_REG.ps0=1;
TMR0=250;//valor al azar para forzar la primera interrupcion //tmr0_2_5ms;
TMR0IF_bit=0;
TMR0IE_bit=1;

//angulo inicial de los servos  los coloco al ejemplo al azar
servos[0]=tmr0_1_5ms;
servos[1]=tmr0_1_5ms;
servos[2]=tmr0_1_5ms;
servos[3]=tmr0_1_5ms;
servos[4]=tmr0_1_5ms;
servos[5]=tmr0_1_5ms;
servos[6]=tmr0_1_5ms;
servos[7]=tmr0_1_5ms;

}

void servos_interrupcion()
{

  //miramos si la interrupcion es del timer cero
  if (TMR0IF_bit==1)
  {        switch (estado_servos)
        {
          //ciclo util servo 1
          case hi_1:
          {
           servo1=1;
           tmr0=servos[0];
           estado_servos=lo_1;
          }break;
          //fin ciclo util servo 1
          case lo_1:
          {
           servo1=0;
           tmr0=tmr0_periodo-servos[0];
           estado_servos=hi_2;
          }break;

          //ciclo util servo 2
          case hi_2:
          {
           servo2=1;
           tmr0=servos[1];
           estado_servos=lo_2;
          }break;
          //fin ciclo util servo 2
          case lo_2:
          {
           servo2=0;
           tmr0=tmr0_periodo-servos[1];
           estado_servos=hi_3;
          }break;
          //ciclo util servo 3
          case hi_3:
          {
           servo3=1;
           tmr0=servos[2];
           estado_servos=lo_3;
          }break;
          //fin ciclo util servo 3
          case lo_3:
          {
           servo3=0;
           tmr0=tmr0_periodo-servos[2];
           estado_servos=hi_4;
          }break;

          //ciclo util servo 4
          case hi_4:
          {
           servo4=1;
           tmr0=servos[3];
           estado_servos=lo_4;
          }break;
          //fin ciclo util servo 4
          case lo_4:
          {
           servo4=0;
           tmr0=tmr0_periodo-servos[3];
           estado_servos=hi_5;
          }break;

          //ciclo util servo 5
          case hi_5:
          {
           servo5=1;
           tmr0=servos[4];
           estado_servos=lo_5;
          }break;
          //fin ciclo util servo 5
          case lo_5:
          {
           servo5=0;
           tmr0=tmr0_periodo-servos[4];
           estado_servos=hi_6;
          }break;

          //ciclo util servo 6
          case hi_6:
          {
           servo6=1;
           tmr0=servos[5];
           estado_servos=lo_6;
          }break;
          //fin ciclo util servo 6
          case lo_6:
          {
           servo6=0;
           tmr0=tmr0_periodo-servos[5];
           estado_servos=hi_7;
          }break;

         //ciclo util servo 7
          case hi_7:
          {
           servo7=1;
           tmr0=servos[6];
           estado_servos=lo_7;
          }break;
          //fin ciclo util servo 7
          case lo_7:
          {
           servo7=0;
           tmr0=tmr0_periodo-servos[6];
           estado_servos=hi_8;
          }break;

           //ciclo util servo 8
          case hi_8:
          {
           servo8=1;
           tmr0=servos[7];
           estado_servos=lo_8;
          }break;
          //fin ciclo util servo 8
          case lo_8:
          {
           servo8=0;
           tmr0=tmr0_periodo-servos[7];
           estado_servos=hi_1;
          }break;




        }//del switch

 TMR0IF_bit=0;


 }

}


void servo_valor(char servo_num,float servo_ang)
{

servo_tempo=(servo_ang+90.0)*_m+pwm_min;
servo_tempo =256.0 -((cristal*servo_tempo)/(4.0*preescalador));
servos[servo_num-1]=(servo_tempo);

}