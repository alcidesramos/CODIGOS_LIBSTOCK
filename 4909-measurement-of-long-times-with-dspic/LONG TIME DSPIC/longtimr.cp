#line 1 "C:/Users/Alcides Ramos/Desktop/LONG TIME DSPIC/longtimr.c"

sbit led_verde at LATB0_bit;
sbit led_azul at LATB1_bit;
char texto[50];

char esta=0;
unsigned long tiem1,tiem2,tiem=0;
float timems;

void INT1_int() iv IVT_ADDR_INT1INTERRUPT ics ICS_AUTO
{
 switch (esta)
 {
 case 0:
 tmr2=0;
 tmr3=0;
 T2CONbits.TON=1;
 esta=1;
 break;
 case 1:

 T2CONbits.TON=0;
 tiem1=TMR2;
 tiem2=(unsigned long)TMR3<<(unsigned long)16;
 tiem=tiem1 + tiem2;
 esta=2;

 break;

 case 2:
 tmr2=0;
 tmr3=0;
 T2CONbits.TON=0;
 break;

 }
INT1IF_bit=0;
}


void main()
{




 CLKDIVbits.PLLPRE = 0;
 CLKDIVbits.PLLPOST = 0;
 PLLFBD=78;


 trisb=0xffff;
 trisa=0xffff;



 AD1PCFGL = 0xFFFF;


 TRISB0_bit=0;
 TRISB1_bit=0;

 CNPU1=0;
 CNPU2=0;


ppS_Mapping(14, _OUTPUT, _u1tx);
PPS_Mapping(15, _INPUT, _U1rX);
PPS_Mapping(7,_INPUT,_INT1);

UART1_Init(9600);



INT1EP_bit=0;

INT1IP_2_bit=1;
INT1IP_1_bit=1;
INT1IP_0_bit=0;
INT1IF_bit=0;
INT1IE_bit=1;


tmr3=0;
tmr2=0;

pr2=65535;
pr3=65535;

t2con=0;

T2CONbits.TCKPS=0b11;
T2CONbits.T32= 1;
T2CONbits.TON=0;


 while (1)
 {
 if (esta==2)
 {
 timems=tiem*256.0*1000.0/40e6 ;

 sprintf(texto,"tiempo=%.1f\r\n",timems);
 UART1_Write_Text(texto);
 esta=0;
 }
 Delay_ms(500);
 led_verde=!led_verde;
 }

}
