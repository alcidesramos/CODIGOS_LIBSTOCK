#include <TimerOne.h>

// Peripheral Constructors

char secuencia[]={18,17,16,15,14,13,12,11,10,9,8,7,6,5,4,3,2,1};

int sw=0;
int pot =5;
char cuenta;
unsigned int codigo;
float demora;
char efecto=0;
char f_cambio=0;


char refresca()
{
   if (f_cambio==1) 
{
f_cambio=0;
return(1);
}
else return(0);
  }


void timer_int()
{
 
  if (digitalRead(sw)==0)
 {
  efecto++;
  if  (efecto>4) efecto=0;
  f_cambio=1;
apaga(0);
 
 } 

}


void apaga(unsigned long ret)
{
   for (cuenta=1; cuenta<=19; cuenta++)
  {
  digitalWrite (cuenta,LOW);
   if (refresca()==1) return;
    }
    delay(ret);
    
 }


void prende(unsigned long ret)
{
   for (cuenta=1; cuenta<=19; cuenta++)
  {
  digitalWrite (cuenta,1);
  if (refresca()==1) return;
   
 }
   delay(ret);
   
}


void  izquierda(unsigned long ret,char en)
{
apaga(0);
   for (cuenta=0 ;cuenta<=17; cuenta++)
  {
  digitalWrite (secuencia[cuenta],HIGH);
    delay(ret); 
    if (refresca()==1) return;
     if (en==1) digitalWrite (secuencia[cuenta],LOW);

   }
}

void  derecha(unsigned long ret,char en)
{
apaga(0);
   for (cuenta=17 ;cuenta>=0; cuenta--)
  {
  digitalWrite (secuencia[cuenta],HIGH);
        delay(ret); 
        if (refresca()==1) return;
         if (en==1) digitalWrite (secuencia[cuenta],LOW);


   }
}



void acerca(unsigned long ret,char en )
{
  char tempo=18;
apaga(0);
   for (cuenta=0 ;cuenta<=9; cuenta++)
  {
   tempo--; 
  digitalWrite (secuencia[cuenta],HIGH);
  digitalWrite (secuencia[tempo],HIGH);
  
    delay(ret); 
    if (refresca()==1) return;
 if (en==1)
 {   
digitalWrite (secuencia[cuenta],LOW);
  digitalWrite (secuencia[tempo],LOW);
 }
    
   }
apaga(0);  
delay(ret);   
 }


void aleja(unsigned long ret,char en)
{
  char tempo=9;
apaga(0);
   for (cuenta=9 ;cuenta<=17; cuenta++)
  {
   tempo--; 
  digitalWrite (secuencia[cuenta],HIGH);
  digitalWrite (secuencia[tempo],HIGH);
  
    delay(ret); 
    if (refresca()==1) return;
 if (en==1)
 {   
digitalWrite (secuencia[cuenta],LOW);
  digitalWrite (secuencia[tempo],LOW);
 }
 
    }
apaga(0);  
delay(ret);   
 }


void cruce(unsigned long ret,char en)
{
  char tempo=17;
apaga(0);
   for (cuenta=0 ;cuenta<=17; cuenta++)
  {
   tempo--; 
  digitalWrite (secuencia[cuenta],HIGH);
  digitalWrite (secuencia[tempo],HIGH);
  
    delay(ret); 
    if (refresca()==1) return;
 if (en==1)
 {   
digitalWrite (secuencia[cuenta],LOW);
  digitalWrite (secuencia[tempo],LOW);
 }
 
   }
apaga(0);  
delay(ret);   
 }



void setup () 
{
 pinMode (sw,INPUT_PULLUP);

pinMode (1,OUTPUT);
pinMode (2,OUTPUT);
pinMode (3,OUTPUT);
pinMode (4,OUTPUT);
pinMode (5,OUTPUT);
pinMode (6,OUTPUT);
pinMode (7,OUTPUT);
pinMode (8,OUTPUT);
pinMode (9,OUTPUT);
pinMode (10,OUTPUT);
pinMode (11,OUTPUT);
pinMode (12,OUTPUT);
pinMode (13,OUTPUT);
pinMode (14,OUTPUT);
pinMode (15,OUTPUT);
pinMode (16,OUTPUT);
pinMode (17,OUTPUT);
pinMode (18,OUTPUT);

Timer1.initialize(250000);         // Dispara cada 250 ms
Timer1.attachInterrupt(timer_int); // Activa la interrupcion del timer 1



// TODO: put your setup code here, to run once:
}

void loop() 
{
  codigo=analogRead(pot);
  demora=codigo*0.6;
  
// TODO: put your main code here, to run repeatedly:
  switch (efecto)

  {
    case 0: 
            apaga(demora);
            prende(demora);
            break;

case 1: 
            derecha(demora,1);
            izquierda(demora,1);
            break;     


case 2: 
            derecha(demora,0);
            izquierda(demora,0);
            break;                   
    
    
case 3: 
             acerca(demora,0);
            aleja(demora,0);
            break;  


   case 4: 
           cruce(demora,1);
           cruce(demora,0);
            
            break;                   
                          
    
    
    
    
    }



}
