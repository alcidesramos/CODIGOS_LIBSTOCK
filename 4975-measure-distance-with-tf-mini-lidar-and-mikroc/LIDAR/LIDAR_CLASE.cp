#line 1 "C:/Users/Alcides Ramos/Desktop/finder/Firmware/LIDAR/LIDAR_CLASE.c"
#line 1 "c:/users/alcides ramos/desktop/finder/firmware/lidar/tf_mini.h"

void tf_mini_config();
void tf_mini_out_hex();
void tf_mini_out_str() ;
void tf_mini_interrupcion_hex();
void tf_mini_interrupcion_str();
void procesa_lidar_hex();
void procesa_lidar_str() ;
#line 6 "C:/Users/Alcides Ramos/Desktop/finder/Firmware/LIDAR/LIDAR_CLASE.c"
sbit LCD_RS at RA5_bit;
sbit LCD_EN at RA4_bit;
sbit LCD_D4 at RA3_bit;
sbit LCD_D5 at RA2_bit;
sbit LCD_D6 at RA1_bit;
sbit LCD_D7 at RA0_bit;

sbit LCD_RS_Direction at TRISA5_bit;
sbit LCD_EN_Direction at TRISA4_bit;
sbit LCD_D4_Direction at TRISA3_bit;
sbit LCD_D5_Direction at TRISA2_bit;
sbit LCD_D6_Direction at TRISA1_bit;
sbit LCD_D7_Direction at TRISA0_bit;






extern char flag_rx_lidar;
extern unsigned int distancia;
extern unsigned int fuerza;
extern float distancia_float;


char texto[20];

void INTERRUPCION() iv 0x0008 ics ICS_AUTO
{




 tf_mini_interrupcion_str();


}

void main()
{
 INTCON=0;
 INTCON.b6=1;
ADCON1=0B1111;
TRISC6_bit=0;
TRISC7_bit=1;
TRISB0_bit=0;



 Lcd_Init();
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_CURSOR_OFF);
 Lcd_Out(1,9,"LIDAR");

tf_mini_config();




tf_mini_out_str();



 RCIF_bit=0 ;

 CREN_bit=0;
 CREN_bit=1;
 RCIE_bit=1;
 GIE_bit=1;
 while(1)
 {
 if (flag_rx_lidar==1)
 {








 procesa_lidar_str();
 sprintf(texto,"DIST=%.1f",distancia_float);
 Lcd_Out(3,5,"            ");
 Lcd_Out(3,5,texto);




 CREN_bit=0;
 CREN_bit=1;
 RCIF_bit=0;
 RCIE_bit=1;

 flag_rx_lidar=0;

 }
  LATB0_bit =! LATB0_bit ;
 Delay_ms(200);


 }

}
