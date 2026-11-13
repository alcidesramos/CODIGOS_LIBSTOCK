


unsigned int codigo;
//float set_point;
signed int salida=0;

 // medidor de frecuencia
unsigned int contador=0;
float frecuencia;
char texto[20];
char flag_cero=0;


void UART1_Write_Text_const(const char* Text)

{
 while(*Text)UART1_Write(*Text++);
}

void INTERRPCION() iv 0x0004 ics ICS_AUTO
{

  if (INTF_bit==1)
  {

       TMR1ON_bit=0;  //para el conteo del timer
      contador=(TMR1H<<8)| TMR1L;  // arma los 16 bits del timer en contador
      flag_cero=1;
      TMR1H=0;
      TMR1L=0;
     TMR1ON_bit=1;  //para el conteo del timer

     }

  INTF_bit=0;

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




//variables pid
//float kp=40,ki=5,kd=10;
float kp=40,ki=1,kd=5;

float error,up,ui=0.0,ui_=0.0,error_=0.0,ud,ut;
float set_point=0;

void pid(float pid_in)

{const float max_x=255;
const float min_x=0;
const float t_muestreo=1;//4e-3;

//Calculando el error
error=set_point-pid_in;
   up=kp*error;
       ui=ui_ + (ki*t_muestreo*error);
       ud=kd*(error-error_)/t_muestreo;
        ut=up+ui+ud;
        if (ut>max_x) ut=max_x;
        if (ut<min_x) ut=min_x;
        ui_=ui;
        error_=error;

}


void main() 
{
ADCON1=0; // todo loanalogo como analogo
TRISA=255;
TRISB=0;
TRISC=0;

TRISB0_bit=1; // ENTRADA RPM

TRISC7_bit=1; // ENTRADA RX

NOT_RBPU_bit=0; //habilita pull up

UART1_Init(19200);
UART1_Write_Text_const("Iniciando");

PWM1_Init(620);
PWM1_Set_Duty(0);    //maxima velocidad
PWM1_Start();

ADC_Init();


INTCON=0b01000000;   // HABILITA INTERRPCIONES DE PERIFERICOS

       // CONFIGURACION TIMER1



  //configuracion del timer 1 para almacenar el ancho de pulso
   t1con=0;

   //configura el preescalador  8  // FRCUENCIAS BAJAS
   T1CKPS1_bit=1;
   T1CKPS0_bit=1;

   //limpia registros del timer
   TMR1L=0;
   TMR1H=0;

   TMR1ON_bit=0;  //timer quieto


  INTEDG_bit=1;  //interrupcion por flanco de nivel de subida

  INTF_bit=0;//Limpia la bandera de interrpción.

  INTE_bit=1;//Habilita la interrupción por cambio de nivel

  GIE_bit=1;  //Habilita interrupcioes       BIT  7 EL INTCON




  while (1)
  
  {
  
  codigo=ADC_Get_Sample(0);   //   0 -1023
   set_point= 0.0635*codigo + 5.0;;  // set point en ranfo de la frecuancia min y max 5 -70
    
    //PWM1_Set_Duty(codigo>>2);
   // se lee la frecuencia
   if (flag_cero!=0)   frecuencia=(Clock_kHz()*1e3)/(8.0*contador*4.0);  //8.0 ES EL PREESCALADOR
  // else    frecuencia=0;
   flag_cero=0;
    pid(frecuencia);
   salida=ut;
    
    PWM1_Set_Duty(salida);





    
    
    
      // SP=XXX/RPM=XXX/OUT=XXX/ ENTER
      
     FloatToStr_(set_point,texto,2);
   UART1_Write_Text_const("SP=") ;
   UART1_Write_Text(texto);
   UART1_Write('/');
   FloatToStr_(frecuencia,texto,2);
   UART1_Write_Text_const("RPM=");
   UART1_Write_Text(texto);
   UART1_Write('/');

  FloatToStr_(salida,texto,2);
   UART1_Write_Text_const("OUT=");
   UART1_Write_Text(texto);
   UART1_Write('/');
   UART1_Write_Text_const("\r\n");
   
   Delay_ms(80);
   

  
  
  }


}