 //LED
sbit led at LATC0_bit;

char texto[50]; //  mandar informacion serial

float  frecuencia1=0,frecuencia2=0,frecuencia3=0,frecuencia4;

unsigned int pulsos1=0,pulsos2=0,pulsos3=0,pulsos4=0;
unsigned int pulsos1_1=0,pulsos1_2=0,pulsos2_1=0,pulsos2_2=0,pulsos3_1=0,pulsos3_2=0,pulsos4_1=0,pulsos4_2=0;

char interrupcionfrec_flag=0;
//banderas de procesamiento de pulsos
sbit procesa1flag at interrupcionfrec_flag.b0;
sbit procesa2flag at interrupcionfrec_flag.b1;
sbit procesa3flag at interrupcionfrec_flag.b2;
sbit procesa4flag at interrupcionfrec_flag.b3;
//banderas de procesamiento de frecuencia
sbit flag_frec1 at interrupcionfrec_flag.b4;
sbit flag_frec2 at interrupcionfrec_flag.b5;
sbit flag_frec3 at interrupcionfrec_flag.b6;
sbit flag_frec4 at interrupcionfrec_flag.b7;

void config_captura1()
{
    TRISC5_bit=1;  //pin de captura como entrada

   //confIguracion del timer
     T1CON=0;
     T1GCON=0;

   //configura el preescalador  1
   T1CKPS1_bit=0;
   T1CKPS0_bit=0;

   //limpia registros del timer
   TMR1L=0;
   TMR1H=0;

  // configuracion ccp
  CCP1CON=0;

  //lo configura para capturar subida
  CCP1M3_bit=0;
  CCP1M2_bit=1;
  CCP1M1_bit=0;
  CCP1M0_bit=1;

  CCP1IF_bit=0; //limpi la bandera
  CCP1IE_bit=1;  // activa interupcion del modulo ccp2
  TMR1ON_bit=1;  //Arranca el timer

}



void config_captura2()
{
    CCP2SEL_bit=1; //CCP2 EN RA5   SINO EN RC3
    TRISA5_bit=1;  //pin de captura como entrada

   //confIguracion del timer
     T1CON=0;
     T1GCON=0;

   //configura el preescalador  1
   T1CKPS1_bit=0;
   T1CKPS0_bit=0;

   //limpia registros del timer
   TMR1L=0;
   TMR1H=0;


  // configuracion ccp
  CCP2CON=0;

  //lo configura para capturar subida
  CCP2M3_bit=0;
  CCP2M2_bit=1;
  CCP2M1_bit=0;
  CCP2M0_bit=1;

  CCP2IF_bit=0; //limpi la bandera
  CCP2IE_bit=1;  // activa interupcion del modulo ccp2
   TMR1ON_bit=1;  //Arranca el timer

}


void config_captura3()
{
  TRISA2_bit=1;  //pin de captura como entrada

//confguracion del timer
   t1con=0;

   //configura el preescalador  1
   T1CKPS1_bit=0;
   T1CKPS0_bit=0;

   //limpia registros del timer
   TMR1L=0;
   TMR1H=0;



  // configuracion ccp
  CCP3CON=0;

  //lo configura para capturar subida
  CCP3M3_bit=0;
  CCP3M2_bit=1;
  CCP3M1_bit=0;
  CCP3M0_bit=1;

  CCP3IF_bit=0; //limpi la bandera
  CCP3IE_bit=1;  // activa interupcion del modulo ccp3

 TMR1ON_bit=1;
}



void config_captura4()
{
  TRISC1_bit=1;  //pin de captura como entrada

//confguracion del timer
   t1con=0;

   //configura el preescalador  1
   T1CKPS1_bit=0;
   T1CKPS0_bit=0;

   //limpia registros del timer
   TMR1L=0;
   TMR1H=0;


  // configuracion ccp
  CCP4CON=0;

  //lo configura para capturar subida
  CCP4M3_bit=0;
  CCP4M2_bit=1;
  CCP4M1_bit=0;
  CCP4M0_bit=1;

  CCP4IF_bit=0; //limpi la bandera
  CCP4IE_bit=1;  // activa interupcion del modulo ccp4
  TMR1ON_bit=1;  // aRRANCA EL TIMERS
}


 void INTERRUPCION() iv 0x0004 ics ICS_AUTO

 {

    if (CCP1IF_bit==1) // si es del ccp1
  {
        if (procesa1flag==0) //solo entra si el dato ya fue procesado pro el programa principal
        {
         procesa1flag=1; // para evitar bug de reprocesamiento
        pulsos1_2=(CCPR1h << 8 ) | CCPR1l;   //captura el valor timer
         TMR1ON_bit=1;    // toca rrancar de nuevo el timers
         if (pulsos1_2>=pulsos1_1) pulsos1=pulsos1_2-pulsos1_1;
         else  pulsos1=(65535-pulsos1_1)+pulsos1_2;
         pulsos1_1=pulsos1_2;
         flag_frec1=1; //HABILITA BANDERA DE QUE TIENE DATO VALIDO DE FRECUANCIA 1
        procesa1flag=0;
         }
        CCP1IF_bit=0;

      }

     if (CCP2IF_bit==1)  //si la interrpcion es ccp2
  {
        if (procesa2flag==0)
        {
        procesa2flag=1;
        pulsos2_2=(CCPR2h << 8 ) | CCPR2l;   //captura
         TMR1ON_bit=1;    // toca rrancar de nuevo el timers
         if (pulsos2_2>=pulsos2_1) pulsos2=pulsos2_2-pulsos2_1;
         else  pulsos2=(65535-pulsos2_1)+pulsos2_2;
         pulsos2_1=pulsos2_2;
         flag_frec2=1; //HABILITA BANDERA DE QUE TIENE DATO VALIDO DE FRECUANCIA 2
        procesa2flag=0;
         }
        CCP2IF_bit=0;

      }


    if (CCP3IF_bit==1)
  {
        if (procesa3flag==0)
        {
        procesa3flag=1;
        pulsos3_2=(CCPR3h << 8 ) | CCPR3l;   //captura
         TMR1ON_bit=1;    // toca rrancar de nuevo el timers
         if (pulsos3_2>=pulsos3_1) pulsos3=pulsos3_2-pulsos3_1;
         else  pulsos3=(65535-pulsos3_1)+pulsos3_2;
         pulsos3_1=pulsos3_2;
         flag_frec3=1; //HABILITA BANDERA DE QUE TIENE DATO VALIDO DE FRECUANCIA 3
        procesa3flag=0;
         }
        CCP3IF_bit=0;

      }

    if (CCP4IF_bit==1)
  {
        if (procesa4flag==0)
        {
        procesa4flag=1;
        pulsos4_2=(CCPR4h << 8 ) | CCPR4l;   //captura
         TMR1ON_bit=1;    // toca rrancar de nuevo el timers
         if (pulsos4_2>=pulsos4_1) pulsos4=pulsos4_2-pulsos4_1;
         else  pulsos4=(65535-pulsos4_1)+pulsos4_2;
         pulsos4_1=pulsos4_2;
         flag_frec4=1; //HABILITA BANDERA DE QUE TIENE DATO VALIDO DE FRECUANCIA 4
         procesa4flag=0;
         }
        CCP4IF_bit=0;

      }

}

void floattostr_(float numero_, unsigned char *cadena_,char decimales_)
{
//variables temporales
int largo_entera,largo_n,cont_for,tempo_int;
double tempo_float;
//largo de la trama a armar en decimales
largo_n = decimales_+1;
largo_entera = 0;
// si es negativa coloca el -
if ( numero_ < 0)
  {
  *cadena_++ = '-';
  numero_ = -numero_;
  }
//si es menor que no multiplica por 10
if (numero_ > 0.0) while (numero_ < 1.0)
  {
  numero_ =numero_* 10.0;
  largo_entera--;
  }

  //realiza division varias veces hasta que sea menor que 10
while (numero_ >= 10.0)
  {
  numero_ = numero_/10.0;
  largo_entera++;   //sube el largo de la trama por ser deciaml
 }
 largo_n = largo_n+largo_entera;   //el largo es la decimal mas la parte entera

//round. numero_ is between 1 and 10 and largo_n will be printed to
// right of decimal point so rounding is ...
for (tempo_float = cont_for = 1; cont_for < largo_n; cont_for++)
  tempo_float = tempo_float/10.0;
numero_ += tempo_float/2.0;
if (numero_ >= 10.0) {numero_ = 1.0; largo_entera++;}
//si tiene decimales
if (largo_entera<0)
  {
   *cadena_++ = '0'; *cadena_++ = '.';
   if (largo_n < 0) largo_entera = largo_entera-largo_n;
   for (cont_for = -1; cont_for > largo_entera; cont_for--)  *cadena_++ = '0';
  }
for (cont_for=0; cont_for < largo_n; cont_for++)
  {
  tempo_int = numero_;
  *cadena_++ = tempo_int + 48;  //convierte a ascci
  if (cont_for ==  largo_entera ) *cadena_++ = '.';
  numero_ -= (tempo_float=tempo_int);
  numero_ = numero_*10.0;
  }
*cadena_ =0;    //anexa final de linea
}




void procesa_frecuencias()
{
 //pone en cero para poder resetear cuanbdo no hay
       frecuencia1=0,frecuencia2=0,frecuencia3=0;frecuencia4=0; //coloca en cero

       if (flag_frec1==1)
  {
       if (pulsos1!=0)  frecuencia1=Clock_kHz()*1e3/(pulsos1*4.0); //convierte a Hercios
       flag_frec1=0;
  } // SI ESTA ACYVA LA BANDERA DE FRECUENCIA 1



 //si esta activa la bandera de frecuencia 2
 if (flag_frec2==1)
  {
       if (pulsos2!=0) Frecuencia2=Clock_kHz()*1e3/(pulsos2*4.0); //convierte a Hercios
       flag_frec2=0;
  } // SI ESTA ACYVA LA BANDERA DE FRECUENCIA 2


  //si esta activa la bandera de frecuencia 3
 if (flag_frec3==1)
  {
       if (pulsos3!=0)  frecuencia3=Clock_kHz()*1e3/(pulsos3*4.0); //convierte a Hercios
   flag_frec3=0;
  } // SI ESTA ACYVA LA BANDERA DE FRECUENCIA 3


  //si esta activa la bandera de frecuencia 4
 if (flag_frec4==1)
  {
       if (pulsos4!=0) frecuencia4=Clock_kHz()*1e3/(pulsos4*4.0); //convierte a Hercios
        flag_frec4=0;
  } // SI ESTA ACYVA LA BANDERA DE FRECUENCIA 4

}

void main() 
{
  //configuración Oscilador
OSCCON=0;
OSCTUNE=0; //frecuancia centrada
//oscilador interno
SCS1_bit=1;
SCS0_bit=0;

//OScialdor Interno a 8 MHZ
IRCF3_bit=1;
IRCF2_bit=1;
IRCF1_bit=1;
IRCF0_bit=0;

INTCON=0b01000000; // mandos medios habilitado
//Todo Digital
ansela=0;
anselc=0;
//configuracon de los pines
//todo entrada
TRISA=0xFF;
trisc=0xFF;
TRISA0_bit=0;//Salida tx
TRISC0_bit=0; //Salida led

UART1_Init(9600);

TRISA0_bit=0; //salida LED
TRISC3_bit=0; //SALIDA HAB
//SIN PULL-UPS
WPUA=0;
WPUC=0;

//remapeo_pines();
RXDTSEL_bit=1; // RX en RA1  sino RC5
TXCKSEL_bit=1; // tX en RA0  sino RC4

//RXDTSEL_bit=0; // RX en RC5  sino RA1
//TXCKSEL_bit=0; // tX en RC4  sino RA0
//P1BSEL_bit=0;  //PWM_B   en RA0 sino RA4

   config_captura1();
   config_captura2();
   config_captura3();
   config_captura4();

    NOT_WPUEN_bit=0; //HABILITA PULL UPS
    
    WPUA2_bit=1; //pull up en el pin de RA2
    WPUA5_bit=1; //pull up en el pin RA5
    WPUC1_bit=1; //pull up en el pin RC1
    WPUC5_bit=1; //pull up en el pin RC5

   UART1_Write_Text("INICIANDO\r\n");

     // TMR1ON_bit=0;  //ARRANCA EL TIMER quieto
      GIE_bit=1;  //Autoriza LAS INTERRPCIONES

     while (1)
     
     {
        led=!led;
       procesa_frecuencias();
   floatToStr_(frecuencia1,texto,2);
    UART1_Write_Text(texto);
    UART1_Write_Text("     ");

    floatToStr_(frecuencia2,texto,2);
    UART1_Write_Text(texto);
    UART1_Write_Text("     ");

    floatToStr_(frecuencia3,texto,2);
    UART1_Write_Text(texto);
    UART1_Write_Text("     ");

    floatToStr_(frecuencia4,texto,2);
    UART1_Write_Text(texto);
    UART1_Write_Text("     ");


    UART1_Write_Text("\r\n");

       
        Delay_ms(1000);

     
     
     }



}