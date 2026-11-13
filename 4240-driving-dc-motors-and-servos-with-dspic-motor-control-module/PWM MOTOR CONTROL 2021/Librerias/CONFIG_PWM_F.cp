#line 1 "C:/Users/Alcides Ramos/Desktop/PWM MOTOR CONTROL 2021/Librerias/CONFIG_PWM_F.c"
#line 1 "c:/users/alcides ramos/desktop/pwm motor control 2021/librerias/config_pwm_f.h"

void pwm_fast_init();
#line 3 "C:/Users/Alcides Ramos/Desktop/PWM MOTOR CONTROL 2021/Librerias/CONFIG_PWM_F.c"
void pwm_fast_init()
{




 TRISB12_bit=0;
 TRISB13_bit=0;
 TRISB14_bit=0;
 TRISB15_bit=0;

 P1TCON=0;

 P1TPER=12499;

 P1TCONbits.PTEN=1;
 P1TCONbits.PTOPS=0B0000;


 P1TCONbits.PTCKPS=0B11;


 P1TCONbits.PTMOD=0B00;


 PWM1CON1=0;

 PMOD1_bit=1;
 PMOD2_bit=1;

 PEN1L_bit=1;


 PEN2L_bit=1;




 PWM1CON2=0;
 PWM1CON2bits.IUE=1;


 POVD1L_bit=1;


 POVD2L_bit=1;





 P1DC1=1249;
 P1DC2=12449;






}
