#line 1 "C:/Users/Alcides Ramos/Desktop/seguidor basico canal/basico.c"
#line 33 "C:/Users/Alcides Ramos/Desktop/seguidor basico canal/basico.c"
void md_quieto()
{
  LATC0_bit =0;
  LATC1_bit =0;
}


void md_alante()
{
  LATC0_bit =1;
  LATC1_bit =0;
}


void md_atras()
{
  LATC0_bit =0;
  LATC1_bit =1;
}


void mi_quieto()
{
  LATC2_bit =0;
  LATC4_bit =0;
}


void mi_alante()
{
  LATC2_bit =0;
  LATC4_bit =1;
}



void mi_atras()
{
  LATC2_bit =1;
  LATC4_bit =0;
}





 void quieto()
 {
 md_quieto();
 mi_quieto();
 }


 void alante(unsigned char velo)
 {
 PWM1_Set_Duty(velo);
 PWM2_Set_Duty(velo);
 md_alante();
 mi_alante();

 }


 void atras(unsigned char velo)
 {
 PWM1_Set_Duty(velo);
 PWM2_Set_Duty(velo);
 md_atras();
 mi_atras();
 }


 void derecha(unsigned char velo)
 {
 PWM1_Set_Duty(velo);
 PWM2_Set_Duty(velo);
 mi_alante();
 md_atras();
 }


 void izquierda(unsigned char velo)
 {
 PWM1_Set_Duty(velo);
 PWM2_Set_Duty(velo);

 md_alante();
 mi_atras();
 }


 void analiza_sensores()
 {
 if (( RA2_bit == 1 ) && ( RA4_bit == 1 ) &&( RA5_bit == 1 ) ) izquierda( 50 );
 else if (( RA2_bit == 1 ) && ( RA4_bit == 1 ) && ( RA5_bit == 0 ) ) izquierda( 50 );
 else if (( RA2_bit == 1 ) && ( RA4_bit == 0 ) && ( RA5_bit == 1 ) ) alante( 50 );
 else if (( RA2_bit == 1 ) && ( RA4_bit == 0 ) && ( RA5_bit == 0 ) ) izquierda( 50 );
 else if (( RA2_bit == 0 ) && ( RA4_bit == 1 ) && ( RA5_bit == 1 ) ) derecha( 50 );
 else if (( RA2_bit == 0 ) && ( RA4_bit == 1 ) && ( RA5_bit == 0 ) ) alante( 150 );
 else if (( RA2_bit == 0 ) && ( RA4_bit == 0 ) && ( RA5_bit == 1 ) ) derecha( 50 );
 else if (( RA2_bit == 0 ) && ( RA4_bit == 0 ) && ( RA5_bit == 0 ) ) alante( 150 );

 }


void main()
{

OSCCON=0;
OSCTUNE=0;



SCS1_bit=0;
SCS0_bit=0;



IRCF3_bit=1;
IRCF2_bit=1;
IRCF1_bit=1;
IRCF0_bit=0;


ANSELA=0;
ANSELC=0;


 TRISA2_bit =1;
 TRISA4_bit =1;
 TRISA5_bit =1;

 TRISC0_bit =0;
 TRISC1_bit =0;
 TRISC2_bit =0;
 TRISC4_bit =0;


TRISC3_bit=0;
TRISC5_bit=0;

SPLLEN_bit=0;

 PWM1_Init(250);
 PWM2_Init(250);

 PWM1_Set_Duty(127);
 PWM2_Set_Duty(127);

 PWM1_Start();
 PWM2_Start();

 while (1)
 {
 analiza_sensores();
 Delay_ms(1);


 }

}
