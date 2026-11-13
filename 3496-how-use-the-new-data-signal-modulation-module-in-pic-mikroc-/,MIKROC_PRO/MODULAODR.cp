#line 1 "C:/Users/Alcides Ramos/Desktop/MODULADOR/,MIKROC_PRO/MODULAODR.c"


void main()
{

OSCCON=0;
OSCTUNE=0;

SCS1_bit=1;
SCS0_bit=0;


SCS1_bit=0;
SCS0_bit=0;


IRCF3_bit=1;
IRCF2_bit=1;
IRCF1_bit=1;
IRCF0_bit=0;

SPLLEN_bit=1;

UART1_Init(9600);


RXDTSEL_bit=1;
TXCKSEL_bit=1;



TRISA=0;
TRISC=0;
TRISC3_bit=1;




T2CON=0;

T2CKPS1_bit=0;
T2CKPS0_bit=0;

PR2=199;

CCP1CON=0;

C1TSEL1_bit=0;
C1TSEL0_bit=0;


CCP1CON=0;
CCP1M3_bit=1;
CCP1M2_bit=1;
CCP1M1_bit=0;
CCP1M0_bit=0;

CCPR1L=99;

DC1B1_bit=1;
DC1B0_bit=1;

PSTR1CON=0;
STR1SYNC_bit=0;

STR1A_bit=1;




TMR2ON_bit=1;




T6CON=0;

T6CKPS1_bit=0;
T6CKPS0_bit=1;
PR6=119;

CCP4CON=0;

C4TSEL1_bit=1;
C4TSEL0_bit=0;


CCP4CON=0;

CCP4M3_bit=1;
CCP4M2_bit=1;
CCP4M1_bit=0;
CCP4M0_bit=0;

CCPR4L=59;

DC4B1_bit=1;
DC4B0_bit=1;
PSTR2CON=0;
STR2SYNC_bit=0;





TMR6ON_bit=1;



MDCON=0;
MDEN_bit=0;
MDOE_bit=1;
MDSLR_bit=1;

MDMSODIS_bit=0;
#line 137 "C:/Users/Alcides Ramos/Desktop/MODULADOR/,MIKROC_PRO/MODULAODR.c"
MDMS3_bit=1;
MDMS2_bit=0;
MDMS1_bit=1;
MDMS0_bit=0;



MDCARH=0;
MDCHSYNC_bit=1;


MDCH3_bit=0;
MDCH2_bit=1;
MDCH1_bit=0;
MDCH0_bit=0;
#line 162 "C:/Users/Alcides Ramos/Desktop/MODULADOR/,MIKROC_PRO/MODULAODR.c"
MDCHPOL_bit=1;


MDCARL=0;
MDCLSYNC_bit=1;


MDCL3_bit=0;
MDCL2_bit=1;
MDCL1_bit=1;
MDCL0_bit=1;
#line 183 "C:/Users/Alcides Ramos/Desktop/MODULADOR/,MIKROC_PRO/MODULAODR.c"
 MDEN_bit=1;
#line 191 "C:/Users/Alcides Ramos/Desktop/MODULADOR/,MIKROC_PRO/MODULAODR.c"
 TXREG=0b10101010;
 while (TRMT_bit==0);



 MDEN_bit=0;





 while (1)
 {


 }



}
