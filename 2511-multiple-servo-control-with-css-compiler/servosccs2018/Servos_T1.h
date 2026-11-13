#include <16F877A.h>

int16 servos[8];

  int32 cristal=4000;  //colocar e valor del cristal en kiloHZ

  float tmr1_reg=65536.0 -((cristal*2.5)/(4.0));
  float  tmr1_reg_ini=65536.0 -((cristal*1.5)/(4.0));
  int16  tmr1_1_5ms=tmr1_reg_ini;
   int16 tmr1_2_5ms=tmr1_reg;
   int32 tmr1_periodo=65536+ tmr1_2_5ms;



float pwm_min;
float _m;
float servo_tempo;
enum servo_estado {hi_1,lo_1,hi_2,lo_2,hi_3,lo_3,hi_4,lo_4,hi_5,lo_5,hi_6,lo_6,hi_7,lo_7,hi_8,lo_8};
int8 estado_servos=hi_1;
 
 void init_servos(float pwm_min_,float pwm_max_)
{

 if (pwm_max_>=2.5) pwm_max_=2.49;

_m=(pwm_max_-pwm_min_)/180.0;
pwm_min=pwm_min_;


//COLOC LOS PINES EN CERO
output_bit(SERVO1,0);
output_bit(SERVO2,0);
output_bit(SERVO3,0);
output_bit(SERVO4,0);
output_bit(SERVO5,0);
output_bit(SERVO6,0);
output_bit(SERVO7,0);
output_bit(SERVO8,0);


// ya el comialdor los puso como salida

//configua el timer1


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


          switch (estado_servos)
        {
          //ciclo util servo 1
          case hi_1:
          {
           output_bit(SERVO1,1);
           //int_tempo1=servos[0];
           set_timer1(servos[0]);
           estado_servos=lo_1;
          }break;
          //fin ciclo util servo 1

          case lo_1:
          {
           output_bit(SERVO1,0);
           //int_tempo1_=(tmr1_periodo-servos[0]);
           set_timer1(tmr1_periodo-servos[0]);
           estado_servos=hi_2;
          }break;

          //ciclo util servo 2
          case hi_2:
          {
           output_bit(SERVO2,1);
           //int_tempo2=servos[1];
          set_timer1(servos[1]);
          estado_servos=lo_2;
          }break;
          //fin ciclo util servo 2
          
          case lo_2:
          {
           output_bit(SERVO2,0);
          //int_tempo2_=(tmr1_periodo-servos[1]);
           set_timer1(tmr1_periodo-servos[1]);           
           estado_servos=hi_3;
          }break;
          
          //ciclo util servo 3
          case hi_3:
          {
           output_bit(SERVO3,1);
          // int_tempo3=servos[2];
           set_timer1(servos[2]);
           estado_servos=lo_3;
          }break;
          //fin ciclo util servo 3
          case lo_3:
          {
           output_bit(SERVO3,0);
          //int_tempo3_=(tmr1_periodo-servos[2]);
           set_timer1(tmr1_periodo-servos[2]);
           estado_servos=hi_4;
          }break;

          //ciclo util servo 4
          case hi_4:
          {
           output_bit(SERVO4,1);
          // int_tempo4=servos[3];
           set_timer1(servos[3]);
           estado_servos=lo_4;
          }break;
          //fin ciclo util servo 4
          case lo_4:
          {
           output_bit(SERVO4,0);
          // int_tempo4_=(tmr1_periodo-servos[3]);
           set_timer1(tmr1_periodo-servos[3]);
           estado_servos=hi_5;
          }break;

          //ciclo util servo 5
          case hi_5:
          {
           output_bit(SERVO5,1);
           //int_tempo5=servos[4];
           set_timer1(servos[4]);           
           estado_servos=lo_5;
          }break;
          //fin ciclo util servo 5
          case lo_5:
          {
           output_bit(SERVO5,0);
         //  int_tempo5_=(tmr1_periodo-servos[4]);
           set_timer1(tmr1_periodo-servos[4]);
           estado_servos=hi_6;
          }break;

          //ciclo util servo 6
          case hi_6:
          {
           output_bit(SERVO6,1);
           //int_tempo6=servos[5];
           set_timer1(servos[5]);
           estado_servos=lo_6;
          }break;
          //fin ciclo util servo 6
          case lo_6:
          {
           output_bit(SERVO6,0);
           //int_tempo6_=(tmr1_periodo-servos[5]);
           set_timer1(tmr1_periodo-servos[5]);
           estado_servos=hi_7;
          }break;

         //ciclo util servo 7
          case hi_7:
          {
           output_bit(SERVO7,1);
           //int_tempo7=servos[6];
           set_timer1(servos[6]);
           estado_servos=lo_7;
          }break;
          //fin ciclo util servo 7
          case lo_7:
          {
           output_bit(SERVO7,0);
      //     int_tempo7_=(tmr1_periodo-servos[6]);
           set_timer1(tmr1_periodo-servos[6]);
           estado_servos=hi_8;
          }break;

           //ciclo util servo 8
          case hi_8:
          {
           output_bit(SERVO8,1);
          // int_tempo8=servos[7];
           set_timer1(servos[7]);
           estado_servos=lo_8;
          }break;
          //fin ciclo util servo 8
          case lo_8:
          {
           output_bit(SERVO8,0);
           //int_tempo8_=(tmr1_periodo-servos[7]);
           set_timer1(tmr1_periodo-servos[7]);
           estado_servos=hi_1;
          }break;

        }//del switch



 }
 
 
 void servo_valor(int8 servo_num,float servo_ang)
{

servo_tempo=(servo_ang+90.0)*_m+pwm_min;
servo_tempo =65536.0 -((cristal*servo_tempo)/4.0);
servos[servo_num-1]=(servo_tempo);

}
 
 
 
 





