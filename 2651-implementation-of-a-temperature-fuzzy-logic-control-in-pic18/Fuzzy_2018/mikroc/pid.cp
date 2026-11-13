#line 1 "C:/Users/Alcides Ramos/Desktop/Fuzzy_2018/mikroc/pid.c"
#line 1 "c:/users/alcides ramos/desktop/fuzzy_2018/mikroc/controlador.h"
#line 15 "c:/users/alcides ramos/desktop/fuzzy_2018/mikroc/controlador.h"
 typedef struct {
 double (* equal)(double x);
 double (* center)();
 double (* basis)();
 double (* param)(int i);
 } Consequent;

 typedef struct {
 double min;
 double max;
 double step;
 double (* imp)(double a, double b);
 double (* also)(double a, double b);
 int length;
 double* degree;
 int inputlength;
 double* input;
 Consequent* conc;
 } FuzzyNumber;










void controladorInferenceEngine(double error, double Cambio_e, double* pwm);
#line 5 "C:/Users/Alcides Ramos/Desktop/Fuzzy_2018/mikroc/pid.c"
sbit LCD_RS at RB0_bit;
sbit LCD_EN at RB1_bit;
sbit LCD_D4 at RB2_bit;
sbit LCD_D5 at RB3_bit;
sbit LCD_D6 at RB4_bit;
sbit LCD_D7 at RB5_bit;

sbit LCD_RS_Direction at TRISB0_bit;
sbit LCD_EN_Direction at TRISB1_bit;
sbit LCD_D4_Direction at TRISB2_bit;
sbit LCD_D5_Direction at TRISB3_bit;
sbit LCD_D6_Direction at TRISB4_bit;
sbit LCD_D7_Direction at TRISB5_bit;



unsigned char readbuff[64] absolute 0x500;
unsigned char writebuff[64] absolute 0x540;


unsigned int codigo;
float temperatura;



char texto[20];



float error,error_=0.0,salida;
float set_point=0;






void main()
{
ADCON1=0b1101;
 TRISB7_bit=0;

 trisc=0;


 TRISA0_bit=1;
 TRISA1_bit=1;

 LATC2_bit=1;

 Lcd_Init();

 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_CURSOR_OFF);
 Lcd_Out(1,1,"TEMP=  ");
 Lcd_Out(2,1,"SET P= ");
 ADC_Init();

 PWM1_Init(1250);
 PWM1_Set_Duty(0);
 PWM1_Start();



 while (1)
 {
 codigo=ADC_Get_Sample(0);
 temperatura=codigo*1850.0/1023.0 ;
 WordToStr (temperatura,texto);
 Lcd_Out(1,9,texto);
 Delay_us(5);
 codigo=ADC_Get_Sample(1);
 set_point=codigo*1500.0/1023.0;
 WordToStr(set_point,texto);
 Lcd_Out(2,9,texto);








 error=set_point-temperatura;
 controladorInferenceEngine(error,error-error_,&salida);


 PWM1_Set_Duty(salida);
 error_=error;

 Delay_ms(10);

 LATB7_bit=~LATB7_bit;



 }


}
