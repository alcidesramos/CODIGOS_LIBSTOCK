#line 1 "C:/Users/Alcides Ramos/Desktop/DSPICTIMERS/dspictimers.c"
#line 1 "c:/users/alcides ramos/desktop/dspictimers/config_interrupcion.h"



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
#line 1 "c:/users/alcides ramos/desktop/dspictimers/config_timers.h"
sbit led1 at LATB14_bit;
sbit led2 at LATB15_bit;




void confi_timer_1()
{


tmr1=0;
pr1=31250;
t1con=0;

T1CONbits.TCKPS1=1;
T1CONbits.TCKPS0=1;


T1IP_2_bit=0;
T1IP_1_bit=0;
T1IP_0_bit=1;

T1IF_bit = 0;
T1IE_bit = 1;
T1CONbits.TON=1;
}


void confi_timer_32()
{

tmr3=0;
tmr2=0;

pr3=2441;
pr2=26624;

t2con=0;


T2CONbits.TCKPS1=0;
T2CONbits.TCKPS0=0;




T3IP_2_bit=0;
T3IP_1_bit=1;
T3IP_0_bit=0;

T3IF_bit = 0;
T3IE_bit = 1;


T2CONbits.T32= 1;
T2CONbits.TON=1;
}



 void timer1() iv IVT_ADDR_T1INTERRUPT ics ICS_AUTO
 {

 tmr1=0;

 led1=!led1;



 T1IF_bit=0;
}



void timer32_int() iv IVT_ADDR_T3INTERRUPT ics ICS_AUTO
{
 tmr2=0;
 tmr3=0;


 led2=!led2;


 T3IF_bit=0;
}
#line 7 "C:/Users/Alcides Ramos/Desktop/DSPICTIMERS/dspictimers.c"
void main()
{







 CLKDIVbits.PLLPRE = 0;
 CLKDIVbits.PLLPOST = 0;
 PLLFBD=78;

 deshabilita();

 AD1PCFGL=0xffff;

 TRISB=0x0;
 LATB=0;

 Unlock_IOLOCK();
 PPS_Mapping(0,_OUTPUT,_U1TX);

 UART1_Init(9600);
 Lock_IOLOCK();

 UART1_Write_Text("INCICIANDO\r\n");

 confi_timer_1();
 confi_timer_32();

 habilita();
 while (1)
 {
 LATB13_bit=!LATB13_bit;
 Delay_ms(200);
 UART1_Write_Text("Procesando\r\n");


 }

}
