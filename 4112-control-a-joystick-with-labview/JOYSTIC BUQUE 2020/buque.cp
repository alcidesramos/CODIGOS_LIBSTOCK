#line 1 "C:/Users/Alcides Ramos/Desktop/JOYSTIC BUQUE 2020/buque.c"
#line 1 "c:/users/alcides ramos/desktop/joystic buque 2020/librerias/config_pwm_b.h"
 void pwm_init_basico();
#line 1 "c:/users/alcides ramos/desktop/joystic buque 2020/librerias/config_interrupcion.h"


void osciladorInt();
void direccionInt();
void pilaInt();
void aritmetrico();
void deshabilita();
void habilita();
#line 1 "c:/users/alcides ramos/desktop/joystic buque 2020/librerias/config_uart_rx1.h"
void config_uart1_trama(unsigned int baudios);
#line 7 "C:/Users/Alcides Ramos/Desktop/JOYSTIC BUQUE 2020/buque.c"
sbit led1 at RB0_bit;
sbit led2 at RB1_bit;

 char texto[50];


 extern unsigned char Trama_rx1[];
 extern char flag_rx1;
 unsigned char Captura_rx1[50];

float serV1,serV2;

void servo1(float angulo)
{
 OC1RS=3.4722*angulo + 937.5;
}


void servo2(float angulo)
{
 OC2RS=3.4722*angulo + 937.5;
}




void procesa_rx1()
{

 strcpy(Captura_rx1, strtok(trama_rx1, "/"));
 strcpy(Captura_rx1, strtok(0, "/"));
 serv1=atof(Captura_rx1);

 strcpy(Captura_rx1, strtok(0, "/"));
 serv2=atof(Captura_rx1);

 strcpy(Captura_rx1, strtok(0, "/"));
 led1=atoi(Captura_rx1);

 strcpy(Captura_rx1, strtok(0, "/"));
 led2=atoi(Captura_rx1);






 servo1(serv1);
 servo2(serv2*90.0/100.0);

 }



void main()
{






 CLKDIVbits.PLLPRE = 0;
 CLKDIVbits.PLLPOST = 0;
 PLLFBD=41;



 AD1PCFGL = 0xFFFF;

 TRISA=0;
 TRISB=0;
 TRISB0_bit=0;
 TRISB1_bit=0;

 PPS_Mapping(13,_OUTPUT,_U1TX);
 PPS_Mapping(14,_INPUT,_U1RX);


 PPS_Mapping(2,_OUTPUT,_OC1);
 PPS_Mapping(3,_OUTPUT,_OC2);

 pwm_init_basico();
 config_uart1_trama(9600);
 UART1_Write_Text("AJA");
 habilita();
 while(1)

 {
 if (flag_rx1==1)
 {

 procesa_rx1();
 flag_rx1=0;
 memset(Trama_rx1,0,50);
 U1STAbits.OERR=0;

 U1RXIF_bit=0;
 U1RXIE_bit=1;


 }



 }


}
