

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




#define Lo(param) param & 0xff;
#define Hi(param) (param >>8) & 0xff;
#define lo(param) param & 0xff;
#define hi(param) (param >>8) & 0xff;
#define LO(param) param & 0xff;
#define HI(param) (param >>8) & 0xff;

void init_servos(float pwm_min,float pwm_min);
void servos_interrupcion();
void servo_valor(char servo_num,float servo_ang);