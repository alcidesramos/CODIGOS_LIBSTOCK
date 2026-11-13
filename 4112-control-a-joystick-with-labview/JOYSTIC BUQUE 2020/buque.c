#include "Librerias\CONFIG_PWM_B.h"
#include "Librerias\Config_Interrupcion.h"
#include  "Librerias\CONFIG_UART_RX1.h"
             //trama
// INI=/DIR/VEL/L1/L2/*

sbit led1 at RB0_bit;
sbit led2 at RB1_bit;

 char texto[50];

 //varibales rfecpcion serial
 extern unsigned char Trama_rx1[];
   extern char flag_rx1;
 unsigned char Captura_rx1[50];

float serV1,serV2;  //  direccion ,  velocidad

void servo1(float angulo)
{
  OC1RS=3.4722*angulo + 937.5;
}


void servo2(float angulo)
{
  OC2RS=3.4722*angulo + 937.5;
}




void procesa_rx1()
{
//   INI=/DIR/VEL/L1/L2/*
  strcpy(Captura_rx1, strtok(trama_rx1, "/"));  //inicia captura de tokens desde el /
  strcpy(Captura_rx1, strtok(0, "/"));  //captura hasta el 1 dato
   serv1=atof(Captura_rx1);
 
  strcpy(Captura_rx1, strtok(0, "/"));  //captura hasta el 1 dato
  serv2=atof(Captura_rx1);

 strcpy(Captura_rx1, strtok(0, "/"));  //captura hasta el 1 dato
  led1=atoi(Captura_rx1);

 strcpy(Captura_rx1, strtok(0, "/"));  //captura hasta el 1 dato
  led2=atoi(Captura_rx1);


  //carga a los servos

//   sprintf(texto,"ser1=%.1f      serv2=%.1f\r\f",serv1,serv2);
  // UART1_Write_Text(texto);
   servo1(serv1);// direccion
   servo2(serv2*90.0/100.0);

   }



void main()
{

  //CONFIGURA VELOCIDAD DE OPERACION    A 80 MEGAHERT CON CRISTAL DE 4 MEGA

//DEJAMOS N1 Y N2  EN 2

//oscialdor interno de 7.37MHz
  CLKDIVbits.PLLPRE = 0;      // N1 = 2
  CLKDIVbits.PLLPOST = 0;     // N2 = 2
   PLLFBD=41; // selecciona  M=43;  se pone lo deseado menos 2;    CRISTAL INTERNO


//INICIALIZA PINES DIGITALES
 AD1PCFGL = 0xFFFF;        //1=digital  0=analogo

  TRISA=0; //todo salida  A
  TRISB=0;  //salida todo B
  TRISB0_bit=0; //salida ld1
  TRISB1_bit=0;// salidaled2
   //REMAPEAMOS SALIDA SERIAL
   PPS_Mapping(13,_OUTPUT,_U1TX);
   PPS_Mapping(14,_INPUT,_U1RX);

   //REMAPEO PWM
   PPS_Mapping(2,_OUTPUT,_OC1);
   PPS_Mapping(3,_OUTPUT,_OC2);

  pwm_init_basico();
  config_uart1_trama(9600);
         UART1_Write_Text("AJA");
   habilita();   //habuilita interrucipnes
    while(1)

   {
       if (flag_rx1==1)
      {
  //  UART1_Write_Text(Trama_rx1);
     procesa_rx1();
      flag_rx1=0;
      memset(Trama_rx1,0,50);// limpia la trama
       U1STAbits.OERR=0; //LIMPIA  errores

      U1RXIF_bit=0;
      U1RXIE_bit=1;


     }



   }


}