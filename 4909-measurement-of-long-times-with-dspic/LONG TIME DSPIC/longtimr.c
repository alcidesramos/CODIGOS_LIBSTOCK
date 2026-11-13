
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
            T2CONbits.TON=1;//prenDe  el Timer
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
            T2CONbits.TON=0;//Apaga  el Timer
             break;

  }
INT1IF_bit=0;  //limpia la bandera
}


void main()
{
//Configuración de operacion.
//CONFIGURA VELOCIDAD DE OPERACION    A 80 MEGAHERT CON CRISTAL DE 4 MEGA
//VELOCIDAD= 4M*M/(N1*N2)= 4M*80/4=80M

  CLKDIVbits.PLLPRE = 0;      // N1 = 2
  CLKDIVbits.PLLPOST = 0;     // N2 = 2
  PLLFBD=78; // selecciona  M=80;  siempre lo deseado menos 2  crital 4MHz;


  trisb=0xffff;
  trisa=0xffff;


//INICIALIZA PINES DIGITALES
  AD1PCFGL = 0xFFFF;

  //pines salidas
   TRISB0_bit=0; //led1
   TRISB1_bit=0;  //led2
  // deshabilita pullups
    CNPU1=0;
    CNPU2=0;

//Asignacion pines Remapeables
ppS_Mapping(14, _OUTPUT, _u1tx);  //TX Del Micro
PPS_Mapping(15, _INPUT, _U1rX);  //RX el Micro
PPS_Mapping(7,_INPUT,_INT1); ///entrada de velocidad  //rb7 a entra de velocidad

UART1_Init(9600);

//configura interrupcion por falnco

INT1EP_bit=0; //interrucion por flanco positivo
//prioridad
INT1IP_2_bit=1;
INT1IP_1_bit=1;
INT1IP_0_bit=0;
INT1IF_bit=0;  // Limpia candera flanco
INT1IE_bit=1; //habilita interrución flanco

//configura timer 23 a 32 bits
tmr3=0;
tmr2=0;

pr2=65535;  //1 segun
pr3=65535;

t2con=0;
//preescalador  256
T2CONbits.TCKPS=0b11;
T2CONbits.T32= 1; //trabaja a 32 bits
T2CONbits.TON=0;//apaga el Timer


 while (1)
 {
    if (esta==2)
    {
    timems=tiem*256.0*1000.0/40e6 ;  //cilco*preescaldor*velocidad rela micro ;
   //sprintf(texto,"tiempo=%lu\r\n",(unsigned long)tiem);
    sprintf(texto,"tiempo=%.1f\r\n",timems);
    UART1_Write_Text(texto);
    esta=0;
    }
   Delay_ms(500);
   led_verde=!led_verde;
 }

}