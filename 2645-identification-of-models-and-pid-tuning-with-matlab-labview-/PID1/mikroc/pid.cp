#line 1 "C:/Users/Alcides Ramos/Desktop/PID1/mikroc/pid.c"

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


float kp=0.2348,ki= 0.0496,kd=0;

float error,up,ui=0.0,ui_=0.0,error_=0.0,ud,ut;
float set_point=0;

void pid(float pid_in)

{
const float max_x=255;
const float min_x=0;
const float t_muestreo=0.1;


error=set_point-pid_in;
 up=kp*error;
 ui=ui_ + (ki*t_muestreo*error);
 ud=kd*(error-error_)/t_muestreo;
 ut=up+ui+ud;
 if (ut>max_x) ut=max_x;
 if (ut<min_x) ut=min_x;

 ui_=ui;
 error_=error;

}



void interrupt()
{
 USB_Interrupt_Proc();
}


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

 HID_Enable(&readbuff,&writebuff);

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







 pid(temperatura);
 PWM1_Set_Duty(ut);
 Delay_ms(86);

 LATB7_bit=~LATB7_bit;



 }


}
