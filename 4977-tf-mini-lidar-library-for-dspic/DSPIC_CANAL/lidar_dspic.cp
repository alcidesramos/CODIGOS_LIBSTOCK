#line 1 "C:/Users/Alcides Ramos/Desktop/finder/Firmware/DSPIC_CANAL/lidar_dspic.c"
#line 1 "c:/users/alcides ramos/desktop/finder/firmware/dspic_canal/tf_mini.h"

void tf_mini_config();
void tf_mini_out_hex();
void tf_mini_out_str() ;
void tf_mini_interrupcion_hex();
void tf_mini_interrupcion_str();
void procesa_lidar_hex();
void procesa_lidar_str() ;
#line 1 "c:/users/alcides ramos/desktop/finder/firmware/dspic_canal/config_interrupcion.h"


void osciladorInt();
void direccionInt();
void pilaInt();
void aritmetrico();
void deshabilita();
void habilita();
#line 7 "C:/Users/Alcides Ramos/Desktop/finder/Firmware/DSPIC_CANAL/lidar_dspic.c"
sbit LCD_RS at LATB4_bit;
sbit LCD_EN at LATB5_bit;
sbit LCD_D4 at LATB6_bit;
sbit LCD_D5 at LATA0_bit;
sbit LCD_D6 at LATA1_bit;
sbit LCD_D7 at LATA4_bit;

sbit LCD_RS_Direction at TRISB4_bit;
sbit LCD_EN_Direction at TRISB5_bit;
sbit LCD_D4_Direction at TRISB6_bit;
sbit LCD_D5_Direction at TRISA0_bit;
sbit LCD_D6_Direction at TRISA1_bit;
sbit LCD_D7_Direction at TRISA4_bit;








extern char flag_rx_lidar;
extern unsigned int distancia;
extern unsigned int fuerza;extern float distancia_float;


char texto[20];

void interrpcionlidar() iv IVT_ADDR_U1RXINTERRUPT ics ICS_AUTO
{



 tf_mini_interrupcion_str();




}


void main()
{






 CLKDIVbits.PLLPRE = 0;
 CLKDIVbits.PLLPOST = 0;
 PLLFBD=41;

 deshabilita();
 AD1PCFGL=0xffff;

 TRISB=0;
 TRISA=0;
 Delay_ms(100);
 Unlock_IOLOCK();
 PPS_Mapping(8,_OUTPUT,_U1TX);
 PPS_Mapping(9,_INPUT,_U1RX);

 PPS_Mapping(0,_OUTPUT,_U2TX);
 PPS_Mapping(1,_INPUT,_U2RX);

 UART1_Init(115200);
UART2_Init(115200);
 Delay_ms(50);

 Lock_IOLOCK();

 Lcd_Init();
 Delay_ms(50);
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_CURSOR_OFF);
 Lcd_Out(1,6,"LIDAR");

tf_mini_config();



tf_mini_out_str();




 u1sta.b7=0;
 u1sta.b6=0;


 U1STA.b1=0;


U1RXIP_2_bit=1;
U1RXIP_1_bit=1;
U1RXIP_0_bit=1;

U1RXIF_bit=0;
U1RXIE_bit=1;

habilita();
UART2_Write_Text("INICIANDO\r\n");

 while(1)

 {

 if (flag_rx_lidar==1)
 {









 procesa_lidar_str();
 sprintf(texto,"DIST=%.1f",distancia_float);
 Lcd_Out(2,5,"          ");
 Lcd_Out(2,5,texto);
 UART2_Write_Text(texto);
 UART2_Write_Text("\r\n");






 U1STA.b1=0;

 U1RXIF_bit=0;
 U1RXIE_bit=1;

 flag_rx_lidar=0;
 }

  LATB15_bit =! LATB15_bit ;
 Delay_ms(200);

 }


}
