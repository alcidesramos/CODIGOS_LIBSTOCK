#include "Librerias\Servos_T1.h"
#include "Librerias\config_serial1.h"


//PINES DE LOS SERVOS
sbit servo1 at latb.b6;
sbit servo2 at latb.b7;
sbit servo3 at latb.b5;
sbit servo4 at latb.b5;
sbit servo5 at latb.b5;
sbit servo6 at latb.b5;
sbit servo7 at latc.b5;
sbit servo8 at latc.b5;      //pueden ir a cualquier pin

sbit servo1_direction at trisb.b6;
sbit servo2_direction at trisb.b7;
sbit servo3_direction at trisb.b5;
sbit servo4_direction at trisb.b5;
sbit servo5_direction at trisb.b5;
sbit servo6_direction at trisb.b5;
sbit servo7_direction at trisc.b5;
sbit servo8_direction at trisc.b5;
 // fin de los pines de los servos

 sbit led_verde at RC0_bit;
 sbit led_rojo at RC1_bit;
// da nombre a los servos
#define dir 1
#define vel 2


  float serV1,serV2;  //  direccion ,  velocidad

  char texto[50];

 //varibales rfecpcion serial
 extern unsigned char Trama_rx1[];
   extern char flag_rx1;
 unsigned char Captura_rx1[50];
 
 void interrupciones() iv 0x0008 ics ICS_AUTO 
 {
  servos_interrupcion();
  interrupcion_serial();
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
  led_verde=atoi(Captura_rx1);

 strcpy(Captura_rx1, strtok(0, "/"));  //captura hasta el 1 dato
  led_rojo=atoi(Captura_rx1);


  //carga a los servos
     servo_valor(dir,serv1);
     servo_valor(vel,serv2*90.0/100.0);

   }


void main() 
{

  ADCON1=0b1111; // todo digital
  TRISC=0;
  TRISB=0;
  TRISC7_bit=1; // ENTRADA RX

  INTCON=0b01000000;
     
      config_serial();

     init_servos(1.0,2.0); // inciia los servos
     //angulos iniciales d elos de los servos
     servo_valor(dir,0);
     servo_valor(vel,0);
     GIE_bit=1; //autoriza iinetrrupciones
    while (1)
    
    {
        if (flag_rx1==1)
      {
  //  UART1_Write_Text(Trama_rx1);
     procesa_rx1();
      flag_rx1=0;
      memset(Trama_rx1,0,50);// limpia la trama
      //limpia errores
      CREN_bit=0;
      CREN_bit=1;
      //habilita interrpcion
       RCIF_bit=0;
       RCIE_bit=1;

     }

    
    
    }
}