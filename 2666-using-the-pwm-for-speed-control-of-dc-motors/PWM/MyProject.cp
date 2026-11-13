#line 1 "C:/Users/Alcides Ramos/Desktop/PWM/MyProject.c"


sbit LCD_RS at RD0_bit;
sbit LCD_EN at RD1_bit;
sbit LCD_D4 at RD2_bit;
sbit LCD_D5 at RD3_bit;
sbit LCD_D6 at RD4_bit;
sbit LCD_D7 at RD5_bit;

sbit LCD_RS_Direction at TRISD0_bit;
sbit LCD_EN_Direction at TRISD1_bit;
sbit LCD_D4_Direction at TRISD2_bit;
sbit LCD_D5_Direction at TRISD3_bit;
sbit LCD_D6_Direction at TRISD4_bit;
sbit LCD_D7_Direction at TRISD5_bit;



sbit m11 at RB0_bit;
sbit m12 at RB1_bit;

sbit m21 at RB2_bit;
sbit m22 at RB3_bit;

char texto[20];


sbit sube2 at RB6_bit;
sbit baja2 at RB7_bit;


sbit giro1 at RB4_bit;
sbit giro2 at RB5_bit;



unsigned int codigo;
unsigned int velo1;
signed int velo2=0;


void derecha1()
{
m11=1;
m12=0;
}


void izquierda1()
{
m11=0;
m12=1;
}

void derecha2()
{
m21=1;
m22=0;
}


void izquierda2()
{
m21=0;
m22=1;
}


void main()
{
ADCON1=0B1111;
TRISA=0B111111;
TRISB=0;

TRISB4_bit=1;
TRISB5_bit=1;

TRISB6_bit=1;
TRISB7_bit=1;




RC1_bit=0;
RC2_bit=0;

PWM1_Init(245);
PWM2_Init(245);
PWM1_Set_Duty(40);
PWM2_Set_Duty(200);

PWM1_Start();
PWM2_Start();
ADC_Init();
TRISA1_bit=1;
TRISA2_bit=1;
 Lcd_Init();

 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_CURSOR_OFF);

 Lcd_Out(1,1,"Ve1=");
 Lcd_Out(2,1,"Ve2=");

 Lcd_Out(1,11,"G1=");
 Lcd_Out(2,11,"G2=");
 NOT_RBPU_bit=0;

 while (1)
 {
 codigo=ADC_Read(0);
 velo1=codigo*255.0/1023.0;
 PWM1_Set_Duty(velo1);


 if (sube2==0)
 {
 velo2=velo2+10;
 if (velo2>=255) velo2=255;
 PWM2_Set_Duty(velo2);
 Delay_ms(250);
 }

 if (baja2==0)
 {
 velo2=velo2-10;
 if (velo2<=0) velo2=0;
 PWM2_Set_Duty(velo2);
 Delay_ms(250);
 }

 if (giro1==0)
 {
 derecha1();
 Lcd_Chr(1,14,'D');
 }

 else
 {
 izquierda1();
 Lcd_Chr(1,14,'I');

 }

 if (giro2==0)
 {
 derecha2();
 Lcd_Chr(2,14,'D');
 }

 else
 {
 izquierda2();
 Lcd_Chr(2,14,'I');

 }

 floattostr_(velo1*100.0/255.0,texto,1);
 Lcd_Out(1,5,texto);
 floattostr_(velo2*100.0/255.0,texto,1);
 Lcd_Out(2,5,texto);



 }






}
