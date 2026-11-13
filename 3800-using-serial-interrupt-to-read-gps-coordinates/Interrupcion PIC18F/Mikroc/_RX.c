#define led RD3_bit

#define led1 RD5_bit
#define led2 RD4_bit


//pines de direccion del motor
#define m11 RC0_bit
#define m12 RC1_bit

//   lo que se va a capturar se toma desde PGGA  HASTA *
//estados de la recepcion de variables
enum estados_  {cap_P,cap_G,cap_G2,cap_A,esp_final} ;
//estado inicial
 char estado_rec=cap_P;

float grados,minutos;
float latitud,longitud;
char texto[30];
char c_grados[10];   // grados en cadena




char luces[]={0b00000001,0b00000010,0b00000100,0b00001000,0b00010000,0b00100000,0b01000000,0b10000000};
char cuenta1=0;

sbit led3 at RA0_bit;


sbit ledrx1 at RE0_bit;
sbit ledrx2 at RE1_bit;
sbit ledmain at RE2_bit;


char alargue=0;


//variables para capturar la trama
char trama_rx[100];
char procesa[100];
char dato_rx;
char puntero_rx=0;  ///   recorrer el vector tramarx

char cuenta=0;

char flag_rx=0;

//funcion para que gira a la derecha
void m1derecha()
{
m11=1;
m12=0;
}

void m1izquierda()
{
m11=0;
m12=1;

}

void m1quieto()
{
m11=0;
m12=0;
}

void procesa_rx()
{
 if (strstr(trama_rx,"led1="))      //led1=on*
             {
             if (strstr(trama_rx,"on")) ledrx1=1;
            else ledrx1=0;
            }

        else if (strstr(trama_rx,"led2="))      //led1=on*
             {
             if (strstr(trama_rx,"on")) ledrx2=1;
            else ledrx2=0;
            }

              else if (strstr(trama_rx,"m1der"))  m1derecha();
            else if (strstr(trama_rx,"m1izq"))  m1izquierda();
        else if (strstr(trama_rx,"m1stop"))  m1quieto();

          //si llega es la velocidad del motor


    else if (strstr(trama_rx,"m1pwm="))        //m1pwm=90*
    {
        strcpy(procesa, strtok(trama_rx, "="));  //inicia captura de tokens desde el =
        strcpy(procesa, strtok(0, "*"));  //captura hasta el /
        //pasa la cadena a  numero
        dato_rx=atoi(procesa);
        PWM1_Set_Duty(dato_rx);// aplica la velocidad al pwm


    }



}

  void procesa_GPS()
{
 //captura la latitud
   strcpy(procesa, strtok(trama_rx, ","));  //inicia captura de tokens desde el =
   
   strcpy(procesa, strtok(0, ","));  //captura hasta segunda coma
    strcpy(procesa, strtok(0, ","));  //captura hasta lo que esta tercera coma es decir, latitud
       memset(c_grados,0,10);//limpía los grados
       strncpy(c_grados,procesa,2);//captura los grados
        grados=atof(c_grados);      // pasa de alfanumerico o cadena a flotante

          // apunta a los minutos
         minutos=atof(&procesa[2])/60.0;  //lo pasa a grados
           latitud=grados+minutos;
       strcpy(procesa, strtok(0, ","));  //captura siguiente coma  //orientacion o signo de la lat
       if (procesa[0]=='S') latitud=-latitud;
   //ACONDICIONA PARA ENVIAR
            sprintf(texto,"lat=%f\r\n",latitud);
       UART1_Write_Text(texto);


  //  captura la longitud
       strcpy(procesa, strtok(0, ","));  //captura siguiente coma la longitud
     memset(c_grados,0,10);//limpía los grados
       strncpy(c_grados,procesa,3);//captura los grados  3 posiciones
          grados=atof(c_grados);
    // apunta a los minutos
         minutos=atof(&procesa[3])/60.0;  //lo pasa a grados
           longitud=grados+minutos;
       strcpy(procesa, strtok(0, ","));  //captura siguiente coma  //orientacion o signo de la long
       if (procesa[0]=='W') longitud=-longitud;
            sprintf(texto,"lon=%f\r\n\r\n",longitud);
          UART1_Write_Text(texto);

}


        //int bajas
void  int_bajas() iv 0x0018 ics ICS_AUTO
{

   if (TMR0IF_bit==1)
   {
    TMR0H=11;
    TMR0L=220;

    led2=!led2;


   TMR0IF_bit=0;
   }

   if(INT1F_bit==1)
   {
   led=!led;


    INT1F_bit=0; // limpia la bandera
   }


}



          //altas
void INTERRPCION_altas() iv 0x0008 ics ICS_AUTO
{
 
   if (RCIF_bit==1)
   {
          dato_rx=UART1_Read();
          // AANLIZA LOS
           switch (estado_rec)
           {
           case cap_P:
                       trama_rx[puntero_rx]=dato_rx;
                       if (dato_rx!='P') puntero_rx=0;    //no fue el dato que me interesa
                       else
                       {
                          puntero_rx++;//incrementa contador para proximo dato
                          estado_rec=cap_G; //pasa al estado de capturar la g
                       }
                     break;

             case cap_G:
                       trama_rx[puntero_rx]=dato_rx;
                       if (dato_rx!='G')
                       {
                       puntero_rx=0;
                       estado_rec=cap_P; //regresa al estado inical
                       }
                       else
                       {
                          puntero_rx++;//incrementa contador para proximo dato
                         estado_rec=cap_G2; //pasa al estado de capturar la g
                       }
                     break;

           case cap_G2:
                       trama_rx[puntero_rx]=dato_rx;
                       if (dato_rx!='G')
                       {
                       Puntero_rx=0;
                       estado_rec=cap_P; //regresa al estado inical
                       }
                       else
                       {
                          puntero_rx++;//incrementa contador para proximo dato
                          estado_rec=cap_A; //pasa al estado de capturar la a
                       }
                     break;


           case cap_A:
                       trama_rx[puntero_rx]=dato_rx;
                       if (dato_rx!='A')
                       {
                       puntero_rx=0;
                       estado_rec=cap_P; //regresa al estado inical

                       }
                       else
                       {
                          puntero_rx++;//incrementa contador para proximo dato
                          estado_rec=esp_final; //pasa al estado de capturar la u
                       }

                     break;

           case esp_final:
                       trama_rx[puntero_rx]=dato_rx;
                       puntero_rx++;
                       if (dato_rx=='*')
                       {
                        RCIE_bit=0; ///   DESHABILITA INR
                        estado_rec=cap_P; //regresa al estado inical
                        puntero_rx=0;
                        flag_rx=1;
                       }
                       break;

               }//fin del switch

   
   
   RCIF_bit=0;
   }
 
 
   if(INT0F_bit==1)
   {
   led3=!led3;
   
   
    INT0F_bit=0; // limpia la bandera
   }
   
   
   if (TMR1IF_bit==1)
   
   
   {

     //1) valor inicial   para 200ms
    TMR1H=60;
    TMR1L=175;
       // hace su codigo
       led1=!led1;
   
   TMR1IF_bit=0;
   }
   


}


void main()
{

//todo digital;
ADCON1=0b1111;
// salida
TRISA=0;
TRISB=0 ;
TRISC=0;
TRISD=0;
TRISE=0;

TRISC7_bit=1; // enbtrada rx
TRISB0_bit=1; // entrda pulsador
TRISB1_bit=1; // entrda pulsador


INTCON=0B00000000;//

UART1_Init(9600);
PWM1_Init(300);
///PWM1_Set_Duty(127);
PWM1_Start();
  UART1_Write_Text("HOLA MUNDO");
  RCEN_bit=1; // habilita la recepcion continua

   // AUTORIZAR INT0
   INT0F_bit=0; /// LIMPIA LA BENDERA
   INT0E_bit=1; // AUTORIZA INT PROPIA
   INTEDG0_bit=0; // FLANCO DE BAJADOS

   // AUTORIZAR INT1
   INT1F_bit=0; /// LIMPIA LA BENDERA
   INT1E_bit=1; // AUTORIZA INT PROPIA
   INTEDG1_bit=0; // FLANCO DE BAJADOS
    INT1IP_bit=0;  // baja priorida

   // CONFIGURACION TIMER1
   T1CON=0;
    //1) valor inicial   para 200ms
    TMR1H=60;
    TMR1L=175;
   // 2)  prescalador  4
   T1CKPS1_bit=1;
   T1CKPS0_bit=0;
   
   // conigura interrpccion timer
   TMR1IF_bit=0;  //limpia bandera
   TMR1IE_bit=1;// habilita la INTERRPCION
   
   TMR1ON_bit=1; //prende
   TMR1IP_bit=1; // prioridad alta
   

    // timer cero
       T0CON=0;
    //cargar timer
    TMR0H=11;
    TMR0L=220;
    // preescalador   16   1 S
    
    T0PS2_bit=0;
    T0PS1_bit=1;
    T0PS0_bit=1;
    
    // INTERRPCION
    TMR0IF_bit=0;
    TMR0IE_bit=1;

     T08BIT_bit=0; // trabaja 16 bit
    TMR0ON_bit=1;  // prende timer 0
     TMR0IP_bit=0;// prioridad alta
     
     // configuracion int serial
        RCIP_bit=1; // alta prioridad
        RCIF_bit=0;//limpia la bansera
        RCIE_bit=1; // habilita la interrupcion
        
        CREN_bit=1; // habilita la recepcion continua

     


   IPEN_bit=1;  // autoroizsa prioridas
   
   
   
    GIEL_bit=1; // aurotiza las bajas
   GIE_bit=1; // AUTORIZA LAS INTERRPCIONES  altas




  while (1)
  {
      ledmain=!ledmain;
  
    // lee la trama hasta llegue el * o 30 datos
     //   UART1_read_Text(trama_rx,"*",30);   //  semibloqueante
   
       if(flag_rx==1)
       {
     // procesa_rx();
        procesa_gps();
         //si esta en bocagrande lat=10.410119  lon=-75.550567
                   //MENOR                   MAYOR                      MAYOR(-)                 MENOR(-)
     if ( (latitud>10.3983526) && (latitud<10.4169007) && (longitud>-75.5575188) && (longitud<-75.550437))  ledrx1=1; else ledrx1=0;

     
     
     RCIF_bit=0;
     puntero_rx=0;


     CREN_bit=0; //limpia buffer
     CREN_bit=1;  // habilitar la recpcion

     RCIE_bit=1; // habilita la interrpcion

       flag_rx=0;
       
       }
       


  

  Delay_ms(500);
  
  }




}