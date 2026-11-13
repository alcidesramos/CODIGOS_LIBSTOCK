
                        // las variables de pulso y los pines los declaro en otro archivp
extern  unsigned int pulso_1,pulso_2,pulso_3,pulso_4;

extern sfr sbit in_pulso_1;
extern sfr sbit in_pulso_2;
extern sfr sbit in_pulso_3;
extern sfr sbit in_pulso_4;


 //variables usadas para calculo
unsigned int pul1_1=0,pul1_2=0;
unsigned int pul2_1=0,pul2_2=0;
unsigned int pul3_1=0,pul3_2=0;
unsigned int pul4_1=0,pul4_2=0;



void confi_timer_2()
{
 //configuracion timer 2
//100ms
tmr2=0;
pr2=65535;
t2con=0;
//preescalador 64
//T2CONbits.TCKPS=0b10;
t2con.b5=1;
t2con.b4=0;
T2CONbits.TON=1;//prendo
}

void config_inputcapure()
{confi_timer_2();
IC1CON=IC2CON=IC7CON=IC8CON=0; //limpia registo

ICTMR_IC1CON_bit=ICTMR_IC2CON_bit=ICTMR_IC7CON_bit=ICTMR_IC8CON_bit=1; //1=timer 2 es la fuente de reloj 0= timer 3

//  Captura cada flanco de subida o bajada
IC1CONbits.ICM=IC2CONbits.ICM=IC7CONbits.ICM=IC8CONbits.ICM=0b001;

//habilita la interrupcion
IC1IF_bit=IC2IF_bit=IC7IF_bit=IC8IF_bit=0;   // limnpia la bandera
IC1IE_bit=IC2IE_bit=IC7IE_bit=IC8IE_bit=1;  //habilita las interrpcion

//Priorad d ela interrupcion
IC1IP_2_bit=IC2IP_2_bit=IC7IP_2_bit=IC8IP_2_bit=0;
IC1IP_1_bit=IC2IP_1_bit=IC7IP_1_bit=IC8IP_1_bit=1;
IC1IP_0_bit=IC2IP_0_bit=IC7IP_0_bit=IC8IP_0_bit=1;

}


void INTIC1() iv IVT_ADDR_IC1INTERRUPT ics ICS_AUTO
{

pul1_2=IC1BUF;

 if (in_pulso_1==0)
 {
 //Para medir ancho de pulso
if (pul1_2>pul1_1) pulso_1=(pul1_2-pul1_1);
else pulso_1=(PR2 - pul1_1) + pul1_2;   //desborde del timer
  }
 pul1_1=pul1_2;
IC1IF_bit=0; // limpia la bandera
}

void INTIC2() iv IVT_ADDR_IC2INTERRUPT ics ICS_AUTO
{

pul2_2=IC2BUF;

 if (in_pulso_2==0)
 {
 //Para medir ancho de pulso
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
 //Para medir ancho de pulso
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
 //Para medir ancho de pulso
if (pul4_2>pul4_1) pulso_4=(pul4_2-pul4_1);
else pulso_4=(PR2 - pul4_1) + pul4_2;
 }
 pul4_1=pul4_2;
IC8IF_bit=0;
}