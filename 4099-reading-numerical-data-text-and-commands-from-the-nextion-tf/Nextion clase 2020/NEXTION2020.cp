#line 1 "C:/Users/Alcides Ramos/Desktop/Nextion clase 2020/NEXTION2020.c"
#line 1 "c:/users/alcides ramos/desktop/nextion clase 2020/nextion.h"
void nextion_init();
void nextion_interrupcion();
#line 3 "C:/Users/Alcides Ramos/Desktop/Nextion clase 2020/NEXTION2020.c"
sbit LED1 at LATC0_bit;
sbit LED2 at LATC1_bit;
sbit LED at LATd7_bit;



sbit LCD_RS at LATD0_bit;
sbit LCD_EN at LATD1_bit;
sbit LCD_D4 at LATD2_bit;
sbit LCD_D5 at LATD3_bit;
sbit LCD_D6 at LATD4_bit;
sbit LCD_D7 at LATD5_bit;

sbit LCD_RS_Direction at TRISD0_bit;
sbit LCD_EN_Direction at TRISD1_bit;
sbit LCD_D4_Direction at TRISD2_bit;
sbit LCD_D5_Direction at TRISD3_bit;
sbit LCD_D6_Direction at TRISD4_bit;
sbit LCD_D7_Direction at TRISD5_bit;




extern char flag_rx1;
extern char trama_rx_nextion[];
unsigned char captura_nextion[20];
unsigned char nextion_var;
unsigned char nextion_var_corta;
unsigned long nextion_var_larga;
char texto[50];


void interrupciones() iv 0x0008 ics ICS_AUTO
{
 nextion_interrupcion();


}
 void procesa_rx_nextion()
 {
 char largo_cap;




 if (strstr(trama_rx_nextion,"onle1")) led1=1;
 else if (strstr(trama_rx_nextion,"offle1")) led1=0;


 else if (strstr(trama_rx_nextion,"pwm1"))
 {
 strcpy(captura_nextion, strtok(trama_rx_nextion, "/"));
 strcpy(captura_nextion, strtok(0, "/"));
 nextion_var_corta=captura_nextion[0];

 PWM1_Set_Duty(nextion_var_corta);

 }

 else if (strstr(trama_rx_nextion,"va1"))
 {

 strcpy(captura_nextion, strtok(trama_rx_nextion, "/"));
 strcpy(captura_nextion, strtok(0, "/"));




 largo_cap=strlen(captura_nextion);

 switch (largo_cap)
 {
 case 1:
 nextion_var_larga=(unsigned long)captura_nextion[0];
 break;

 case 2:
 nextion_var_larga=(unsigned long)captura_nextion[0]+(unsigned long)captura_nextion[1]*256;
 break;

 case 3:
 nextion_var_larga=(unsigned long)captura_nextion[0]+(unsigned long)captura_nextion[1]*256+(unsigned long)captura_nextion[2]*65536;
 break;

 case 4:
 nextion_var_larga=(unsigned long)captura_nextion[0]+(unsigned long)captura_nextion[1]*256+(unsigned long)captura_nextion[2]*65536+(unsigned long)captura_nextion[3]*16777216;
 break;
 }

 LongWordToStr(nextion_var_larga,texto);
 Ltrim(texto);

 Lcd_Out(2,2,"            ");
 Lcd_Out(2,2,texto);

 }

 else if (strstr(trama_rx_nextion,"text1"))
 {
 strcpy(captura_nextion, strtok(trama_rx_nextion, "/"));
 strcpy(captura_nextion, strtok(0, "/"));
 Lcd_Out(3,1,"            ");
 Lcd_Out(3,1,captura_nextion);

 }

 else if (strstr(trama_rx_nextion,"led"))
 {

 strcpy(captura_nextion, strtok(trama_rx_nextion, "/"));
 strcpy(captura_nextion, strtok(0, "/"));
 nextion_var=atoi(captura_nextion);
 strcpy(captura_nextion, strtok(0, "/"));
 nextion_var_corta=atoi(captura_nextion);
 switch (nextion_var)
 {
 case 1:
 led1= nextion_var_corta;
 break;

 case 2:
 led2= nextion_var_corta;
 break;



 }
 }





 }
void main()
{

ADCON1=0B1111;

TRISC6_bit=0;
TRISC7_bit=1;

TRISC2_bit=0;

TRISC0_bit=0;
TRISC1_bit=0;
TRISD7_bit=0;
INTCON=0b01000000;

 Lcd_Init();
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_CURSOR_OFF);
 Lcd_Out(1,1,"   NEXTION 2020");

PWM1_Init(500);
PWM1_Set_Duty(127);
PWM1_Start();

 nextion_init();
 GIE_bit=1;

 while (1)
 {
 if (flag_rx1==1)
 {
 procesa_rx_nextion();
 memset(trama_rx_nextion,0,50);

 CREN_bit=0;
 CREN_bit=1;
 RCIF_bit=0;
 RCIE_bit=1;
 flag_rx1=0;


 }


 LED=!led;
 Delay_ms(150);

 }


}
