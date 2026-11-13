#include "irarz.h"

char flag_codigo=0;
extern int irpin;

//extern char irpin;


unsigned int cuenta=0;  // almacenar #datos
unsigned char cont; // contador para for
char texto[10];   // usado para convertir numeros a cadena
 unsigned char timer_aux;
 
unsigned char tiempo[68];
volatile bool ledState = LOW; 

extern  unsigned long codigo_ir; // variable salida has que almcena codigo unico


unsigned long  Hash_algoritmo ()
{
unsigned long  hash_acum = FNV_BASIS;

      for (cont=0;cont<cuenta-1;cont++)
          {
         	// Add value into the hash
		hash_acum = (hash_acum * FNV_PRIME) ^ tiempo[cont];
	}

	return (hash_acum);
}


void ir_init()
{
pinMode(irpin, INPUT_PULLUP);
attachInterrupt(digitalPinToInterrupt(irpin), IRINTERRUP,CHANGE);//habilita interrupcion por flancoión al pin
//Configura registroA
TCCR2A=0;
//configura registroB
TCCR2B=0;
TCCR2B=0b111;// Configura el preescalador a 1024 16ms
TCNT2=0;  //Arranca en cero el timer2

sbi(TIFR2,TOV2); // pone un uno para limpiar bandera de desborde timer2
//interrpucion timer2
cbi(TIMSK2,TOIE2); // Deshabilita interrpcion del timer2
sei();//habilita las interrupciones

}



//si se da la interrpcion por cruce 
void IRINTERRUP ()
{
  //el analasis se hace solo
       if (flag_codigo==0)
       
    {
        
          if (cuenta!=0)   // omite el primer dato de interrpcion
           {
           timer_aux=TCNT2; //captura el valor del timer
           TCNT2=0; // resetea el timer para otra lectura
          tiempo[cuenta-1]=timer_aux;
           cuenta++;

                    if (is_high(TIFR2, TOV2)) // mas 16 ms si hubo desborde del timer , fin de datos
                       {
                         cuenta--;
                        flag_codigo=1;
                        detachInterrupt(digitalPinToInterrupt(irpin));//interrupcion flanco deshabilitada

                      }//del if de desborde
              }//fi cueenta
             
        else    // SOLO PARA PRIMERA INTERRUPCION
           {
            sbi(TIFR2,TOV2); // pone un uno para limpiar bandera de desborde
            TCNT2=0;   // resetea el timer
            cuenta++;
            }            

    }//fi flag_cdoigo

    
  }//de la interurpcion


//normaliza las lecturas
void normaliza()
{
for (cont=0;cont<cuenta-1;cont++)
          {
        if ( (tiempo[cont]>=cod1-paso1) &&   (tiempo[cont]<=cod1+paso))  tiempo[cont]=cod1;
        else if ( (tiempo[cont]>=cod2-paso1) &&   (tiempo[cont]<=cod2+paso))  tiempo[cont]=cod2;
        else if ( (tiempo[cont]>=cod3-paso1) &&   (tiempo[cont]<=cod3+paso1))  tiempo[cont]=cod3;
        else    tiempo[cont]=cod1;
          }
}


void analiza_ir()
{

  if (flag_codigo==1)
     {
       normaliza();
       codigo_ir=Hash_algoritmo();
       flag_codigo=0;
      cuenta=0;
      attachInterrupt(digitalPinToInterrupt(irpin), IRINTERRUP,CHANGE);//habilita interrupcion por flanco 
    //  Serial.println(codigo_ir,HEX);//deshabilitar si se desea

     }

}
