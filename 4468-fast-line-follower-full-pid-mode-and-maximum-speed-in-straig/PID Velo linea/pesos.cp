#line 1 "C:/Users/Alcides Ramos/Desktop/Velocista/PID Velo linea/pesos.c"




unsigned int cont_linea=0;
signed int linea_actual;
#line 34 "C:/Users/Alcides Ramos/Desktop/Velocista/PID Velo linea/pesos.c"
char banderas=0;
#line 57 "C:/Users/Alcides Ramos/Desktop/Velocista/PID Velo linea/pesos.c"
char texto[200];



unsigned int lecturas[8];

unsigned int minimos[]={65535,65535,65535,65535,65535,65535,65535,65535};
unsigned int maximos[]={0,0,0,0,0,0,0,0};
unsigned int normalizados[8];

float pesos[]={-10.0,-5.0,-1.0,1.0,5.0,10.0};
float peso_anterior;

float velo_giro;
float velo_der,velo_izq;

 const float velo_basica=150.0;
const float velo_giro_max=130.0;







void config_timer1 ()
{
T1CON=0;

TMR1H=236;
TMR1L=120;

T1CKPS1_bit=0;
T1CKPS0_bit=0;

TMR1IF_bit=0;
TMR1ON_bit=0;
}




void config_salidas()
{
  TRISA0_bit =0;
  TRISA1_bit =0;
  TRISA2_bit =0;
  TRISA3_bit =0;
  TRISA4_bit =0;
  TRISA5_bit =0;
}


void config_entradas()
{
  TRISA0_bit =1;
  TRISA1_bit =1;
  TRISA2_bit =1;
  TRISA3_bit =1;
  TRISA4_bit =1;
  TRISA5_bit =1;
}


void saca_uno()
{
 LATA0_bit =1;
 LATA1_bit =1;
 LATA2_bit =1;
 LATA3_bit =1;
 LATA4_bit =1;
 LATA5_bit =1;
}

void analizasensoresir()
{
 char cuenta1;
 config_timer1();
  LATB2_bit =1;
 config_salidas();
 saca_uno();
 Delay_us(10);
 config_entradas();
 TMR1ON_bit=1;



 for (cuenta1=0;cuenta1<=8;cuenta1++) lecturas[cuenta1]=0;
 banderas=0;

 while (TMR1IF_bit==0)
 {


 if (( RA0_bit ==0) && (  banderas.b0 ==0))
 {
 lecturas[0]=(unsigned int)TMR1H<<8 |TMR1L;
  banderas.b0 =1;
 }


 if (( RA1_bit ==0) && (  banderas.b1 ==0))
 {
 lecturas[1]=(unsigned int)TMR1H<<8 |TMR1L;
  banderas.b1 =1;
 }


 if (( RA2_bit ==0) && (  banderas.b2 ==0))
 {
 lecturas[2]=(unsigned int)TMR1H<<8 |TMR1L;
  banderas.b2 =1;
 }


 if (( RA3_bit ==0) && (  banderas.b3 ==0))
 {
 lecturas[3]=(unsigned int)TMR1H<<8 |TMR1L;
  banderas.b3 =1;
 }


 if (( RA4_bit ==0) && (  banderas.b4 ==0))
 {
 lecturas[4]=(unsigned int)TMR1H<<8 |TMR1L;
  banderas.b4 =1;
 }



 if (( RA5_bit ==0) && (  banderas.b5 ==0))
 {
 lecturas[5]=(unsigned int)TMR1H<<8 |TMR1L;
  banderas.b5 =1;
 }
 }

  LATB2_bit =0;

}

void manda_sensores_ir()
{
 sprintf(texto,"s1=%u   s2=%u  s3=%u   s4=%u   s5=%u   s6=%u\r\n\r\n",lecturas[0],lecturas[1],lecturas[2],lecturas[3],lecturas[4],lecturas[5]);
 UART1_Write_Text(texto);

}


void adelante(unsigned char velo)
{
 LATB3_bit =0;
 LATB4_bit =0;
PWM1_Set_Duty(velo);
PWM2_Set_Duty(velo);
}


void atras(unsigned char velo)
{
 LATB3_bit =1;
 LATB4_bit =1;
PWM1_Set_Duty(velo);
PWM2_Set_Duty(velo);
}


void derecha(unsigned char velo)
{
 LATB3_bit =1;
 LATB4_bit =0;
PWM1_Set_Duty(velo);
PWM2_Set_Duty(velo);
}


void izquierda(unsigned char velo)
{
 LATB3_bit =0;
 LATB4_bit =1;
PWM1_Set_Duty(velo);
PWM2_Set_Duty(velo);
}

void quieto()
{
PWM1_Set_Duty(0);
PWM2_Set_Duty(0);
} void calibra_ir()
{
unsigned int cuenta2;
char cont;
 LATC0_bit =0;

 for (cuenta2=0; cuenta2<=200;cuenta2++)
 {
 for (cont=0; cont<6;cont++)
 {
 analizasensoresir();
 if (lecturas[cont]>=maximos[cont]) maximos[cont]=lecturas[cont];
 if (lecturas[cont]<=minimos[cont]) minimos[cont]=lecturas[cont];
 }
 }
  LATC0_bit =1;
 Delay_ms(500);
  LATC0_bit =0;

 }

 void manda_limites()
 {
 sprintf(texto,"min1=%u   min2=%u  min3=%u   min4=%u   min5=%u   min6=%u\r\n",minimos[0],minimos[1],minimos[2],minimos[3],minimos[4],minimos[5]);
 UART1_Write_Text(texto);
 sprintf(texto,"max1=%u   max2=%u  max3=%u   max4=%u   max5=%u   max6=%u\r\n\r\n",maximos[0],maximos[1],maximos[2],maximos[3],maximos[4],maximos[5]);
 UART1_Write_Text(texto);


 }



 void normaliza()
 {
 unsigned char cuenta;
 float min_temp,max_temp;
 float promedio;


 for (cuenta=0;cuenta<6;cuenta++)
 {
 min_temp=minimos[cuenta];
 max_temp=maximos[cuenta];
 promedio=(max_temp-min_temp)/2;
 if (lecturas[cuenta]>=(min_temp+promedio)) normalizados[cuenta]=1;
 else normalizados[cuenta]=0;

 }


 }



 void manda_normalizados()
 {
 sprinti(texto,"s1=%u   s2=%u  s3=%u   s4=%u   s5=%u   s6=%u\r\n\r\n",normalizados[0],normalizados[1],normalizados[2],normalizados[3],normalizados[4],normalizados[5]);
 UART1_Write_Text(texto);
 }


 float calcula_pesos()
{
 char cuenta;
 float numerador=0,denominador=0;
 float valor;
 for (cuenta=0;cuenta<6; cuenta++)
 {
 numerador=normalizados[cuenta]*pesos[cuenta]+numerador;
 denominador=normalizados[cuenta]+denominador;
 }


 if (denominador>=5.8)
 {
 if (peso_anterior>0) return(10.0);
 else if (peso_anterior<0) return(-10.0);
 }

 else if (denominador<=0.2)
 {
 if (peso_anterior>0) return(10.0);
 else if (peso_anterior<0) return(-10.0);
 }
 else
 valor=numerador/denominador;
 peso_anterior=valor;
 return(valor);

}

void manda_caculo_pesos()
{
 sprintf(texto,"desvio=%.1f \r\n\r\n",calcula_pesos());
 UART1_Write_Text(texto);
 }

 float map(float x, float in_min, float in_max, float out_min, float out_max)
{
 return (x - in_min) * (out_max - out_min) / (in_max - in_min) + out_min;
}

 void aplica_pwm(float pwm_vel)
 {
 velo_der=velo_basica-pwm_vel;
 velo_izq=velo_basica+pwm_vel;

 if (velo_der<0) velo_der=0;
 if (velo_der>255) velo_der=255;
 if (velo_izq<0) velo_izq=0;
 if (velo_izq>255) velo_izq=255;


  LATB3_bit =0;
  LATB4_bit =0;

 PWM1_Set_Duty(velo_der);
 PWM2_Set_Duty(velo_izq);
 }


 void aplica_pwm_fast(float pwm_vel)
 {
 velo_der=velo_basica-pwm_vel;
 velo_izq=velo_basica+pwm_vel;

 if (velo_der<-255) velo_der=-255;
 if (velo_der>255) velo_der=255;
 if (velo_izq<-255) velo_izq=-255;
 if (velo_izq>255) velo_izq=255;


 if (velo_der<=0)  LATB3_bit =1;
 else  LATB3_bit =0;

 if (velo_izq<=0)  LATB4_bit =1;
 else  LATB4_bit ==0;


 PWM1_Set_Duty(abs(velo_der));
 PWM2_Set_Duty(abs(velo_izq));
 }
 void proporcional(float pro_in)
 {

 velo_giro=map(pro_in,-10.0,10.0,-(float)velo_giro_max,(float)velo_giro_max);
 aplica_pwm(velo_giro);
 }



float kp=30,ki=0.1,kd=2;

float error,up,ui=0.0,ui_=0.0,error_=0.0,ud,ut;

float setpoint=0;
float max_x=velo_giro_max,min_x=-velo_giro_max;



 void PID(float pid_in)
 {
 const float t_muestreo=1;

 error=setpoint-pid_in;

 up=kp*error;

 ui=ui_ + (ki*t_muestreo*error);

 ud=kd*(error-error_)/t_muestreo;

 ut=up+ui+ud;


 if (ut>max_x) ut=max_x;
 if (ut<min_x) ut=min_x;

 ui_=ui;

 error_=error;

 aplica_pwm_fast(-ut);

 }

void velo_linea(float pwm_vel)
{
 error=error_ ;
 ui=0;

 velo_der=pwm_vel;
 velo_izq=pwm_vel;

 if (velo_der<0) velo_der=0;
 if (velo_der>255) velo_der=255;
 if (velo_izq<0) velo_izq=0;
 if (velo_izq>255) velo_izq=255;


  LATB3_bit =0;
  LATB4_bit =0;

 PWM1_Set_Duty(velo_der);
 PWM2_Set_Duty(velo_izq);


}


void main()
{

ANSELA=0;
ANSELB=0;
ANSELC=0;


 TRISC1_bit=0;
 TRISC2_bit=0;

  TRISB3_bit =0;
  TRISB4_bit =0;

  TRISB2_bit =0;



 TRISC0_bit=0;

 TRISB7_bit=1;
 TRISB6_bit=0;

 NOT_RBPU_bit=0;


 UART1_Init(9600);
 UART1_Write_Text("INICIANDO\r\n");

 PWM1_Init(250);
 PWM2_Init(250);

 PWM1_Set_Duty(0);
 PWM2_Set_Duty(0);
 PWM1_Start();
 PWM2_Start();

calibra_ir();
manda_limites();

while ( RB7_bit ==1);


while (1)
{
 analizasensoresir();
normaliza();



 linea_actual=calcula_pesos();

 if ((linea_actual>=-1 )&&(linea_actual<=1))
 {
 cont_linea++;
 }
 else cont_linea=0;

 if (cont_linea>=8)
 {
 velo_linea(255);
  LATB6_bit =! LATB6_bit ;
 }
 else PID(linea_actual);







 LATC0_bit =! LATC0_bit ;






}


}
