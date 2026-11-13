#line 1 "C:/Users/Alcides Ramos/Desktop/PID VELOCIDAD/Canal/PIC/lazo abierto/open.c"



unsigned int codigo;
float set_point;
signed int salida=0;


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

 TMR1ON_bit=0;
 contador=(TMR1H<<8)| TMR1L;
 flag_cero=1;
 TMR1H=0;
 TMR1L=0;
 TMR1ON_bit=1;

 }

 INTF_bit=0;

 }
void floattostr_(float numero_, unsigned char *cadena_,char decimales_)
{

int largo_entera,largo_n,cont_for,tempo_int;
double tempo_float;

largo_n = decimales_+1;
largo_entera = 0;

if ( numero_ < 0)
 {
 *cadena_++ = '-';
 numero_ = -numero_;
 }

if (numero_ > 0.0) while (numero_ < 1.0)
 {
 numero_ =numero_* 10.0;
 largo_entera--;
 }


while (numero_ >= 10.0)
 {
 numero_ = numero_/10.0;
 largo_entera++;
 }
 largo_n = largo_n+largo_entera;



for (tempo_float = cont_for = 1; cont_for < largo_n; cont_for++)
 tempo_float = tempo_float/10.0;
numero_ += tempo_float/2.0;
if (numero_ >= 10.0) {numero_ = 1.0; largo_entera++;}

if (largo_entera<0)
 {
 *cadena_++ = '0'; *cadena_++ = '.';
 if (largo_n < 0) largo_entera = largo_entera-largo_n;
 for (cont_for = -1; cont_for > largo_entera; cont_for--) *cadena_++ = '0';
 }
for (cont_for=0; cont_for < largo_n; cont_for++)
 {
 tempo_int = numero_;
 *cadena_++ = tempo_int + 48;
 if (cont_for == largo_entera ) *cadena_++ = '.';
 numero_ -= (tempo_float=tempo_int);
 numero_ = numero_*10.0;
 }
*cadena_ =0;
}




void main()
{
ADCON1=0;
TRISA=255;
TRISB=0;
TRISC=0;

TRISB0_bit=1;

TRISC7_bit=1;

NOT_RBPU_bit=0;

UART1_Init(19200);
UART1_Write_Text_const("Iniciando");

PWM1_Init(620);
PWM1_Set_Duty(0);
PWM1_Start();

ADC_Init();


INTCON=0b01000000;






 t1con=0;


 T1CKPS1_bit=1;
 T1CKPS0_bit=1;


 TMR1L=0;
 TMR1H=0;

 TMR1ON_bit=0;


 INTEDG_bit=1;

 INTF_bit=0;

 INTE_bit=1;

 GIE_bit=1;




 while (1)

 {

 codigo=ADC_Get_Sample(0);
 set_point= 0.0635*codigo + 5.0;;



 if (flag_cero!=0) frecuencia=(Clock_kHz()*1e3)/(8.0*contador*4.0);

 flag_cero=0;

 if (set_point>frecuencia) PWM1_Set_Duty(255);
 else PWM1_Set_Duty(0);



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
