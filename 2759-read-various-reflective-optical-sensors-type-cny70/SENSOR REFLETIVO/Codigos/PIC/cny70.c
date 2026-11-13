sbit led at LATC0_bit;

unsigned int timer=0;//variable acumula contador del sensor

//pines sesnores
sbit s1_out at LATB0_bit;
sbit s1_in at RB0_bit;

sbit s2_out at LATB1_bit;
sbit s2_in at RB1_bit;

sbit s3_out at LATB2_bit;
sbit s3_in at RB2_bit;

sbit s4_out at LATB3_bit;
sbit s4_in at RB3_bit;

sbit s5_out at LATB4_bit;
sbit s5_in at RB4_bit;

sbit s6_out at LATB5_bit;
sbit s6_in at RB5_bit;

sbit s7_out at LATB6_bit;
sbit s7_in at RB6_bit;

sbit s8_out at LATB7_bit;
sbit s8_in at RB7_bit;

//banderas de la lectura de los sensores
char banderas=0;
sbit flag_s1 at banderas.b0;
sbit flag_s2 at banderas.b1;
sbit flag_s3 at banderas.b2;
sbit flag_s4 at  banderas.b3;
sbit flag_s5 at  banderas.b4;
sbit flag_s6 at  banderas.b5;
sbit flag_s7 at  banderas.b6 ;
sbit flag_s8 at  banderas.b7;

char texto[100];


//almacena el valor de la lectura
unsigned int lectura1,lectura2,lectura3,lectura4,lectura5,lectura6,lectura7,lectura8;


//configuracion del timer 1 13ms a 20mhz
void config_timer1 ()
{
T1CON=0;
TMR1H=0;
TMR1L=0;
//preescalador UNO
T1CKPS1_bit=0;
T1CKPS0_bit=0;
TMR1IF_bit=0;
TMR1ON_bit=0;
}

void config_salidas()//salida todos los sensores
{
trisb.b0=0;
trisb.b1=0;
trisb.b2=0;
trisb.b3=0;
trisb.b4=0;
trisb.b5=0;
trisb.b6=0;
trisb.b7=0;

}


void config_entradas()//entrada todos los sensores
{
trisb.b0=1;
trisb.b1=1;
trisb.b2=1;
trisb.b3=1;
trisb.b4=1;
trisb.b5=1;
trisb.b6=1;
trisb.b7=1;


}

//para sacar un uno en todo los sebsores
void saca_uno()
{
s1_out=1;
s2_out=1;
s3_out=1;
s4_out=1;
s5_out=1;
s6_out=1;
s7_out=1;
s8_out=1;

}

  //realiza la lectura actual de los sesnores
void analizasensoresir()
{
  config_timer1();// TIMER 13MS
  config_salidas();
  saca_uno();
  Delay_us(10);
  config_entradas();
  TMR1ON_bit=1; //prende el timer
  lectura1=lectura2=lectura3=lectura4=lectura5=lectura6=lectura7=0;  //limpia los registro de lectura
  banderas=0;    //limpi las bandera de los sesnores

  while (TMR1IF_bit==0)
  {
    if ((s1_in==0) && ( flag_s1==0))
    {
     lectura1=(unsigned int)TMR1H<<8 | TMR1L;
     flag_s1=1;
    }
    if ((s2_in==0) && ( flag_s2==0))
    {
     lectura2=(unsigned int)TMR1H<<8 |TMR1L;
     flag_s2=1;
    }

    if ((s3_in==0) && ( flag_s3==0))
    {
     lectura3=(unsigned int)TMR1H<<8 |TMR1L;
     flag_s3=1;
    }

    if ((s4_in==0) && ( flag_s4==0))
    {
     lectura4=(unsigned int)TMR1H<<8 |TMR1L;
     flag_s4=1;
    }

    if ((s5_in==0) && ( flag_s5==0))
    {
     lectura5=(unsigned int)TMR1H<<8 |TMR1L;
     flag_s5=1;
    }

    if ((s6_in==0) && ( flag_s6==0))
    {
     lectura6=(unsigned int)TMR1H<<8 |TMR1L;
     flag_s6=1;
    }

    if ((s7_in==0) && ( flag_s7==0))
    {
     lectura7=(unsigned int)TMR1H<<8 |TMR1L;
     flag_s7=1;
    }


    if ((s8_in==0) && ( flag_s8==0))
    {
     lectura8=(unsigned int)TMR1H<<8 |TMR1L;
     flag_s8=1;
    }

  
  }
  
  

}

void main()
{
adcon1=0b1111;// TODO DIGITAL
trisc.b0=0; //led salida

trisc.b6=0;
trisb=0;
UART1_Init(9600);
UART1_Write_Text("iniciando");

  while (1)
  {
analizasensoresir();
sprintf(texto,"lecturas=%d  %d    %d %d \r\n",lectura1,lectura2,lectura3,lectura4);
UART1_Write_Text(texto);
Delay_ms(200);



  
  }

}