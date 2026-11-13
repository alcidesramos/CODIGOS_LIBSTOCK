#line 1 "C:/Users/Alcides Ramos/Desktop/Evasor 2021/canal/evasor.c"
const unsigned char cristal=Clock_MHz();



sbit disparo at LATB1_bit;
#line 33 "C:/Users/Alcides Ramos/Desktop/Evasor 2021/canal/evasor.c"
sbit led at LATC0_bit;
char texto[20];

unsigned int contador=0;
float distancia;


void md_quieto()
{
  LATB2_bit =0;
  LATB3_bit =0;
}


void md_adelante()
{
  LATB2_bit =1;
  LATB3_bit =0;
}


void md_atras()
{
  LATB2_bit =0;
  LATB3_bit =1;
}


void mi_quieto()
{
  LATB4_bit =0;
  LATB5_bit =0;
}


void mi_adelante()
{
  LATB4_bit =0;
  LATB5_bit =1;
}



void mi_atras()
{
  LATB4_bit =1;
  LATB5_bit =0;
}





 void quieto()
 {
 md_quieto();
 mi_quieto();
 }


 void adelante(unsigned char velo)
 {

 PWM1_Set_Duty(velo);
 PWM2_Set_Duty(velo);
 md_adelante();
 mi_adelante();

 }


 void atras(unsigned char velo)
 {
 PWM1_Set_Duty(velo);
 PWM2_Set_Duty(velo);
 md_atras();
 mi_atras();
 }


 void derecha(unsigned char velo)
 {
 PWM1_Set_Duty(velo);
 PWM2_Set_Duty(velo);
 mi_adelante();
 md_atras();
 }


 void izquierda(unsigned char velo)
 {
 PWM1_Set_Duty(velo);
 PWM2_Set_Duty(velo);

 md_adelante();
 mi_atras();
 }





char LEEBIT (char *port, char bit1)
{

 if ((*port & (1 << bit1))>0) return (1);
 else return (0);
}

float lee_distancia(char *puerto,char pin)
{
 float calculo;



 disparo=1;
 Delay_us(10);
 disparo=0;


 TMR1ON_bit=0;
 TMR1L=0;
 TMR1h=0;
 TMR1IF_bit=0;
 TMR1ON_bit=1;

 while (LEEBIT(puerto,pin)==0)

 {
 if ( TMR1IF_bit==1)
 {

 return (-1);
 break;
 }
 }

 TMR1ON_bit=0;
 TMR1L=0;
 TMR1h=0;
 TMR1IF_bit=0;
 TMR1ON_bit=1;
 while (LEEBIT(puerto,pin)==1)
 {
 if ( TMR1IF_bit==1)
 {
 return (0);
 break;
 }
 }

 TMR1ON_bit=0;
 contador=(TMR1H <<8) | TMR1L;

 calculo=(float) contador*1.0/( (cristal/4.0) ) ;
 calculo=calculo/58.0;
 return (calculo);
 }

 void sonar()
 {
 distancia=lee_distancia(&PORTB, 0 );
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

 ANSELA=0;
 ANSELB=0;
 ANSELC=0;



 TRISA0_bit =1;
 TRISA1_bit =1;
 TRISA2_bit =1;

 TRISB2_bit =0;
 TRISB3_bit =0;
 TRISB4_bit =0;
 TRISB5_bit =0;


TRISC1_bit=0;
TRISC2_bit=0;


TRISB1_bit=0;


TRISB0_bit=1;

TRISC6_bit=0;
TRISC7_bit=1;

TRISC0_bit=0;

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
