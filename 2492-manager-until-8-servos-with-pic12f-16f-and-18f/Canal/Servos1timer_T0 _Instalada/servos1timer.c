
//PINES DE LOS SERVOS
sbit servo1 at portb.b0;
sbit servo2 at portb.b1;
sbit servo3 at portb.b2;
sbit servo4 at portb.b3;
sbit servo5 at portb.b4;
sbit servo6 at portb.b5;
sbit servo7 at portc.b0;
sbit servo8 at portc.b1;      //pueden ir a cualquier pin

sbit servo1_direction at trisb.b0;
sbit servo2_direction at trisb.b1;
sbit servo3_direction at trisb.b2;
sbit servo4_direction at trisb.b3;
sbit servo5_direction at trisb.b4;
sbit servo6_direction at trisb.b5;
sbit servo7_direction at trisc.b0;
sbit servo8_direction at trisc.b1;
 // fin de los pines de los servos


void TImer0() iv 0x0004 ics ICS_AUTO
 {
   servos_interrupcion();
}


void main()

{

 init_servos(0.5,2.5);
 GIE_bit=1;
 while (1)
 
 {
 
  servo_valor(1,0);
  servo_valor(2,90);



 }


}