#line 1 "C:/Users/Alcides Ramos/Desktop/DSPICTIMERS 2020 - copia/dspictimers.c"
#line 1 "c:/users/alcides ramos/desktop/dspictimers 2020 - copia/config_interrupcion.h"



 void osciladorInt() org 0x06
{
OSCFAIL_bit=0;
}

void direccionInt() org 0x08
{
ADDRERR_bit=0;
}

void pilaInt() org 0x0A
{
STKERR_bit=0;
}


void aritmetrico() org 0x0C
{
MATHERR_bit=0;
}

void deshabilita()
{


intcon1.b15=0;
IPL3_bit=1;
IPL_2_bit=1;
IPL_1_bit=1;
IPL_0_bit=1;
intcon1.b15=1;
}


void habilita()
{


intcon1.b15=0;
IPL3_bit=0;
IPL_2_bit=0;
IPL_1_bit=0;
IPL_0_bit=0;
intcon1.b15=1;
}
#line 1 "c:/users/alcides ramos/desktop/dspictimers 2020 - copia/config_input_capture_33f_util.h"
void config_inputcapure();
#line 8 "C:/Users/Alcides Ramos/Desktop/DSPICTIMERS 2020 - copia/dspictimers.c"
 sbit disparo at LATA1_bit;


float ancho1,ancho2,ancho3,ancho4;
float dis1,dis2,dis3,dis4;
char texto[50];
unsigned int prescalador=64;


 unsigned int pulso_1,pulso_2,pulso_3,pulso_4;

 sbit in_pulso_1 at RB2_bit;
 sbit in_pulso_2 at RB3_bit;
 sbit in_pulso_3 at RB4_bit;
 sbit in_pulso_4 at RB5_bit;


void main()
{







 CLKDIVbits.PLLPRE = 0;
 CLKDIVbits.PLLPOST = 0;
 PLLFBD=78;

 deshabilita();

 AD1PCFGL=0xffff;

 TRISA=0;
 TRISB=0x0;
 LATB=0;
 TRISA4_bit=1;
 Unlock_IOLOCK();
 PPS_Mapping(0,_OUTPUT,_U1TX);
 PPS_Mapping(2,_INPUT,_IC1);
 PPS_Mapping(3,_INPUT,_IC2);
 PPS_Mapping(4,_INPUT,_IC7);
 PPS_Mapping(5,_INPUT,_IC8);

 UART1_Init(9600);
 Lock_IOLOCK();

 UART1_Write_Text("INCICIANDO\r\n");




 config_inputcapure();

 habilita();
 while (1)
 {


 disparo=0;
 Delay_us(10);

 disparo=1;
 LATB13_bit=!LATB13_bit;
 Delay_ms(200);


 ancho1=((float)pulso_1*(float)prescalador)/40e6;

 dis1=ancho1/58e-6;


 ancho2=((float)pulso_2*(float)prescalador)/40e6;


 dis2=ancho2/58e-6;

 ancho3=((float)pulso_3*(float)prescalador)/40e6;


 dis3=ancho3/58e-6;


 ancho4=((float)pulso_4*(float)prescalador)/40e6;


 dis4=ancho4/58e-6;


 sprintf(texto,"dis1=%.1fcm    dis2=%.1fcm   dis3=%.1fcm  dis4=%.1fcm\r\n", dis1,dis2,dis3,dis4);
 UART1_Write_Text(texto);


 }

}
