#define led RC0_bit

#define led1 RC5_bit
#define led2 RC4_bit

//pines de direccion del motor
#define m11 RB0_bit
#define m12 RB1_bit


char luces[]={0b00000001,0b00000010,0b00000100,0b00001000,0b00010000,0b00100000,0b01000000,0b10000000};
char cuenta1=0;

sbit led3 at RA0_bit;
sbit sw  at RA1_bit;

char alargue=0;


//variables para capturar la trama
char trama_rx[30];
char procesa[30];

char dato_rx;

char cuenta=0;

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


void INTERRPCION() iv 0x0004 ics ICS_AUTO 
{
   if(INTF_bit==1)
   {
   led3=!led3;
   
   
    INTF_bit=0; // limpia la bandera
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
   
   
   if (TMR0IF_bit==1)
   {
   TMR0=100;
      alargue++;
      if (alargue>=100)      //10ms*100     1seg
      {
      led2=!led2;
      alargue=0;
      
      }
   
   TMR0IF_bit=0;
   }


}

void main()
{

//todo digital;

ADCON1=0b0111;
// salida
TRISA=0;
TRISB=0 ;
TRISC=0;
TRISC7_bit=1; // enbtrada rx
TRISB0_bit=1; // entrda pulsador
INTCON=0B01000000;//  BIT 6 =1  AUTORIZA INT PERIFERICOS MANDOS MEDIOS


UART1_Init(9600);
PWM1_Init(300);
PWM1_Set_Duty(127);
PWM1_Start();
  UART1_Write_Text("HOLA MUNDO");
  RCEN_bit=1; // habilita la recepcion continua

   // AUTORIZAR INT
   INTF_bit=0; /// LIMPIA LA BENDERA
   INTE_bit=1; // AUTORIZA INT PROPIA
   INTEDG_bit=0; // FLANCO DE BAJADOS
   
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

    // timer cero
    OPTION_REG=0;
    //cargar timer
    TMR0=100;
    // preescalador   64   10MS
    PS2_bit=1;
    PS1_bit=0;
    PS0_bit=1;
    
    // INTERRPCION
    TMR0IF_bit=0;
    TMR0IE_bit=1;



   
   
   GIE_bit=1; // AUTORIZA LAS INTERRPCIONES
   


  while (1)
  {
    // lee la trama hasta llegue el * o 30 datos
        UART1_read_Text(trama_rx,"*",30);   //  semibloqueante
        if (strstr(trama_rx,"led1="))      //led1=on*
             {
             if (strstr(trama_rx,"on")) led1=1;
            else led1=0;
            }
        
        else if (strstr(trama_rx,"led2="))      //led1=on*
             {
             if (strstr(trama_rx,"on")) led2=1;
            else led2=0;
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




  

  Delay_ms(500);
  
  }




}