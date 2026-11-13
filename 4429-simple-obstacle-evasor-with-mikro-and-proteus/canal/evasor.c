const unsigned char cristal=Clock_MHz();//obtiene el reloj en mega  usado en el projecto
#define  Frec_real (cristal/4.0)        //Frecuencia de trabajo real


sbit disparo at   LATB1_bit;

#define eco 0

//entrada de los 3 sensores CNY70
#define SI RA0_bit   //sensor de la izquierda
#define SC RA1_bit   //sensor del centro
#define SD RA2_bit   //sensor d ela derecha
//  CONFIGURA PINES
#define SI_DIR TRISA0_bit   //sensor de la izquierda
#define SC_DIR TRISA1_bit   //sensor del centro
#define SD_DIR TRISA2_bit   //sensor d ela derecha


 //salida motor Derecha
#define MD1 LATB2_bit
#define MD2 LATB3_bit
// CONFIGURA PINES
#define MD1_DIR TRISB2_bit
#define MD2_DIR TRISB3_bit


//salida motor Izquierda
#define MI1  LATB4_bit
#define MI2  LATB5_bit
#define MI1_DIR TRISB4_bit
#define MI2_DIR TRISB5_bit

sbit led  at LATC0_bit;
char texto[20]; // para almacenar la cadena

unsigned int contador=0;//valor del timer
float distancia;

 //detiene motor derecha
void   md_quieto()
{
  MD1=0;
  MD2=0;
}

//gira adelante motor derecha
void   md_adelante()
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
void   mi_adelante()
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


 void adelante(unsigned char velo)
 {

  PWM1_Set_Duty(velo);// VELOCIDAD INICIAL DEL PWM D ELOS MOTORES
  PWM2_Set_Duty(velo);// VELOCIDAD INICIAL DEL PWM D ELOS MOTORES
  md_adelante();
  mi_adelante();

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
  mi_adelante();
  md_atras();
 }

//el carro gira a la izquierda
 void izquierda(unsigned char velo)
 {
  PWM1_Set_Duty(velo);// VELOCIDAD INICIAL DEL PWM D ELOS MOTORES
  PWM2_Set_Duty(velo);// VELOCIDAD INICIAL DEL PWM D ELOS MOTORES

  md_adelante();
  mi_atras();
 }




//funcion para leer un bit de un registro
char LEEBIT (char *port, char bit1)
{

    if ((*port & (1 << bit1))>0) return (1);
    else return (0);
}

float lee_distancia(char *puerto,char pin)  //lee en el pin especificado
{
  float calculo;


 //pulso de disparo de 10us
  disparo=1;
  Delay_us(10);
  disparo=0;

  //limpia el contador
  TMR1ON_bit=0; //TIMER QUIETO
  TMR1L=0;// limpia parte baja
  TMR1h=0; //limpia parte alta
  TMR1IF_bit=0; //limpia la bandera de desboradmiento
  TMR1ON_bit=1; //Arranca el timer

       while (LEEBIT(puerto,pin)==0)

       {
        if (  TMR1IF_bit==1)  //si no hay objeto se va a desbordar el timer
            {

            return (-1);// si no hay sensor conectado retorna -1
            break;
            }
       }

  TMR1ON_bit=0; //TIMER QUIETO
  TMR1L=0;// limpia parte baja
  TMR1h=0; //limpia parte alta
  TMR1IF_bit=0; //limpia la bandera de desboradmiento
  TMR1ON_bit=1; //Arranca el timer
              while (LEEBIT(puerto,pin)==1)
       {
            if (  TMR1IF_bit==1)  //si no hay objeto se va a desbordar el timer
            {
            return (0);// si no hay eco
            break;
            }
       }

  TMR1ON_bit=0; //paro timer
   contador=(TMR1H <<8) |  TMR1L;   // arma el valor del timer rotando 8 la parte alta y sumando la baja

 calculo=(float) contador*1.0/(Frec_real) ;   //1.0 prescalador de 1
   calculo=calculo/58.0;
   return (calculo);
   }

  void sonar()
   {
   distancia=lee_distancia(&PORTB,eco);
sprintf(texto,"Distancia=%.1f\r\n",distancia);
    UART1_Write_Text(texto);
   }


 void basico()
 {
 sonar();
  if (distancia<=10)
   {
   atras(100);
   Delay_ms(50);
   derecha(50);
   Delay_ms(200);
   }
   else
   {
   adelante(100);
   Delay_ms(200);

   }


 }


void main()
{
// todo digirtal
  ANSELA=0;
  ANSELB=0;
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
TRISC1_bit=0;
TRISC2_bit=0;

//SALIDA DISPARO
TRISB1_bit=0;

// ENTRADA ECO
TRISB0_bit=1;

TRISC6_bit=0; // SALIDA tx
TRISC7_bit=1; // entrada rx

TRISC0_bit=0; // salida led

    Disparo = 0;

  UART1_Init(9600);

 PWM1_Init(250);
 PWM2_Init(250);
  PWM1_Set_Duty(100);
  PWM2_Set_Duty(100);
  PWM1_Start();
  PWM2_Start();
  UART1_Write_Text("Inciciando\r\n");


  while (1)
  {
    basico();

  }



}