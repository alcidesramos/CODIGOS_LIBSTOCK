#line 1 "C:/Users/Alcides Ramos/Desktop/Evasor 2021/canal/evasor.c"
const unsigned char cristal=Clock_MHz();



sbit disparo at LATB1_bit;
#line 20 "C:/Users/Alcides Ramos/Desktop/Evasor 2021/canal/evasor.c"
enum estado_dir {avante,avante_time_d,avante_time_i,babor,estribor} ;
char dir_estado=avante;


signed long rumbo=0,limite_giro= 2 ;
unsigned int limite_tiempo=0;
unsigned int tiempo=0;


char flag_giro=0;
char flag_tiempo=0;
char flag_dir=0;
char flag_giro_ok=0;
#line 62 "C:/Users/Alcides Ramos/Desktop/Evasor 2021/canal/evasor.c"
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





void InitTimer0(){
 T0CON = 0x88;
 TMR0H = 0xD8;
 TMR0L = 0xF0;
 GIE_bit = 1;
 TMR0IE_bit = 1;
}

void Interrupt(){

 if (TMR0IF_bit){
 TMR0IF_bit = 0;
 TMR0H = 0xD8;
 TMR0L = 0xF0;

 if (flag_dir!= 2 )
 {
 if (flag_dir== 0 ) rumbo++;
 else rumbo--;
 if (rumbo==limite_giro)
 {
 TMR0IE_bit=0;
 flag_giro=1;

 }
 }
 else
 {
 tiempo++;
 if (tiempo>=limite_tiempo)
 {
 TMR0IE_bit=0;
 tiempo=0;
 flag_tiempo=1;
 }
 }


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



 T1CON = 0;

 T1CKPS1_bit = 0;
 T1CKPS0_bit = 0;


 Disparo = 0;

 UART1_Init(9600);

 PWM1_Init(250);
 PWM2_Init(250);
 PWM1_Set_Duty(100);
 PWM2_Set_Duty(100);
 PWM1_Start();
 PWM2_Start();
 UART1_Write_Text("Inciciando\r\n");
#line 353 "C:/Users/Alcides Ramos/Desktop/Evasor 2021/canal/evasor.c"
 while(1)
 {
 sonar();
 switch (dir_estado)
 {
 case avante:
 adelante(100);

 if (distancia<= 10 )
 {
 dir_estado=babor;
 limite_giro= 105 ;
 flag_dir= 0 ;
 InitTimer0();
 flag_giro_ok=0;
 derecha(100);
 }

 break;

 case avante_time_d:

 if (flag_tiempo==1)
 {
 flag_tiempo=0;
 dir_estado=estribor;
 limite_giro=0;
 flag_dir= 1 ;
 InitTimer0();
 izquierda(100);
 while(flag_giro==0);
 flag_giro=0;
 dir_estado=avante;


 }


 break;

 case avante_time_i:

 if (flag_tiempo==1)
 {
 flag_tiempo=0;
 dir_estado=babor;
 limite_giro=0;
 flag_dir= 0 ;
 InitTimer0();
 derecha(100);
 while(flag_giro==0);
 flag_giro=0;
 dir_estado=avante;


 }


 break;

 case BABOR:
 if (distancia>=30) flag_giro_ok=1;

 if (flag_giro==1)
 {
 flag_giro=0;
 if (flag_giro_ok==1)
 {
 dir_estado=avante_time_d;
 limite_tiempo= 200 ;
 flag_dir= 2 ;
 InitTimer0();
 flag_tiempo=0;
 flag_giro=0;
 adelante(100);

 }
 else
 {
 dir_estado=estribor;
 limite_giro= -105 ;
 flag_dir= 1 ;
 InitTimer0();
 flag_giro_ok=0;
 izquierda(100);
 }
 }

 break;

 case estribor:
 if (flag_giro==1)
 {
 flag_giro=0;
 dir_estado=avante_time_i;
 limite_tiempo= 200 ;
 flag_dir= 2 ;
 InitTimer0();
 flag_tiempo=0;
 flag_giro=0;
 adelante(100);

 }
 break;





 }






 }



 while (1)
 {
 basico();

 }



}
