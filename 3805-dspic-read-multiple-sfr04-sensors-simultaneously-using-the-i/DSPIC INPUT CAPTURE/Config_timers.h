sbit led1 at LATB14_bit;  //timer 1 de 16 bits
sbit led2 at LATB15_bit;   // timers 32 32 bits



//Timer usado para chequear eventos en el Display
void confi_timer_1()
{
 //configuracion timer 1
//30ms
tmr1=0;
pr1=31250;
t1con=0;
//preescalador  256
T1CONbits.TCKPS1=1;
T1CONbits.TCKPS0=1;

//prioridad timer1
T1IP_2_bit=0;
T1IP_1_bit=0;
T1IP_0_bit=1;

T1IF_bit = 0;     //limpia la bandera
T1IE_bit = 1;    //habilta el timer
T1CONbits.TON=1;//prende el Timer
}

//Timer usado para Actulizar escritura de datos
void confi_timer_32()
{
 //configuracion timer 2
tmr3=0;
tmr2=0;

pr3=2441;
pr2=26624;

t2con=0;

//preescalador  1
T2CONbits.TCKPS1=0;
T2CONbits.TCKPS0=0;


//INTERRUPCION CON TIMER 3
//prioridad timer3
T3IP_2_bit=0;
T3IP_1_bit=1;
T3IP_0_bit=0;

T3IF_bit = 0;     //limpia la bandera
T3IE_bit = 1;    //habilta el timer

//INICIO CON TIMER 2
T2CONbits.T32= 1; //trabaja a 32 bits
T2CONbits.TON=1;//prende el Timer
}


//Interrupcion PAra escanear Eventos en el Touch
   void timer1() iv IVT_ADDR_T1INTERRUPT ics ICS_AUTO
    {

 tmr1=0;
// T1CONbits.TON=0;//Para el Timer
     led1=!led1;


  //T1CONbits.TON=1;//Prende el Timer
  T1IF_bit=0; // limpia bandera inetrrupcion
}

//Interrupcion de Actualización de datos

void timer32_int() iv IVT_ADDR_T3INTERRUPT ics ICS_AUTO
{
  tmr2=0;
  tmr3=0;

//T2CONbits.TON=0;//Para el Timer
  led2=!led2;

//T2CONbits.TON=1;//Prende el Timer
  T3IF_bit=0;
}