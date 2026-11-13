#line 1 "C:/Users/Taller Electronica/Desktop/gps/pic2018/GPS2018.c"
sbit led at LATC0_bit;



sbit LCD_RS at RB7_bit;
sbit LCD_EN at RB6_bit;
sbit LCD_D4 at RB5_bit;
sbit LCD_D5 at RB4_bit;
sbit LCD_D6 at RB3_bit;
sbit LCD_D7 at RB2_bit;

sbit LCD_RS_Direction at TRISB7_bit;
sbit LCD_EN_Direction at TRISB6_bit;
sbit LCD_D4_Direction at TRISB5_bit;
sbit LCD_D5_Direction at TRISB4_bit;
sbit LCD_D6_Direction at TRISB3_bit;
sbit LCD_D7_Direction at TRISB2_bit;



float grados,minutos;
float latitud,longitud;


char c_grados[10];



enum estados_ {cap_P,cap_G,cap_G2,cap_A,esp_final} ;

 char estado_rec=cap_P;


float valor_rx;
char trama_rx[100];
char captura_rx[100];
char texto[10];
char contador_trama=0;
unsigned long demora=0;


char lee_trama()
{
char dato_rx;

memset(trama_rx,100,0);
demora=0;
contador_trama=0;
estado_rec=cap_P;

RCIF_bit=0;
CREN_bit=0;
CREN_bit=1;

while (demora<=96667)
{
 demora++;
 switch (estado_rec)
 {
 case cap_P:
 if (RCIF_bit==1)
 {
 dato_rx=UART_Read();
 trama_rx[contador_trama]=dato_rx;
 if (dato_rx!='P') contador_trama=0;
 else
 {
 contador_trama++;
 estado_rec=cap_G;
 }
 RCIF_bit=0;
 }
 break;

 case cap_G:
 if (RCIF_bit==1)
 {
 dato_rx=UART_Read();
 trama_rx[contador_trama]=dato_rx;
 if (dato_rx!='G')
 {
 contador_trama=0;
 estado_rec=cap_P;
 }
 else
 {
 contador_trama++;
 estado_rec=cap_G2;
 }
 RCIF_bit=0;
 }
 break;

 case cap_G2:
 if (RCIF_bit==1)
 {
 dato_rx=UART_Read();
 trama_rx[contador_trama]=dato_rx;
 if (dato_rx!='G')
 {
 contador_trama=0;
 estado_rec=cap_P;
 }
 else
 {
 contador_trama++;
 estado_rec=cap_A;
 }
 RCIF_bit=0;
 }
 break;


 case cap_A:
 if (RCIF_bit==1)
 {
 dato_rx=UART_Read();
 trama_rx[contador_trama]=dato_rx;
 if (dato_rx!='A')
 {
 contador_trama=0;
 estado_rec=cap_P;

 }
 else
 {
 contador_trama++;
 estado_rec=esp_final;
 }
 RCIF_bit=0;
 }

 break;

 case esp_final:
 if (RCIF_bit==1)
 {
 dato_rx=UART_Read();
 trama_rx[contador_trama]=dato_rx;
 contador_trama++;
 if (dato_rx=='*') return(1);
 RCIF_bit=0;
 }
 break;


 }

 }
 return(0);

}



void main()
{

ANSELA=0;
ANSELB=0;
ANSELC=0;


trisc.b7=1;
trisc.b6=0;

trisc.b0=0;


 UART1_Init(9600);

 Lcd_Init();
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_CURSOR_OFF);

 Lcd_Out(1,1,"LAT= ");
 Lcd_Out(2,1,"LON= ");

 Delay_ms(5000);


 while (1)
 {
 lee_trama();


 strcpy(captura_rx, strtok(trama_rx, ","));
 strcpy(captura_rx, strtok(0, ","));
 strcpy(captura_rx, strtok(0, ","));
 memset(c_grados,0,10);
 strncpy(c_grados,captura_rx,2);
 grados=atof(c_grados);


 minutos=atof(&captura_rx[2])/60.0;
 latitud=grados+minutos;

 strcpy(captura_rx, strtok(0, ","));
 if (captura_rx[0]=='S') latitud=-latitud;

 sprintf(texto,"%f",latitud);

 Lcd_Out(1,6,"            ");
 Lcd_Out(1,6,texto);



 strcpy(captura_rx, strtok(0, ","));
 memset(c_grados,0,10);
 strncpy(c_grados,captura_rx,3);
 grados=atof(c_grados);

 minutos=atof(&captura_rx[3])/60.0;
 longitud=grados+minutos;
 strcpy(captura_rx, strtok(0, ","));
 if (captura_rx[0]=='W') longitud=-longitud;
 sprintf(texto,"%f",longitud);
 Lcd_Out(2,6,"            ");
 Lcd_Out(2,6,texto);


if ( (latitud>10.3983526) && (latitud<10.4169007) && (longitud>-75.5575188) && (longitud<-75.5531294 )) led=1; else led=0;



 Delay_ms(500);




 }



}
