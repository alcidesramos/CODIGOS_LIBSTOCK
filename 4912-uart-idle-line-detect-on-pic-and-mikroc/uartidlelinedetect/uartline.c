
sbit led at LATC0_bit;
sbit led2 at LATC1_bit;

 char trama_rx[50];   //trama de 50 datos
 char cont_trama=0;
 char flag_rx=0;
 char dato_rx;
 
 void uartrx() iv 0x0008 ics ICS_AUTO 
 {

      if (TMR0IF_bit==1)
    {

    flag_rx=1; //avisa que posee datos valodo para procesa
    cont_trama=0;
    RCIE_bit=0;//dehabilita la int serial
    TMR0IF_bit=0;
    TMR0IE_bit=0;//deshabilita la int del timer
    TMR0ON_bit=0;  //APARA EL TIMER
    }


      if (RCIF_bit==1)
   {
    dato_rx=RCREG;// Lee dato serial
    trama_rx[cont_trama]=dato_rx; //va llenando el buffer con lo recibido
    cont_trama++;    //incrementa contado de datos recibidos
    if (cont_trama>=50) cont_trama=0;  //si se llena el buffer lo reinicia
    TMR0L=0; //limpia el timer
    TMR0ON_bit=1;//ARRANCA EL TIMER
    TMR0IE_bit=1; //habilita la int del timer
    RCIF_bit=0;
    }




 }

void main() 

{

INTCON=0b01000000;  //ineterrupciones de perifericos autorizada
TRISC6_bit=0;//salida tx
TRISC7_bit=1; //entrada rx\

TRISC0_bit=0; ///salida led1

TRISC1_bit=0; ///salida led2

UART1_Init(9600);

 //configuración tiomer 0
 T0CON=0;

 T08BIT_bit=1;//TRABAJA  A8 BIT
 //CONFIGURA EL PREESCALADOR
 T0PS2_bit=1;
 T0PS1_bit=0;
 T0PS0_bit=0;

 TMR0ON_bit=0;// Apaga el timer
 
  T0CS_bit=0;  //el timer incrementa con el ciclo del reloj
  
   PSA_bit=0; //el preescalador es asignado al timer 0


 TMR0IF_bit=0; //limpia la banders
 TMR0IE_bit=0; //deshabilita las interrupciones de time

 //int serial
   RCIF_bit=0; //limpia la bandera int serial
   //borra errores de recepcion serial
  CREN_bit=0;
  CREN_bit=1;
   RCIE_bit=1;//habilita la int serial


 GIE_bit=1; //autorizza interrpciones
 while (1)
 {
    if (flag_rx==1)
  {
    cont_trama=0;
    UART1_Write_Text(trama_rx); //REPITE LA TRAMA
    if (strstr(trama_rx,"led=") )
    {
        if (strstr(trama_rx,"on"))   led2=1;
        else led2=0;
    }
    memset(trama_rx,0,50);//limpia le buffer
   //borra errores de recepcion serial
  CREN_bit=0;
  CREN_bit=1;
   RCIF_bit=0; //limpia la bandera int serial
   RCIE_bit=1;//habilita la int serial
    flag_rx=0;

   }

 
   led=!led;
  Delay_ms(300);

 
 }

}