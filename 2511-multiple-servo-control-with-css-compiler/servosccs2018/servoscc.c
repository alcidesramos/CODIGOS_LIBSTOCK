#include <servoscc.h>
#include <Servos_T1.h>//incluye la libreroa de servo

#INT_TIMER1
void  TIMER1_isr(void) 
{
servos_interrupcion();
}



void main()
{
   
   //salida port b y c
   set_tris_b(0);
   set_tris_c(0);
 
 
   setup_timer_1(T1_INTERNAL|T1_DIV_BY_1);      //65,5 ms overflow

    init_servos(0.5,2.5);
   
   set_timer1(0); // al hazar del timer
   enable_interrupts(INT_TIMER1);
   enable_interrupts(GLOBAL);

   while(TRUE)
   {
  servo_valor(1,0);
  servo_valor(2,45);
  servo_valor(3,90);
  servo_valor(4,-45);
  servo_valor(5,-60);
  servo_valor(6,-90);
  servo_valor(7,20);
  servo_valor(8,-20);



      //TODO: User Code
   }

}
