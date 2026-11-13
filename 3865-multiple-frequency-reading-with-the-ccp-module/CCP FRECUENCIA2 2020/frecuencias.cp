#line 1 "C:/Users/Alcides Ramos/Desktop/CCP FRECUENCIA/frecuencias.c"

sbit led at LATC0_bit;

char texto[50];

float frecuencia1=0,frecuencia2=0,frecuencia3=0,frecuencia4;

unsigned int pulsos1=0,pulsos2=0,pulsos3=0,pulsos4=0;
unsigned int pulsos1_1=0,pulsos1_2=0,pulsos2_1=0,pulsos2_2=0,pulsos3_1=0,pulsos3_2=0,pulsos4_1=0,pulsos4_2=0;

char interrupcionfrec_flag=0;

sbit procesa1flag at interrupcionfrec_flag.b0;
sbit procesa2flag at interrupcionfrec_flag.b1;
sbit procesa3flag at interrupcionfrec_flag.b2;
sbit procesa4flag at interrupcionfrec_flag.b3;

sbit flag_frec1 at interrupcionfrec_flag.b4;
sbit flag_frec2 at interrupcionfrec_flag.b5;
sbit flag_frec3 at interrupcionfrec_flag.b6;
sbit flag_frec4 at interrupcionfrec_flag.b7;

void config_captura1()
{
 TRISC5_bit=1;


 T1CON=0;
 T1GCON=0;


 T1CKPS1_bit=0;
 T1CKPS0_bit=0;


 TMR1L=0;
 TMR1H=0;


 CCP1CON=0;


 CCP1M3_bit=0;
 CCP1M2_bit=1;
 CCP1M1_bit=0;
 CCP1M0_bit=1;

 CCP1IF_bit=0;
 CCP1IE_bit=1;
 TMR1ON_bit=1;

}



void config_captura2()
{
 CCP2SEL_bit=1;
 TRISA5_bit=1;


 T1CON=0;
 T1GCON=0;


 T1CKPS1_bit=0;
 T1CKPS0_bit=0;


 TMR1L=0;
 TMR1H=0;



 CCP2CON=0;


 CCP2M3_bit=0;
 CCP2M2_bit=1;
 CCP2M1_bit=0;
 CCP2M0_bit=1;

 CCP2IF_bit=0;
 CCP2IE_bit=1;
 TMR1ON_bit=1;

}


void config_captura3()
{
 TRISA2_bit=1;


 t1con=0;


 T1CKPS1_bit=0;
 T1CKPS0_bit=0;


 TMR1L=0;
 TMR1H=0;




 CCP3CON=0;


 CCP3M3_bit=0;
 CCP3M2_bit=1;
 CCP3M1_bit=0;
 CCP3M0_bit=1;

 CCP3IF_bit=0;
 CCP3IE_bit=1;

 TMR1ON_bit=1;
}



void config_captura4()
{
 TRISC1_bit=1;


 t1con=0;


 T1CKPS1_bit=0;
 T1CKPS0_bit=0;


 TMR1L=0;
 TMR1H=0;



 CCP4CON=0;


 CCP4M3_bit=0;
 CCP4M2_bit=1;
 CCP4M1_bit=0;
 CCP4M0_bit=1;

 CCP4IF_bit=0;
 CCP4IE_bit=1;
 TMR1ON_bit=1;
}


 void INTERRUPCION() iv 0x0004 ics ICS_AUTO

 {

 if (CCP1IF_bit==1)
 {
 if (procesa1flag==0)
 {
 procesa1flag=1;
 pulsos1_2=(CCPR1h << 8 ) | CCPR1l;
 TMR1ON_bit=1;
 if (pulsos1_2>=pulsos1_1) pulsos1=pulsos1_2-pulsos1_1;
 else pulsos1=(65535-pulsos1_1)+pulsos1_2;
 pulsos1_1=pulsos1_2;
 flag_frec1=1;
 procesa1flag=0;
 }
 CCP1IF_bit=0;

 }

 if (CCP2IF_bit==1)
 {
 if (procesa2flag==0)
 {
 procesa2flag=1;
 pulsos2_2=(CCPR2h << 8 ) | CCPR2l;
 TMR1ON_bit=1;
 if (pulsos2_2>=pulsos2_1) pulsos2=pulsos2_2-pulsos2_1;
 else pulsos2=(65535-pulsos2_1)+pulsos2_2;
 pulsos2_1=pulsos2_2;
 flag_frec2=1;
 procesa2flag=0;
 }
 CCP2IF_bit=0;

 }


 if (CCP3IF_bit==1)
 {
 if (procesa3flag==0)
 {
 procesa3flag=1;
 pulsos3_2=(CCPR3h << 8 ) | CCPR3l;
 TMR1ON_bit=1;
 if (pulsos3_2>=pulsos3_1) pulsos3=pulsos3_2-pulsos3_1;
 else pulsos3=(65535-pulsos3_1)+pulsos3_2;
 pulsos3_1=pulsos3_2;
 flag_frec3=1;
 procesa3flag=0;
 }
 CCP3IF_bit=0;

 }

 if (CCP4IF_bit==1)
 {
 if (procesa4flag==0)
 {
 procesa4flag=1;
 pulsos4_2=(CCPR4h << 8 ) | CCPR4l;
 TMR1ON_bit=1;
 if (pulsos4_2>=pulsos4_1) pulsos4=pulsos4_2-pulsos4_1;
 else pulsos4=(65535-pulsos4_1)+pulsos4_2;
 pulsos4_1=pulsos4_2;
 flag_frec4=1;
 procesa4flag=0;
 }
 CCP4IF_bit=0;

 }

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




void procesa_frecuencias()
{

 frecuencia1=0,frecuencia2=0,frecuencia3=0;frecuencia4=0;

 if (flag_frec1==1)
 {
 if (pulsos1!=0) frecuencia1=Clock_kHz()*1e3/(pulsos1*4.0);
 flag_frec1=0;
 }




 if (flag_frec2==1)
 {
 if (pulsos2!=0) Frecuencia2=Clock_kHz()*1e3/(pulsos2*4.0);
 flag_frec2=0;
 }



 if (flag_frec3==1)
 {
 if (pulsos3!=0) frecuencia3=Clock_kHz()*1e3/(pulsos3*4.0);
 flag_frec3=0;
 }



 if (flag_frec4==1)
 {
 if (pulsos4!=0) frecuencia4=Clock_kHz()*1e3/(pulsos4*4.0);
 flag_frec4=0;
 }

}

void main()
{

OSCCON=0;
OSCTUNE=0;

SCS1_bit=1;
SCS0_bit=0;


IRCF3_bit=1;
IRCF2_bit=1;
IRCF1_bit=1;
IRCF0_bit=0;

INTCON=0b01000000;

ansela=0;
anselc=0;


TRISA=0xFF;
trisc=0xFF;
TRISA0_bit=0;
TRISC0_bit=0;

UART1_Init(9600);

TRISA0_bit=0;
TRISC3_bit=0;

WPUA=0;
WPUC=0;


RXDTSEL_bit=1;
TXCKSEL_bit=1;





 config_captura1();
 config_captura2();
 config_captura3();
 config_captura4();

 NOT_WPUEN_bit=0;

 WPUA2_bit=1;
 WPUA5_bit=1;
 WPUC1_bit=1;
 WPUC5_bit=1;

 UART1_Write_Text("INICIANDO\r\n");


 GIE_bit=1;

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
