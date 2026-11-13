#line 1 "C:/Users/Alcides Ramos/Desktop/DSPICTIMERS 2020 - copia/config_Input_capture_33f_util.c"


extern unsigned int pulso_1,pulso_2,pulso_3,pulso_4;

extern sfr sbit in_pulso_1;
extern sfr sbit in_pulso_2;
extern sfr sbit in_pulso_3;
extern sfr sbit in_pulso_4;



unsigned int pul1_1=0,pul1_2=0;
unsigned int pul2_1=0,pul2_2=0;
unsigned int pul3_1=0,pul3_2=0;
unsigned int pul4_1=0,pul4_2=0;



void confi_timer_2()
{


tmr2=0;
pr2=65535;
t2con=0;


t2con.b5=1;
t2con.b4=0;
T2CONbits.TON=1;
}

void config_inputcapure()
{confi_timer_2();
IC1CON=IC2CON=IC7CON=IC8CON=0;

ICTMR_IC1CON_bit=ICTMR_IC2CON_bit=ICTMR_IC7CON_bit=ICTMR_IC8CON_bit=1;


IC1CONbits.ICM=IC2CONbits.ICM=IC7CONbits.ICM=IC8CONbits.ICM=0b001;


IC1IF_bit=IC2IF_bit=IC7IF_bit=IC8IF_bit=0;
IC1IE_bit=IC2IE_bit=IC7IE_bit=IC8IE_bit=1;


IC1IP_2_bit=IC2IP_2_bit=IC7IP_2_bit=IC8IP_2_bit=0;
IC1IP_1_bit=IC2IP_1_bit=IC7IP_1_bit=IC8IP_1_bit=1;
IC1IP_0_bit=IC2IP_0_bit=IC7IP_0_bit=IC8IP_0_bit=1;

}


void INTIC1() iv IVT_ADDR_IC1INTERRUPT ics ICS_AUTO
{

pul1_2=IC1BUF;

 if (in_pulso_1==0)
 {

if (pul1_2>pul1_1) pulso_1=(pul1_2-pul1_1);
else pulso_1=(PR2 - pul1_1) + pul1_2;
 }
 pul1_1=pul1_2;
IC1IF_bit=0;
}

void INTIC2() iv IVT_ADDR_IC2INTERRUPT ics ICS_AUTO
{

pul2_2=IC2BUF;

 if (in_pulso_2==0)
 {

if (pul2_2>pul2_1) pulso_2=(pul2_2-pul2_1);
else pulso_2=(PR2 - pul2_1) + pul2_2;
 }
 pul2_1=pul2_2;
IC2IF_bit=0;
}


void INTIC3() iv IVT_ADDR_IC7INTERRUPT ics ICS_AUTO
{


pul3_2=IC7BUF;

 if (in_pulso_3==0)
 {

if (pul3_2>pul3_1) pulso_3=(pul3_2-pul3_1);
else pulso_3=(PR2 - pul3_1) + pul3_2;
 }
 pul3_1=pul3_2;
IC7IF_bit=0;
}

void INTIC4() iv IVT_ADDR_IC8INTERRUPT ics ICS_AUTO
{

pul4_2=IC8BUF;

 if (in_pulso_4==0)
 {

if (pul4_2>pul4_1) pulso_4=(pul4_2-pul4_1);
else pulso_4=(PR2 - pul4_1) + pul4_2;
 }
 pul4_1=pul4_2;
IC8IF_bit=0;
}
