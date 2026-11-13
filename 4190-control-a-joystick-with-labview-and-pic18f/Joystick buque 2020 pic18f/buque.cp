#line 1 "C:/Users/Alcides Ramos/Desktop/Joystick buque 2020 pic18f/buque.c"
#line 1 "c:/users/alcides ramos/desktop/joystick buque 2020 pic18f/librerias/servos_t1.h"
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
#line 29 "c:/users/alcides ramos/desktop/joystick buque 2020 pic18f/librerias/servos_t1.h"
void init_servos(float pwm_min,float pwm_min);
void servos_interrupcion();
void servo_valor(char servo_num,float servo_ang);
#line 1 "c:/users/alcides ramos/desktop/joystick buque 2020 pic18f/librerias/config_serial1.h"
void config_serial();
void interrupcion_serial() ;
#line 6 "C:/Users/Alcides Ramos/Desktop/Joystick buque 2020 pic18f/buque.c"
sbit servo1 at latb.b6;
sbit servo2 at latb.b7;
sbit servo3 at latb.b5;
sbit servo4 at latb.b5;
sbit servo5 at latb.b5;
sbit servo6 at latb.b5;
sbit servo7 at latc.b5;
sbit servo8 at latc.b5;

sbit servo1_direction at trisb.b6;
sbit servo2_direction at trisb.b7;
sbit servo3_direction at trisb.b5;
sbit servo4_direction at trisb.b5;
sbit servo5_direction at trisb.b5;
sbit servo6_direction at trisb.b5;
sbit servo7_direction at trisc.b5;
sbit servo8_direction at trisc.b5;


 sbit led_verde at RC0_bit;
 sbit led_rojo at RC1_bit;





 float serV1,serV2;

 char texto[50];


 extern unsigned char Trama_rx1[];
 extern char flag_rx1;
 unsigned char Captura_rx1[50];

 void interrupciones() iv 0x0008 ics ICS_AUTO
 {
 servos_interrupcion();
 interrupcion_serial();
 }


void procesa_rx1()
{

 strcpy(Captura_rx1, strtok(trama_rx1, "/"));
 strcpy(Captura_rx1, strtok(0, "/"));
 serv1=atof(Captura_rx1);

 strcpy(Captura_rx1, strtok(0, "/"));
 serv2=atof(Captura_rx1);

 strcpy(Captura_rx1, strtok(0, "/"));
 led_verde=atoi(Captura_rx1);

 strcpy(Captura_rx1, strtok(0, "/"));
 led_rojo=atoi(Captura_rx1);



 servo_valor( 1 ,serv1);
 servo_valor( 2 ,serv2*90.0/100.0);

 }


void main()
{

 ADCON1=0b1111;
 TRISC=0;
 TRISB=0;
 TRISC7_bit=1;

 INTCON=0b01000000;

 config_serial();

 init_servos(1.0,2.0);

 servo_valor( 1 ,0);
 servo_valor( 2 ,0);
 GIE_bit=1;
 while (1)

 {
 if (flag_rx1==1)
 {

 procesa_rx1();
 flag_rx1=0;
 memset(Trama_rx1,0,50);

 CREN_bit=0;
 CREN_bit=1;

 RCIF_bit=0;
 RCIE_bit=1;

 }



 }
}
