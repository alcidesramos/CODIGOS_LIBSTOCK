#include  "built_in.h"


#define sw RA1_bit
#define LEDS_L PORTB
#define LEDS_M PORTC
#define LEDS_H PORTD
unsigned int retardo;
unsigned int codigo;

unsigned long salida;

char efecto=0;
const max_efect=8;

void saca(unsigned long dato)
{
  LEDS_L=Lo(dato);
  LEDS_M=Hi(dato);
  LEDS_H=Higher(dato);
}

void flash(unsigned int velo)
{

salida=0;
saca(salida);
VDelay_ms(velo);
salida=~salida;
saca(salida);
VDelay_ms(velo);

}

void alternado(unsigned int velo)
{

salida=0xAAAAAA;
saca(salida);
VDelay_ms(velo);
salida=~salida;;
saca(salida);
VDelay_ms(velo);

}

void policia(unsigned int velo)
{

salida=0x000fff;
saca(salida);
VDelay_ms(velo);
salida=~salida;;
saca(salida);
VDelay_ms(velo);

}


void derecha(unsigned int velo)
{
 char cuenta;
   salida=0x000001;
  saca(salida);
  for (cuenta=0;cuenta<24;cuenta++)
  {
  VDelay_ms(velo);
  salida=salida<<1L;
  saca(salida);
  }

}

void izquierda(unsigned int velo)
{
 char cuenta;
   salida=0x800000;// 1 el bit mas alto
  saca(salida);
  for (cuenta=0;cuenta<24;cuenta++)
  {
  VDelay_ms(velo);
  salida=salida>>1L;
  saca(salida);
  }

}


 // enciende los led hacia al centro dos a la vez
void acerca(unsigned int tiempo)
{
char cuenta;

           unsigned long dato1=0x800000,dato2=0x000001;


        for (cuenta=0;cuenta<=12;cuenta++)
        {
        salida=dato1 | dato2;
        saca(salida);
       VDelay_ms(tiempo);
        dato1=dato1>>1L;
        dato2=dato2<<1L;

        }

}

//enciende los led del centro hacia las esquinas 2 a la vez
void aleja(unsigned int tiempo)
{
 char cuenta;
        unsigned long dato1=0x001000,dato2=0x000800;
          for (cuenta=0;cuenta<=12;cuenta++)
          {
          salida=dato1 | dato2;
          saca(salida);
         VDelay_ms(tiempo);
          dato1=dato1<<1L;
          dato2=dato2>>1L;
          }
   }

  //procedimiento optimo del auto fantastico
//realiza mas optimo el efecto que  llamar a los  procedimeintos de acercar y a lejar unidos
void   auto_fantastico(unsigned int tiempo)
{
 char cuenta;
        unsigned long dato1=0x800000,dato2=0x000001;
          for (cuenta=0;cuenta<=24;cuenta++)
          {
          salida=dato1 | dato2;
          saca(salida);
         VDelay_ms(tiempo);
          dato1=dato1>>1L;
          dato2=dato2<<1L;
          }

}


void derecha_on(unsigned int velo)
{
 char cuenta;

   salida=0x000001;
  saca(salida);
  for (cuenta=0;cuenta<24;cuenta++)
  {
  VDelay_ms(velo);
  salida=(salida<<1)+1;
  saca(salida);
  }

}


void izquierda_on(unsigned int velo)
{
 signed char cuenta;
 unsigned long base=0x1;
   salida=0x800000;// 1 el bit mas alto
  saca(salida);
  for (cuenta=23;cuenta>=0;cuenta--)
  {
  VDelay_ms(velo);
  base=(base<<1)+1;
  salida=(salida>>1);
  saca(salida | base<<(cuenta-1));
  }
}


void derecha_off(unsigned int velo)
{
 char cuenta;
 unsigned  long aux;
   salida=0x000001;
   saca(0xffffff);
  for (cuenta=0;cuenta<24;cuenta++)
  {
  VDelay_ms(velo);
  salida=(salida<<1)+1;
  saca(~salida);
  }

}


void izquierda_off(unsigned int velo)
{
 signed char cuenta;
 unsigned long base=0x1;
   salida=0x800000;// 1 el bit mas alto
  for (cuenta=23;cuenta>=0;cuenta--)
  {
  VDelay_ms(velo);
  base=(base<<1)+1;
  salida=(salida>>1);
  saca(~(salida | base<<(cuenta-1)));
  }
}


//Timer1
//Prescaler 1:8; TMR1 Preload = 15536; Actual Interrupt Time : 200 ms

//Place/Copy this part in declaration section
void InitTimer1(){
  T1CON	 = 0x31;
  TMR1IF_bit	 = 0;
  TMR1H	 = 0x3C;
  TMR1L	 = 0xB0;
  TMR1IE_bit	 = 1;
  INTCON	 = 0xC0;
}

void Interrupt(){
  if (TMR1IF_bit){
    TMR1IE_bit=0;

    TMR1IF_bit = 0;
        TMR1H	 = 0x3C;
    TMR1L	 = 0xB0;
    //Enter your code here
       if (sw==0) efecto++;
     if  (efecto>=max_efect) efecto=0;

    TMR1IE_bit=1;

  
  }
}



void main() 

{
  
   ADC_Init();

  ADCON1=ADCON1 |  0b1110;// an0 digital
  
  TRISA0_bit=1;    //ENTRADA VELOCIDAD
  TRISA1_bit=1;    //ENTRADA EFECTO
  TRISB=TRISC=TRISD=0;   // SALIDA LED
  InitTimer1();// inicia el imer a 100 ms para escanear el suiche

  PORTB=PORTC=PORTD=0;
  
  while(1)
  {
  codigo=ADC_Get_Sample(0);
  retardo=codigo*300.0/1023.0;  //remapea la salida de 80 a 600ms
 // auto_fantastico(retardo);
    //derecha_on(retardo);
    //izquierda_off(retardo);
    
    switch (efecto)
    {
       //primer efecto deseado
        case 0:
                // flash(retardo);
                  derecha_on(100);
                  izquierda_off(100);
                  izquierda_on(100);
                  derecha_off(100);

               break;

          // 2 efecto deseado
        case 1:
              alternado(retardo);

               break;

          //3 efecto deseado
        case 2:
             policia(retardo);

               break;

               // 4 efecto deseado
         case 3:
             derecha(retardo);


               break;


              // 5 efecto deseado
         case 4:
             izquierda(retardo);
               break;


              // 6 efecto deseado
         case 5:
             acerca(retardo);
               break;


              // 7 efecto deseado
         case 6:
             aleja(retardo);
               break;


          // 8 efecto deseado
         case 7:
             auto_fantastico(retardo);
               break;




          // 9 efecto deseado  varios en este caso
         case 8:
                derecha(retardo);
                izquierda(retardo);
                flash(retardo);
               break;


        // por si se suoera el numero de efctos deseado no ahce nada
        default :
                   break;

    
    
    }
    
    
  
  }



}