#define velo_linea   150
#define velo_giro     50


  //define los niveles digitales
#define negro 1
#define blanco 0

//entrada de los 3 sensores CNY70
#define SI RA2_bit   //sensor de la izquierda
#define SC RA4_bit   //sensor del centro
#define SD RA5_bit   //sensor d ela derecha
//  CONFIGURA PINES
#define SI_DIR TRISA2_bit   //sensor de la izquierda
#define SC_DIR TRISA4_bit   //sensor del centro
#define SD_DIR TRISA5_bit   //sensor d ela derecha


 //salida motor Derecha
#define MD1 LATC0_bit
#define MD2 LATC1_bit
// CONFIGURA PINES
#define MD1_DIR TRISC0_bit
#define MD2_DIR TRISC1_bit


//salida motor Izquierda
#define MI1  LATC2_bit
#define MI2  LATC4_bit
#define MI1_DIR TRISC2_bit
#define MI2_DIR TRISC4_bit
//detiene motor derecha
void   md_quieto()
{
  MD1=0;
  MD2=0;
}

//gira adelante motor derecha
void   md_alante()
{
  MD1=1;
  MD2=0;
}

//gira atras moto Derecha
void   md_atras()
{
  MD1=0;
  MD2=1;
}

//motor izquierda    quieto
void   mi_quieto()
{
  MI1=0;
  MI2=0;
}

//motor izquierda gira alante
void   mi_alante()
{
  MI1=0;
  MI2=1;
}


//motor izquierda gira atras
void   mi_atras()
{
  MI1=1;
  MI2=0;
}




//el carro se queda quieto
 void quieto()
 {
  md_quieto();
  mi_quieto();
 }
 
 //carro avanza adelante
  void alante(unsigned char velo)
 {
  PWM1_Set_Duty(velo);// VELOCIDAD INICIAL DEL PWM D ELOS MOTORES
  PWM2_Set_Duty(velo);// VELOCIDAD INICIAL DEL PWM D ELOS MOTORES
  md_alante();
  mi_alante();

 }

//el carro retrocede
  void atras(unsigned char velo)
 {
 PWM1_Set_Duty(velo);// VELOCIDAD INICIAL DEL PWM D ELOS MOTORES
 PWM2_Set_Duty(velo);// VELOCIDAD INICIAL DEL PWM D ELOS MOTORES
  md_atras();
  mi_atras();
 }

//el carro gira a la derecha
 void derecha(unsigned char velo)
 {
 PWM1_Set_Duty(velo);// VELOCIDAD INICIAL DEL PWM D ELOS MOTORES
  PWM2_Set_Duty(velo);// VELOCIDAD INICIAL DEL PWM D ELOS MOTORES
  mi_alante();
  md_atras();
 }

//el carro gira a la izquierda
 void izquierda(unsigned char velo)
 {
  PWM1_Set_Duty(velo);// VELOCIDAD INICIAL DEL PWM D ELOS MOTORES
  PWM2_Set_Duty(velo);// VELOCIDAD INICIAL DEL PWM D ELOS MOTORES

  md_alante();
  mi_atras();
 }


 void analiza_sensores()
 {
   if ((SI==negro) &&  (SC==negro) &&(SD==negro) )           izquierda(velo_giro);
      else  if  ((SI==negro) &&  (SC==negro) && (SD==blanco) )  izquierda(velo_giro);
      else if  ((SI==negro) &&  (SC==blanco) && (SD==negro) )     alante(velo_giro);  // imposible
      else if  ((SI==negro) &&  (SC==blanco) && (SD==blanco) )   izquierda(velo_giro);
      else if  ((SI==blanco) &&  (SC==negro) && (SD==negro) )    derecha(velo_giro);
      else if  ((SI==blanco) &&  (SC==negro) && (SD==blanco) )    alante(velo_linea);
      else if  ((SI==blanco) &&  (SC==blanco) && (SD==negro) )   derecha(velo_giro);
      else if  ((SI==blanco) &&  (SC==blanco) && (SD==blanco) )   alante(velo_linea);  //

 }


void main() 
{
 //configuración Oscilador
OSCCON=0;
OSCTUNE=0; //frecuancia centrada
// Para Trabajar a 32 MHz con PLL

//oscilador  Puesto en la palabra de configuracion
SCS1_bit=0;
SCS0_bit=0;


//OScialdor Interno a 8 MHZ
IRCF3_bit=1;
IRCF2_bit=1;
IRCF1_bit=1;
IRCF0_bit=0;

//todo digital
ANSELA=0;
ANSELC=0;

// CONFIGURA ENTRADAS Y SALIDAS
SI_DIR=1;
SC_DIR=1;
SD_DIR=1;

MD1_DIR=0;
MD2_DIR=0;
MI1_DIR=0;
MI2_DIR=0;

// SALIDA PINES PWM
TRISC3_bit=0;
TRISC5_bit=0;

SPLLEN_bit=0; //prende el PLL por 4  da 32MHZ  si es cero da 8 MHZ

 PWM1_Init(250);
 PWM2_Init(250);

 PWM1_Set_Duty(127);// VELOCIDAD INICIAL DEL PWM D ELOS MOTORES
 PWM2_Set_Duty(127);// VELOCIDAD INICIAL DEL PWM D ELOS MOTORES

  PWM1_Start();
  PWM2_Start();
 //ENTRADA LED
   while (1)
   {
      analiza_sensores();
      Delay_ms(1);
   
   
   }

}