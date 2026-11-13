#line 1 "C:/Users/Alcides Ramos/Desktop/virtuino/VIRTUINO 2020/VIRTUINO.c"
#line 1 "c:/users/alcides ramos/desktop/virtuino/virtuino 2020/ds18b20.h"
float ds18b20_read(char *puerto,char pin);

char texto1[20];

float ds18b20_read(char *puerto,char pin)
{
unsigned int temp_;
float tempo__;
unsigned char t1_,t2_,td__;
float signo=1.0;
float sensor_temp_;



 Ow_Reset(puerto, pin);
 Delay_ms(1);
 Ow_Write(puerto, pin, 0xCC);
 Delay_ms(1);
 Ow_Write(puerto, pin, 0x44);
 Delay_ms(150);

 Ow_Reset(puerto, pin);
 Delay_ms(1);
 Ow_Write(puerto, pin, 0xCC);
 Delay_ms(1);
 Ow_Write(puerto, pin, 0xBE);
 Delay_ms(1);
 t1_ = Ow_Read(puerto, pin);
 t2_ = Ow_Read(puerto, pin);

 temp_=( (unsigned int)t2_<<8) | t1_;


 if ( t2_ & 0x80)
 {
 temp_=~temp_+1;
 signo=-1.0;
 }
 temp_=temp_>>4;

 td__=t1_ & 0x0f;

 tempo__=0;
 if (td__.b3==1)tempo__=tempo__+0.5;
 if (td__.b2==1) tempo__=tempo__+0.25;
 if (td__.b1==1) tempo__=tempo__+0.125;
 if (td__.b0==1) tempo__=tempo__+0.0625;
 if (signo<0) tempo__=-tempo__;
 sensor_temp_=(temp_*signo)+tempo__;

 return (sensor_temp_);

}
#line 18 "C:/Users/Alcides Ramos/Desktop/virtuino/VIRTUINO 2020/VIRTUINO.c"
char trama_tx[100];




char trama_rx[100];
char procesa[100];
char datorx;
char puntero=0;
char flag_rx=0;

char flag_timer=0;
char timer_cont=0;



enum maq_estados {Adm,V_,fin};
char estado=Adm;

char num_variables=0;

const total_variables=6;




unsigned int codigo;
float temperatura;

char texto[20];
char captu[30];
float pwm;





void m1derecha()
{
  RB0_bit =1;
  RB1_bit =0;
}

void m1izquierda()
{
  RB0_bit =0;
  RB1_bit =1;
 }

void m1quieto()
{
 RB0_bit =0;
  RB1_bit =0;
}


void Uart1_write_text_const(const char *info)
{
 while(*info) UART1_Write(*info++);
}

void soft_Uart_write_text(char *info)
{
 while(*info) Soft_UART_Write(*info++);
}


void soft_Uart_write_text_const(const char *info)
{
 while(*info) Soft_UART_Write(*info++);
}



void procesarx()

{
char variable;
char son;




 strcpy(procesa, strtok(trama_rx, "V"));

 for (son=0; son<total_variables-1;son++)
 {


 strcpy(procesa, strtok(0, "="));
 variable=atoi(procesa);

 strcpy(procesa, strtok(0, "$"));


 if (procesa[0]!='?')
 {
 if (variable==0)  RC5_bit =atoi(procesa);
 else if (variable==1)  RC4_bit =atoi(procesa);
 else if (variable==2)
 {
 pwm=atof(procesa);
 PWM1_Set_Duty(pwm);
 }
 }


 strcpy(procesa, strtok(0, "V"));

 }

}


 void manda_AT_COMANDO(char *coman)
{

 Uart1_write_text(coman);
 Uart1_write_text_const("\r\n");
 }


 void manda_esp8266(char *info)
{
unsigned int largo;
 Uart1_write_text_const("AT+CIPSEND=");
 UART1_Write('0');
 UART1_Write(',');
 largo=strlen(info);
 sprinti(captu,"%1u",largo);
 UART1_Write_Text(captu);
 Uart1_write_text_const("\r\n");
 Delay_ms(300);
 Uart1_write_text(info);
 Delay_ms(300);

}



void interrupcion() iv 0x0008 ics ICS_AUTO

{
 if (RCIF_bit==1)
 {

 datorx=UART1_Read();

 switch (estado)
 {

 case Adm:
 trama_rx[puntero]=datorx;
 if (datorx!='!') puntero=0;
 else
 {
 puntero++;
 estado=V_;
 }
 break;


 case V_:
 trama_rx[puntero]=datorx;
 if (datorx!='V')
 {
 puntero=0;
 estado=Adm;
 }
 else
 {
 puntero++;


 flag_timer=0;


 TMR1H=158;
 TMR1L=88;
 TMR1IF_bit=0;
 TMR1IE_bit=1;
 TMR1ON_bit=1;

 estado=fin;
 }
 break;

 case fin:
 trama_rx[puntero]=datorx;
 puntero++;
 if (puntero>=100)
 { puntero=0;
 estado=Adm;
 }

 if (flag_timer==1)
 {

 trama_rx[puntero]=0;

 RCIE_bit=0;
 flag_rx=1;
 estado=Adm;
 flag_timer=0;

 }
 break;


 }
 RCIF_bit=0;
 }


 if (TMR1IF_bit==1)
 {
 timer_cont++;
 if (timer_cont>=4)
 {
 TMR1IE_bit=0;
 TMR1ON_bit=0;
 timer_cont=0;
 flag_timer=1;
 }


 TMR1IF_bit=0;
 }



}

void main()
{

 ANSEL=0;
 ANSELH=0;

 trisb.b0=0;
 trisb.b1=0;
 trisc.b2=0;
 trisc.B4=0;
 trisc.b5=0;
 trisc.b3=0;

 trisb.b6=1;

 trisb.b7=1;


 NOT_RBPU_bit=0;


 uart1_init(9600);


 pwm1_init(1250);
 PWM1_Set_Duty(100);
 PWM1_Start();


 m1quieto();
  RC5_bit =0;
  RC4_bit =0;

Soft_UART_Init(&PORTA, 2, 1, 9600, 0);


manda_AT_COMANDO("ATE0");
delay_ms(2000);
manda_AT_COMANDO("AT+CWMODE=2");
delay_ms(200);



manda_AT_COMANDO("AT+CIPSERVER=0");
delay_ms(200);
manda_AT_COMANDO("AT+CIPMUX=0");
delay_ms(200);
manda_AT_COMANDO("AT+CIPMODE=0");
delay_ms(200);


manda_AT_COMANDO("AT+CWSAP=\"ESP8266_ARZ\",\"noconectar\",5,3");
delay_ms(600);

manda_AT_COMANDO("AT+CIPAP=\"192.168.1.254\"");
delay_ms(200);
manda_AT_COMANDO("AT+CIPMUX=1");
delay_ms(200);


manda_AT_COMANDO("AT+CIPSERVER=1,100");
delay_ms(200);

manda_AT_COMANDO("AT+CIPSTO=0");
delay_ms(200);

 INTCON=0b01000000;

 RCIF_bit=0;
 RCIE_bit=1;


 RCEN_bit=0;
 RCEN_bit=1;


 T1CON=0;

 TMR1H=158;
 TMR1L=88;

 T1CKPS1_bit=1;
 T1CKPS0_bit=0;

 TMR1ON_bit=0;
 TMR1IF_bit=0;


 GIE_bit=1;
 temperatura=ds18b20_read(&portb,5);
 Delay_ms(100);
 soft_Uart_write_text_const("INICIANDO\r\n");



 while (1)
 {

 temperatura=ds18b20_read(&portb,5);


 if (flag_rx==1)
 {
 soft_Uart_write_text_const("\r\n ME LLEGO=");
 soft_Uart_write_text(trama_rx);
 procesarx();
 Delay_ms(100);
 sprintf(trama_tx,"!V03=%d$!V04=%d$!V05=%.1f$",(unsigned int)! RB6_bit ,(unsigned int)! RB7_bit ,temperatura);
 manda_esp8266(trama_tx);

 puntero=0;
 memset(trama_rx,0,100);
 flag_rx=0;


 CREN_bit=0;
 CREN_bit=1;

 RCIF_bit=0;
 RCIE_bit=1;
 }



 }


}
