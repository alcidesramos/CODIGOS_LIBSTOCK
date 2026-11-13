//#device PASS_STRINGS=IN_RAM


#include <uartlinemain.h>

#include <stdio.h>
#include <string.h> 


 char trama_rx[50];   //trama de 50 datos
 char texto[20];
 char cont_trama=0;
 char flag_rx=0;
 char dato_rx;


#INT_TIMER0
void  TIMER0_isr(void) 
{
    flag_rx=1; //avisa que posee datos valodo para procesa
    cont_trama=0;
    
    disable_interrupts(INT_RDA);//deshabilita inetrrupcion serial
    disable_interrupts(INT_TIMER0);//deshabilita int timer0
    setup_timer_0(T0_OFF); //apaga el timer 0
    clear_interrupt(INT_TIMER0)  ;//limpia bandera timer0
  

}

#INT_RDA
void  RDA_isr(void) 
{
   dato_rx=getc();// Lee dato serial
    trama_rx[cont_trama]=dato_rx; //va llenando el buffer con lo recibido
    cont_trama++;    //incrementa contado de datos recibidos
    if (cont_trama>=50) cont_trama=0;  //si se llena el buffer lo reinicia
    set_timer0(0);   //limpia el timer0
    setup_timer_0(RTCC_INTERNAL|RTCC_DIV_32|RTCC_8_BIT);      //8,1 ms configura timer0
    clear_interrupt(INT_TIMER0)  ;//limpia bandera timer0
     enable_interrupts(INT_TIMER0);
   

}

void main()
{
   setup_adc_ports(NO_ANALOGS, VSS_VDD);
  // setup_timer_0(RTCC_INTERNAL|RTCC_DIV_32|RTCC_8_BIT);      //8,1 ms overflow

  clear_interrupt(INT_TIMER0)  ;//limpia bandera timer0
  
  // enable_interrupts(INT_TIMER0);
   enable_interrupts(INT_RDA);
   enable_interrupts(GLOBAL);

   while(TRUE)
   {

      if (flag_rx==1)
  {
    cont_trama=0;
   printf(trama_rx); //REPITE LA TRAMA
  strcpy(texto, "led=");
   if (strstr(trama_rx,texto))
    {
      strcpy(texto, "on");
       if (strstr(trama_rx,texto ))   output_bit(PIN_C1, 1); //ENCIENDE EL LED
        else output_bit(PIN_C1, 0);//APAGA LED
    }
    memset(trama_rx,0,50);//limpia le buffer
 
   clear_interrupt(INT_RDA);//limpia bandera de int serial
   enable_interrupts(INT_RDA);//habilita inr sewrial
    flag_rx=0;

   }

 


    output_toggle(PIN_C0);
    delay_ms(300);
 
      //TODO: User Code
   }

}
