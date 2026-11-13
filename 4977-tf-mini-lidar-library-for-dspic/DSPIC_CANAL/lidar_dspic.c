#include "tf_mini.h"
#include "Config_Interrupcion.h"

//#define tf_hex

// LCD module connections
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
// End LCD module connections



#define led1  LATB15_bit


//variables de la int serial lidar
extern char flag_rx_lidar;
extern unsigned int distancia;
extern unsigned int fuerza;extern float distancia_float;


char texto[20];

void interrpcionlidar() iv IVT_ADDR_U1RXINTERRUPT ics ICS_AUTO 
{
   #ifdef  tf_hex
    tf_mini_interrupcion_hex();
    #else
     tf_mini_interrupcion_str();
    #endif



}


void main()
{
//CONFIGURA VELOCIDAD DE OPERACION    A 80 MEGAHERT CON CRISTAL i nterno

//DEJAMOS N1 Y N2  EN 2

//VELOCIDAD= 4M*M/(N1*N2)= 4M*80/4=80M

  CLKDIVbits.PLLPRE = 0;      // N1 = 2
  CLKDIVbits.PLLPOST = 0;     // N2 = 2
   PLLFBD=41; // selecciona  para que trabaje con cristal interno
   
   deshabilita();
 AD1PCFGL=0xffff;// todo digital
  //puertos como salida
 TRISB=0;
 TRISA=0;
 Delay_ms(100);
 Unlock_IOLOCK();
 PPS_Mapping(8,_OUTPUT,_U1TX);  //lidar tx
 PPS_Mapping(9,_INPUT,_U1RX);   //lidar rx

 PPS_Mapping(0,_OUTPUT,_U2TX); //tx pc
 PPS_Mapping(1,_INPUT,_U2RX);  //rx pc

 UART1_Init(115200);  //puerto lidar
UART2_Init(115200);   //puerto pc
 Delay_ms(50);

 Lock_IOLOCK();

  Lcd_Init();
  Delay_ms(50);
  Lcd_Cmd(_LCD_CLEAR);
  Lcd_Cmd(_LCD_CURSOR_OFF);
  Lcd_Out(1,6,"LIDAR");

tf_mini_config();      //entra en configuracion
#ifdef tf_hex
tf_mini_out_hex();   //salida en hexadecimal
#else
tf_mini_out_str(); //salida en string
#endif

//habilita inr serial
  //un solo byte
   u1sta.b7=0;
   u1sta.b6=0;

//evita errores de desbordamiento
    U1STA.b1=0;

//Prioridad de la recepcion serial
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

         #ifdef  tf_hex
         procesa_lidar_hex();
         sprintf(texto,"DIST=%u",(unsigned int)distancia);
         Lcd_Out(2,5,"          ");
         Lcd_Out(2,5,texto);
         UART2_Write_Text(texto);
         UART2_Write_Text("\r\n");
         #else
         procesa_lidar_str();
         sprintf(texto,"DIST=%.1f",distancia_float);
        Lcd_Out(2,5,"          ");
        Lcd_Out(2,5,texto);
        UART2_Write_Text(texto);
         UART2_Write_Text("\r\n");

         #endif

         //activa it serial

      //evita errores de desbordamiento
        U1STA.b1=0;

         U1RXIF_bit=0;
         U1RXIE_bit=1;

       flag_rx_lidar=0;
        }

     led1=!led1;
     Delay_ms(200);
   
   }


}