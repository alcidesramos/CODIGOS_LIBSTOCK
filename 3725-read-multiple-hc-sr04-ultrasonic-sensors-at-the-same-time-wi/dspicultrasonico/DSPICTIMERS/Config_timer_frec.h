
extern unsigned int  pwm_in1,pwm_in2,pwm_in3;

#define prescalador 64  // prescalador a usar


void config_timer_frec()
{
//configura timer medir frecuencia
TMR1=TMR2=TMR3=0;
PR1=PR2=PR3=31250;// para  50ms
T1CON=T2CON=T3CON=0;
T1CONbits.TGATE=T2CONbits.TGATE=T3CONbits.TGATE=1;  //para medir ancho pulso

T1CONbits.TCKPS=T2CONbits.TCKPS=T3CONbits.TCKPS=0b10;  // preescalador de 64
T1CONbits.TON=T2CONbits.TON=T3CONbits.TON=1;//prende timer

T1IP_2_bit=T2IP_2_bit=T3IP_2_bit=0;
T1IP_1_bit=T2IP_1_bit=T3IP_1_bit=0;
T1IP_0_bit=T2IP_0_bit=T3IP_0_bit=1;

//HAbilito interrupcion timer
T1IF_bit=T2IF_bit=T3IF_bit=0;
T1IE_bit=T2IE_bit=T3IE_bit=1;

}

void Int_frecuencia1() iv IVT_ADDR_T1INTERRUPT  ics ICS_AUTO

{
  pwm_in1=TMR1;
  TMR1=0;
  T1IF_bit=0; // Limpia la bandera

}

void Int_frecuencia2() iv IVT_ADDR_T2INTERRUPT  ics ICS_AUTO

{
  pwm_in2=TMR2;
  TMR2=0;
  T2IF_bit=0; // Limpia la bandera

}



void Int_frecuencia3() iv IVT_ADDR_T3INTERRUPT  ics ICS_AUTO


{
  pwm_in3=TMR3;
  tmr3=0;
  T3IF_bit=0; // Limpia la bandera

}