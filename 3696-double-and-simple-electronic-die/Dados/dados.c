//pines dados

sbit d11 at RA0_bit;
sbit d12 at RA1_bit;
sbit d13 at RA2_bit;
sbit d14 at RA3_bit;
sbit d15 at RA6_bit;
sbit d16 at RB0_bit;
sbit d17 at RB1_bit;


sbit d21 at RB2_bit;
sbit d22 at RB3_bit;
sbit d23 at RB4_bit;
sbit d24 at RB5_bit;
sbit d25 at RB6_bit;
sbit d26 at RB7_bit;
sbit d27 at RA7_bit;
         //pulsadorees
sbit sw1 at RA4_bit;
sbit sw2 at RA5_bit;

 // decodificador de dados
                       //          1         2          3        4         5         6
const char numeros[]={0B0000000,0b1000000,0b0001001,0b1001001,0b0101101,0b1101101,0b0111111};

unsigned char random_num=255;
unsigned char cuenta,dato,timer1,timer2;
float valor;


void setbit (unsigned int  *port, char bit1)
{
    *port |= (1 << bit1);
}
void clearbit (unsigned int *port, char bit1)
{

    *port &= ~ (1 << bit1);
}

//para variables
char readbit (unsigned int port, char bit1)
{

    if ((port & (1 << bit1))>0)  return (1);
    else return (0);
}


void borrado1()
{
d11=d12=d13=d14=d15=d16=d17=0;
}

void borrado2()
{
d21=d22=d23=d24=d25=d26=d27=0;
}

// muestra un dato dado1

void dado1(char num)
{
char cont;

    borrado1();

  for (cont=0;cont<=6;cont++)
  {
     if (readbit(numeros[num],cont)==1)
     {
       switch (cont)
       {
         case 0:
                 d11=1;
               break;
         case 1:
                 d12=1;
               break;
         case 2:
                 d13=1;
               break;
         case 3:
                 d14=1;
               break;
         case 4:
                 d15=1;
               break;
         case 5:
                 d16=1;
               break;

         case 6:
                 d17=1;
               break;



       }// fin del switch


     }
    }

}

void dado2(char num)
{
char cont;

    borrado2();

  for (cont=0;cont<=6;cont++)
  {
     if (readbit(numeros[num],cont)==1)
     {
       switch (cont)
       {
         case 0:
                 d21=1;
               break;
         case 1:
                 d22=1;
               break;
         case 2:
                 d23=1;
               break;
         case 3:
                 d24=1;
               break;
         case 4:
                 d25=1;
               break;
         case 5:
                 d26=1;
               break;

         case 6:
                 d27=1;
               break;



       }// fin del switch


     }
    }

}


 float map1(float x, float in_min, float in_max, float out_min, float out_max)
{
float pendiente;

  pendiente=(out_max - out_min) / (in_max - in_min);
  pendiente=pendiente*(x- in_min);
  pendiente=pendiente+out_min;
  return( pendiente);
}


         //aleatorio dado1
unsigned char random1()
{
float temp;
  do
  {
  srand(tmr0*random_num);
   temp=rand();
   valor=map1(temp,0,32767,1,7);
    random_num=valor;
   }while ( (random_num<1) ||(random_num>6));

   return(random_num);

}

unsigned char random2()
{
float temp;
  do
  {
  srand(tmr2*random_num);
   temp=rand();
   valor=map1(temp,0,32767,1,7);
    random_num=valor;
   }while ( (random_num<1) ||(random_num>6));

   return(random_num);

}



void main() 
{
PCON=0;
OSCF_bit=1; // OSCILAODR INTERNO A 4 MEGAS

TRISA=0;
TRISB=0;
// ENTRADAS PULSADORE
TRISA4_bit=1;
TRISA5_bit=1;
// borra todo
PORTA=0;
PORTB=0;

 // configura el timer cero
T0CS_bit=0; // corre con relo interno
PSA_bit=0; // preedscaldor asignado al timer 0

//preescalador de 2
PS2_bit=0;
PS1_bit=0;
PS0_bit=0;


 //configura el timer 2
T2CON=0;
//preescalador  =1
T2CKPS1_bit=0;
T2CKPS0_bit=0;

PR2=255; //

TMR2ON_bit=1; //prende el timer 2





  while (1)
  {
  
     //SI PRESIONA JUGAR A UN SOLO DADO
         if (sw1==0)
         {
            borrado2();// borra el dado 2

            timer1=TMR0;
            
          for (cuenta=0;cuenta<=10;cuenta++)
           {
           dado1(random1());
           Delay_ms(80);

           }
             delay_ms(300);


         }

        //SI PRESIONA JUGAR con 2 DADO
         else if (sw2==0)
         {
            timer1=TMR0;
            timer2=TMR2;

          for (cuenta=0;cuenta<=10;cuenta++)
           {
           dado1(random1());
          dado2(random2());
           Delay_ms(80);

           }

             delay_ms(300);


         }

  
  
  }





}