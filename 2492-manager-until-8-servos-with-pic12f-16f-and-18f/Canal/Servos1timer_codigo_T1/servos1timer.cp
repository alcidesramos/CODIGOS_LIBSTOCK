#line 1 "D:/Mikroelectronica/librerias/ARZ/C/2017/MIkroc/servos_libreria/Servos 1 Timer/Servos1timer_codigo_T1/servos1timer.c"
#line 1 "d:/mikroelectronica/librerias/arz/c/2017/mikroc/servos_libreria/servos 1 timer/servos1timer_codigo_t1/servos_t1.h"
extern sfr sbit servo1;
extern sfr sbit servo2;
extern sfr sbit servo3;
extern sfr sbit servo4;
extern sfr sbit servo5;
extern sfr sbit servo6;
extern sfr sbit servo7;
extern sfr sbit servo8;

extern sfr sbit servo1_direction;
extern sfr sbit servo2_direction;
extern sfr sbit servo3_direction;
extern sfr sbit servo4_direction;
extern sfr sbit servo5_direction;
extern sfr sbit servo6_direction;
extern sfr sbit servo7_direction;
extern sfr sbit servo8_direction;
#line 29 "d:/mikroelectronica/librerias/arz/c/2017/mikroc/servos_libreria/servos 1 timer/servos1timer_codigo_t1/servos_t1.h"
void init_servos(float pwm_min,float pwm_min);
void servos_interrupcion();
void servo_valor(char servo_num,float servo_ang);
#line 4 "D:/Mikroelectronica/librerias/ARZ/C/2017/MIkroc/servos_libreria/Servos 1 Timer/Servos1timer_codigo_T1/servos1timer.c"
sbit servo1 at portb.b0;
sbit servo2 at portb.b1;
sbit servo3 at portb.b2;
sbit servo4 at portb.b3;
sbit servo5 at portb.b4;
sbit servo6 at portb.b5;
sbit servo7 at portc.b0;
sbit servo8 at portc.b1;

sbit servo1_direction at trisb.b0;
sbit servo2_direction at trisb.b1;
sbit servo3_direction at trisb.b2;
sbit servo4_direction at trisb.b3;
sbit servo5_direction at trisb.b4;
sbit servo6_direction at trisb.b5;
sbit servo7_direction at trisc.b0;
sbit servo8_direction at trisc.b1;



void TImer0() iv 0x0004 ics ICS_AUTO
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
