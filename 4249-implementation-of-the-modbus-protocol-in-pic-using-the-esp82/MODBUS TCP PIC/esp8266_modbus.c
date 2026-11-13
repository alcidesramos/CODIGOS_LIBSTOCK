#include "Librerias\Modbus_TCP.h"
#include "Librerias\esp8266.h"

sbit sw1 at RB4_bit;
sbit sw2 at RB5_bit;
sbit sw3 at RB6_bit;
sbit sw4 at RB7_bit;

sbit led1 at LATC0_bit;
sbit led2 at LATC1_bit;
sbit led3 at LATC2_bit;

//usadas para leer datos modbus
extern unsigned int  rec_son;
extern unsigned char flag_modbus;

//buffer para enviar varias variables analogas holding, si neecsita más cambie el tamaño
unsigned int buff_tx[5];

//registro para escribir coils digitales
unsigned int digital_out=0;
// le da nombre a las  salidas digitales deseadas   le puede colocar el no,bre que deseen y anexar hasta 15
sbit digi1 at digital_out.B0;
sbit digi2 at digital_out.B1;
sbit digi3 at digital_out.B2;
sbit digi4 at digital_out.B3;
sbit digi5 at digital_out.B4;




unsigned int codigo;  //leer el adc

float val1, val2;  // variables de control   analogas escalada
unsigned int lectu1,lectu2;    //  variables de lectura analogas  escalada


  void soft_Uart_write_text(char *info)
{
 while(*info) Soft_UART_Write(*info++);
}


void soft_Uart_write_text_const(const char *info)
{
 while(*info) Soft_UART_Write(*info++);
}

  void soft_Uart_write_buff(char *info, unsigned char cuant1)
{
 unsigned char conta;
 for (conta=0;conta<cuant1;conta++) Soft_UART_Write(*info++);
}

  void Interrucciones() iv 0x0008 ics ICS_AUTO
 {
    esp82666_interrupcion();
 }


void main() 
{
ADC_Init();
ADCON1=0B1101;   // 2 canales analogos

TRISA0_bit=1;// ENTRADA ANALOGA 1
TRISA1_bit=1;  // ENTRADA ANALOGA 1

TRISB4_bit=1;   // ENTRADA SUICHE1
TRISB5_bit=1;   // ENTRADA SUICHE2
TRISB6_bit=1;   // ENTRADA SUICHE4
TRISB7_bit=1;   // ENTRADA SUICHE4

TRISC0_bit=0; //SALIDA LED 0
TRISC1_bit=0; //SALIDA LED 1
TRISC2_bit=0; //SALIDA LED 1


TRISC6_bit=0; // salida tc
TRISC7_bit=1; // entrada rx

NOT_RBPU_bit=0; // habilita puul up

INTCON=0B01000000; // HAB INTERRPCION DE PERIFERICOS

UART1_Init(9600);
Soft_UART_Init(&PORTa, 3,2, 9600, 0);    //inica ouerto uart por software

soft_Uart_write_text("INCIIANDO\r\n");

//apaga los leds
led1=0;
led2=0;
// Configura el modulo esp_8266
     // inicia modulo Esp8266

     // configura interrupciom serial
   RCIF_bit=0;
   RCIE_bit=1;



     GIE_bit=1; // autiliza interrcpiones

   // quita el ECO
   manda_AT_COMANDO("ATE0","OK", "ERROR", 500);
  manda_AT_COMANDO("AT+CWMODE=1","OK", "no change", 1000); // se conecta a una red existente
  //manda_AT_COMANDO("AT+CWJAP=\"LA_MEJOR\",\"forever17\"","OK","OK",10000);  //se conecta a una red WIFI
  manda_AT_COMANDO("AT+CWJAP=\"Familia_Ramos_Zambrano\",\"forever17\"","OK","OK",10000);  //se conecta a una red WIFI
  //manda_AT_COMANDO("AT+CWJAP=\"Celular Alcides\",\"noconectar\"","OK","OK",10000);  //se conecta a una red WIFI
  manda_AT_COMANDO("AT+CIPMUX=1","OK","OK",3000);  //Permite multiples conexiones
   manda_AT_COMANDO("AT+CIFSR","OK","OK",5000);  //muestra la ip del modulo
   Delay_ms(2000);
  //  conecta("192.168.43.80");
   conecta("192.168.1.15");
   
   while(1)
   { 
       codigo=ADC_Get_Sample(0);
        val1=codigo*100.0/1023.0; // lo escala de o a 100
        Delay_us(2);
        codigo=ADC_Get_Sample(1);
        val2=codigo*100.0/1023.0; // lo escala de o a 100
        Delay_us(2);


        // manda dato a un registro holding
      /*  modbus_write_holding(0,val1); //manda a la direccion cero el dato 100
        modbus_write_holding(1,val2); //manda a la direccion uno el dato 100
        */
        
        //manda varias variabels analogas
        // carga el buffer con los datos a enviar
       buff_tx[0]=val1;
        buff_tx[1]=val2;
        modbus_write_holding_varios(0,buff_tx,2);// manda desde la direccion cero dos datos

         //manda hasta 16 coils o datos digitales
          digi1=!sw1;
          digi2=!sw2;
          digi3=!sw3;
          digi4=!sw4;
         modbus_write_digitalcoils(0,digital_out);  //  saca desde la direccion cero las salidas digiles  permite 15


   
   }



}