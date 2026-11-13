#line 1 "C:/Users/Alcides Ramos/Desktop/PWM MOTOR CONTROL 2021/Librerias/CONFIG_PWM_B.c"



void pwm_init_basico()
{

TMR2=0;
PR2=12500;

T2CON=0;

T2CONbits.TCKPS=0B10;

 T2CONbits.TON=1;



 OC1CON=OC2CON=0;
 OC1CONbits.OCTSEL= OC2CONbits.OCTSEL=0;

 OC1RS=OC1R=OC2RS=OC2R=6250;


 OC1CONbits.OCM=OC2CONbits.OCM=0b110;


 }
