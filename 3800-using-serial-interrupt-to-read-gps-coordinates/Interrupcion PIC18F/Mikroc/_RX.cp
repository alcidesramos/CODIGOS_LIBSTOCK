#line 1 "C:/Users/Alcides Ramos/Desktop/clase interrupcion/Interrupcion PIC18F/Mikroc/_RX.c"
#line 13 "C:/Users/Alcides Ramos/Desktop/clase interrupcion/Interrupcion PIC18F/Mikroc/_RX.c"
enum estados_ {cap_P,cap_G,cap_G2,cap_A,esp_final} ;

 char estado_rec=cap_P;

float grados,minutos;
float latitud,longitud;
char texto[30];
char c_grados[10];




char luces[]={0b00000001,0b00000010,0b00000100,0b00001000,0b00010000,0b00100000,0b01000000,0b10000000};
char cuenta1=0;

sbit led3 at RA0_bit;


sbit ledrx1 at RE0_bit;
sbit ledrx2 at RE1_bit;
sbit ledmain at RE2_bit;


char alargue=0;



char trama_rx[100];
char procesa[100];
char dato_rx;
char puntero_rx=0;

char cuenta=0;

char flag_rx=0;


void m1derecha()
{
 RC0_bit =1;
 RC1_bit =0;
}

void m1izquierda()
{
 RC0_bit =0;
 RC1_bit =1;

}

void m1quieto()
{
 RC0_bit =0;
 RC1_bit =0;
}

void procesa_rx()
{
 if (strstr(trama_rx,"led1="))
 {
 if (strstr(trama_rx,"on")) ledrx1=1;
 else ledrx1=0;
 }

 else if (strstr(trama_rx,"led2="))
 {
 if (strstr(trama_rx,"on")) ledrx2=1;
 else ledrx2=0;
 }

 else if (strstr(trama_rx,"m1der")) m1derecha();
 else if (strstr(trama_rx,"m1izq")) m1izquierda();
 else if (strstr(trama_rx,"m1stop")) m1quieto();




 else if (strstr(trama_rx,"m1pwm="))
 {
 strcpy(procesa, strtok(trama_rx, "="));
 strcpy(procesa, strtok(0, "*"));

 dato_rx=atoi(procesa);
 PWM1_Set_Duty(dato_rx);


 }



}

 void procesa_GPS()
{

 strcpy(procesa, strtok(trama_rx, ","));

 strcpy(procesa, strtok(0, ","));
 strcpy(procesa, strtok(0, ","));
 memset(c_grados,0,10);
 strncpy(c_grados,procesa,2);
 grados=atof(c_grados);


 minutos=atof(&procesa[2])/60.0;
 latitud=grados+minutos;
 strcpy(procesa, strtok(0, ","));
 if (procesa[0]=='S') latitud=-latitud;

 sprintf(texto,"lat=%f\r\n",latitud);
 UART1_Write_Text(texto);



 strcpy(procesa, strtok(0, ","));
 memset(c_grados,0,10);
 strncpy(c_grados,procesa,3);
 grados=atof(c_grados);

 minutos=atof(&procesa[3])/60.0;
 longitud=grados+minutos;
 strcpy(procesa, strtok(0, ","));
 if (procesa[0]=='W') longitud=-longitud;
 sprintf(texto,"lon=%f\r\n\r\n",longitud);
 UART1_Write_Text(texto);

}



void int_bajas() iv 0x0018 ics ICS_AUTO
{

 if (TMR0IF_bit==1)
 {
 TMR0H=11;
 TMR0L=220;

  RD4_bit =! RD4_bit ;


 TMR0IF_bit=0;
 }

 if(INT1F_bit==1)
 {
  RD3_bit =! RD3_bit ;


 INT1F_bit=0;
 }


}




void INTERRPCION_altas() iv 0x0008 ics ICS_AUTO
{

 if (RCIF_bit==1)
 {
 dato_rx=UART1_Read();

 switch (estado_rec)
 {
 case cap_P:
 trama_rx[puntero_rx]=dato_rx;
 if (dato_rx!='P') puntero_rx=0;
 else
 {
 puntero_rx++;
 estado_rec=cap_G;
 }
 break;

 case cap_G:
 trama_rx[puntero_rx]=dato_rx;
 if (dato_rx!='G')
 {
 puntero_rx=0;
 estado_rec=cap_P;
 }
 else
 {
 puntero_rx++;
 estado_rec=cap_G2;
 }
 break;

 case cap_G2:
 trama_rx[puntero_rx]=dato_rx;
 if (dato_rx!='G')
 {
 Puntero_rx=0;
 estado_rec=cap_P;
 }
 else
 {
 puntero_rx++;
 estado_rec=cap_A;
 }
 break;


 case cap_A:
 trama_rx[puntero_rx]=dato_rx;
 if (dato_rx!='A')
 {
 puntero_rx=0;
 estado_rec=cap_P;

 }
 else
 {
 puntero_rx++;
 estado_rec=esp_final;
 }

 break;

 case esp_final:
 trama_rx[puntero_rx]=dato_rx;
 puntero_rx++;
 if (dato_rx=='*')
 {
 RCIE_bit=0;
 estado_rec=cap_P;
 puntero_rx=0;
 flag_rx=1;
 }
 break;

 }



 RCIF_bit=0;
 }


 if(INT0F_bit==1)
 {
 led3=!led3;


 INT0F_bit=0;
 }


 if (TMR1IF_bit==1)


 {


 TMR1H=60;
 TMR1L=175;

  RD5_bit =! RD5_bit ;

 TMR1IF_bit=0;
 }



}


void main()
{


ADCON1=0b1111;

TRISA=0;
TRISB=0 ;
TRISC=0;
TRISD=0;
TRISE=0;

TRISC7_bit=1;
TRISB0_bit=1;
TRISB1_bit=1;


INTCON=0B00000000;

UART1_Init(9600);
PWM1_Init(300);

PWM1_Start();
 UART1_Write_Text("HOLA MUNDO");
 RCEN_bit=1;


 INT0F_bit=0;
 INT0E_bit=1;
 INTEDG0_bit=0;


 INT1F_bit=0;
 INT1E_bit=1;
 INTEDG1_bit=0;
 INT1IP_bit=0;


 T1CON=0;

 TMR1H=60;
 TMR1L=175;

 T1CKPS1_bit=1;
 T1CKPS0_bit=0;


 TMR1IF_bit=0;
 TMR1IE_bit=1;

 TMR1ON_bit=1;
 TMR1IP_bit=1;



 T0CON=0;

 TMR0H=11;
 TMR0L=220;


 T0PS2_bit=0;
 T0PS1_bit=1;
 T0PS0_bit=1;


 TMR0IF_bit=0;
 TMR0IE_bit=1;

 T08BIT_bit=0;
 TMR0ON_bit=1;
 TMR0IP_bit=0;


 RCIP_bit=1;
 RCIF_bit=0;
 RCIE_bit=1;

 CREN_bit=1;




 IPEN_bit=1;



 GIEL_bit=1;
 GIE_bit=1;




 while (1)
 {
 ledmain=!ledmain;




 if(flag_rx==1)
 {

 procesa_gps();


 if ( (latitud>10.3983526) && (latitud<10.4169007) && (longitud>-75.5575188) && (longitud<-75.550437)) ledrx1=1; else ledrx1=0;



 RCIF_bit=0;
 puntero_rx=0;


 CREN_bit=0;
 CREN_bit=1;

 RCIE_bit=1;

 flag_rx=0;

 }





 Delay_ms(500);

 }




}
