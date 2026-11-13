#line 1 "C:/Users/Alcides Ramos/Desktop/PWM MOTOR CONTROL 2021/pwm_basico.c"
#line 1 "c:/users/alcides ramos/desktop/pwm motor control 2021/librerias/config_interrupcion.h"


void osciladorInt();
void direccionInt();
void pilaInt();
void aritmetrico();
void deshabilita();
void habilita();
#line 1 "c:/users/alcides ramos/desktop/pwm motor control 2021/librerias/config_pwm_b.h"
 void pwm_init_basico();
#line 1 "c:/users/alcides ramos/desktop/pwm motor control 2021/librerias/config_pwm_f.h"

void pwm_fast_init();
#line 6 "C:/Users/Alcides Ramos/Desktop/PWM MOTOR CONTROL 2021/pwm_basico.c"
const float ser_min=1.0;
const float ser_max=2.0;
signed char cuenta;


float salida1, salida2;


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
 CLKDIVbits.PLLPRE = 0;
 CLKDIVbits.PLLPOST = 0;
 PLLFBD=41;


 AD1PCFGL = 0xFFFF;


 TRISA=0XFFFF;
 TRISB=0XFFFF;

 Unlock_IOLOCK();

 PPS_Mapping(0,_OUTPUT,_U1TX);
 PPS_Mapping(1,_INPUT,_U1RX);


 PPS_Mapping(2,_OUTPUT,_OC1);
 PPS_Mapping(3,_OUTPUT,_OC2);



 Lock_IOLOCK();

 UART1_Init(9600);
 UART1_Write_Text("INICIANDO\r\n");
 pwm_init_basico();
 pwm_fast_init();






 while (1)

 {
 PWM2(90);
 PWM4(90);


 for (cuenta=-90;cuenta<=90;cuenta+=5)
 {

 servo1_ecu(cuenta);
 servo3_ecu(cuenta);
 Delay_ms(50);
 }
 pwm2(10);
 pwm4(10);

 Delay_ms(1000);


 }


}
