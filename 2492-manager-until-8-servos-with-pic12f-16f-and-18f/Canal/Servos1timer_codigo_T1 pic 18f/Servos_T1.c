#include "servos_T1.h"



 unsigned int servos[8];
const unsigned long cristal=Clock_kHz();


const float tmr1_reg=65536.0 -((cristal*2.5)/(4.0));
const float  tmr1_reg_ini=65536.0 -((cristal*1.5)/(4.0));
const unsigned int  tmr1_1_5ms=tmr1_reg_ini;
const  unsigned int tmr1_2_5ms=tmr1_reg;
const unsigned long tmr1_periodo=65536+ tmr1_2_5ms;


float pwm_min;
float _m;
float servo_tempo;
enum servo_estado {hi_1,lo_1,hi_2,lo_2,hi_3,lo_3,hi_4,lo_4,hi_5,lo_5,hi_6,lo_6,hi_7,lo_7,hi_8,lo_8};
char estado_servos=hi_1;
 unsigned int int_tempo;


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


  //configuracion timer 1
T1CON=0;
 //PREESCALADOR 1
T1CKPS1_bit=0;
T1CKPS0_bit=0;

TMR1IF_bit=0;
TMR1L=256;  //valor al azar para forzar la primera interrucion
TMR1h=250;
TMR1IE_bit=1;  //habilita interrupcion timer1
TMR1ON_bit=1;

//angulo inicial de los servos  los coloco al ejemplo al azar
servos[0]=tmr1_1_5ms;
servos[1]=tmr1_1_5ms;
servos[2]=tmr1_1_5ms;
servos[3]=tmr1_1_5ms;
servos[4]=tmr1_1_5ms;
servos[5]=tmr1_1_5ms;
servos[6]=tmr1_1_5ms;
servos[7]=tmr1_1_5ms;

}

void servos_interrupcion()
{

    if (TMR1IF_bit==1)

  {        switch (estado_servos)
        {
          //ciclo util servo 1
          case hi_1:
          {
           servo1=1;
           int_tempo=servos[0];
           tmr1h=hi(int_tempo);
           tmr1l=lo(int_tempo);
         estado_servos=lo_1;
          }break;
          //fin ciclo util servo 1
          case lo_1:
          {
           servo1=0;
           int_tempo=tmr1_periodo-servos[0];
           tmr1h=hi(int_tempo);
           tmr1l=lo(int_tempo);
           estado_servos=hi_2;
          }break;

          //ciclo util servo 2
          case hi_2:
          {
           servo2=1;
           int_tempo=servos[1];
           tmr1h=hi(int_tempo);
           tmr1l=lo(int_tempo);
          estado_servos=lo_2;
          }break;
          //fin ciclo util servo 2
          case lo_2:
          {
           servo2=0;
          int_tempo=tmr1_periodo-servos[1];
           tmr1h=hi(int_tempo);
           tmr1l=lo(int_tempo);
           estado_servos=hi_3;
          }break;
          
          //ciclo util servo 3
          case hi_3:
          {
           servo3=1;
           int_tempo=servos[2];
           tmr1h=hi(int_tempo);
           tmr1l=lo(int_tempo);
           estado_servos=lo_3;
          }break;
          //fin ciclo util servo 3
          case lo_3:
          {
           servo3=0;
          int_tempo=tmr1_periodo-servos[2];
           tmr1h=hi(int_tempo);
           tmr1l=lo(int_tempo);

           estado_servos=hi_4;
          }break;

          //ciclo util servo 4
          case hi_4:
          {
           servo4=1;
           int_tempo=servos[3];
           tmr1h=hi(int_tempo);
           tmr1l=lo(int_tempo);
           estado_servos=lo_4;
          }break;
          //fin ciclo util servo 4
          case lo_4:
          {
           servo4=0;
           int_tempo=tmr1_periodo-servos[3];
           tmr1h=hi(int_tempo);
           tmr1l=lo(int_tempo);

           estado_servos=hi_5;
          }break;

          //ciclo util servo 5
          case hi_5:
          {
           servo5=1;
           int_tempo=servos[4];
           tmr1h=hi(int_tempo);
           tmr1l=lo(int_tempo);
           estado_servos=lo_5;
          }break;
          //fin ciclo util servo 5
          case lo_5:
          {
           servo5=0;
           int_tempo=tmr1_periodo-servos[4];
           tmr1h=hi(int_tempo);
           tmr1l=lo(int_tempo);
           estado_servos=hi_6;
          }break;

          //ciclo util servo 6
          case hi_6:
          {
           servo6=1;
           int_tempo=servos[5];
           tmr1h=hi(int_tempo);
           tmr1l=lo(int_tempo);
           estado_servos=lo_6;
          }break;
          //fin ciclo util servo 6
          case lo_6:
          {
           servo6=0;
           int_tempo=tmr1_periodo-servos[5];
           tmr1h=hi(int_tempo);
           tmr1l=lo(int_tempo);
           estado_servos=hi_7;
          }break;

         //ciclo util servo 7
          case hi_7:
          {
           servo7=1;
           int_tempo=servos[6];
           tmr1h=hi(int_tempo);
           tmr1l=lo(int_tempo);
           estado_servos=lo_7;
          }break;
          //fin ciclo util servo 7
          case lo_7:
          {
           servo7=0;
           int_tempo=tmr1_periodo-servos[6];
           tmr1h=hi(int_tempo);
           tmr1l=lo(int_tempo);
           estado_servos=hi_8;
          }break;

           //ciclo util servo 8
          case hi_8:
          {
           servo8=1;
           int_tempo=servos[7];
           tmr1h=hi(int_tempo);
           tmr1l=lo(int_tempo);
           estado_servos=lo_8;
          }break;
          //fin ciclo util servo 8
          case lo_8:
          {
           servo8=0;
           int_tempo=tmr1_periodo-servos[7];
           tmr1h=hi(int_tempo);
           tmr1l=lo(int_tempo);
           estado_servos=hi_1;
          }break;




        }//del switch

 TMR1IF_bit=0;


 }

}


void servo_valor(char servo_num,float servo_ang)
{

servo_tempo=(servo_ang+90.0)*_m+pwm_min;
servo_tempo =65536.0 -((cristal*servo_tempo)/4.0);
servos[servo_num-1]=(servo_tempo);

}