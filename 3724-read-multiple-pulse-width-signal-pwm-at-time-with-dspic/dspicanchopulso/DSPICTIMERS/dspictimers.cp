#line 1 "C:/Users/Alcides Ramos/Desktop/dspicanchopulso/DSPICTIMERS/dspictimers.c"
#line 1 "c:/users/alcides ramos/desktop/dspicanchopulso/dspictimers/config_interrupcion.h"



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
#line 1 "c:/users/alcides ramos/desktop/dspicanchopulso/dspictimers/config_timer_frec.h"

extern unsigned int pwm_in1,pwm_in2,pwm_in3;




void config_timer_frec()
{

TMR1=TMR2=TMR3=0;
PR1=PR2=PR3=10000;
T1CON=T2CON=T3CON=0;
T1CONbits.TGATE=T2CONbits.TGATE=T3CONbits.TGATE=1;

T1CONbits.TCKPS=T2CONbits.TCKPS=T3CONbits.TCKPS=0b01;
T1CONbits.TON=T2CONbits.TON=T3CONbits.TON=1;

T1IP_2_bit=T2IP_2_bit=T3IP_2_bit=0;
T1IP_1_bit=T2IP_1_bit=T3IP_1_bit=0;
T1IP_0_bit=T2IP_0_bit=T3IP_0_bit=1;


T1IF_bit=T2IF_bit=T3IF_bit=0;
T1IE_bit=T2IE_bit=T3IE_bit=1;

}

void Int_frecuencia1() iv IVT_ADDR_T1INTERRUPT ics ICS_AUTO

{
 pwm_in1=TMR1;
 TMR1=0;
 T1IF_bit=0;

}

void Int_frecuencia2() iv IVT_ADDR_T2INTERRUPT ics ICS_AUTO

{
 pwm_in2=TMR2;
 TMR2=0;
 T2IF_bit=0;

}



void Int_frecuencia3() iv IVT_ADDR_T3INTERRUPT ics ICS_AUTO


{
 pwm_in3=TMR3;
 tmr3=0;
 T3IF_bit=0;

}
#line 5 "C:/Users/Alcides Ramos/Desktop/dspicanchopulso/DSPICTIMERS/dspictimers.c"
unsigned int pwm_in1,pwm_in2,pwm_in3;
float ancho1,ancho2,ancho3;
char texto[50];

void main()
{







 CLKDIVbits.PLLPRE = 0;
 CLKDIVbits.PLLPOST = 0;
 PLLFBD=78;

 deshabilita();

 AD1PCFGL=0xffff;

 TRISB=0x0;
 TRISA4_bit=1;
 LATB=0;

 Unlock_IOLOCK();
 PPS_Mapping(0,_OUTPUT,_U1TX);
 PPS_Mapping(3,_INPUT,_T2CK);
 PPS_Mapping(5,_INPUT,_T3CK);

 UART1_Init(9600);
 Lock_IOLOCK();

 UART1_Write_Text("INCICIANDO\r\n");



 config_timer_frec();

 habilita();
 while (1)
 {
 LATB13_bit=!LATB13_bit;
 Delay_ms(200);

 ancho1=(pwm_in1* 8 )/40e6;

 ancho1=ancho1*1000.0;

 ancho2=(pwm_in2* 8 )/40e6;

 ancho2=ancho2*1000.0;

 ancho3=(pwm_in3* 8 )/40e6;

 ancho3=ancho3*1000.0;


 sprintf(texto,"Ciclo1=%.2fms    Ciclo2=%.2fms    Ciclo3=%.2fms\r\n", ancho1,ancho2,ancho3);
 UART1_Write_Text(texto);


 }

}
