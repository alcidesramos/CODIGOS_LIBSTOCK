#define      n_efectos     4  //numero de efectos a realizar
char efecto=0;
char cuenta;

//pin comun
sbit comun at gpio.b0;
//fila de otros leds
sbit f1 at gpio.b1;
sbit f2 at gpio.b2;
sbit f3 at gpio.b4;
sbit f4 at gpio.b5;

//suiche de entrada
sbit sw at gpio.b3;


void in_comun()
{
TRISIO0_bit=1;
}

void in_f1()
{
TRISIO1_bit=1;
}

void in_f2()
{
TRISIO2_bit=1;
}
void in_f3()
{
TRISIO4_bit=1;
}
void in_f4()
{
TRISIO5_bit=1;
}

void out_comun()
{
TRISIO0_bit=0;
}

void out_f1()
{
TRISIO1_bit=0;
}
void out_f2()
{
TRISIO2_bit=0;
}
void out_f3()
{
TRISIO4_bit=0;
}

void out_f4()
{
TRISIO5_bit=0;
}

//configura todo entrada
void in_todo()
{
in_comun();
in_f1();
in_f2();
in_f3();
in_f4();
}

//configura todo omo salida
void out_todo()
{
out_comun();
out_f1();
out_f2();
out_f3();
out_f4();
}

//enciende el 1 led
void prende_1(unsigned int tiempo)
{
in_todo();  // apagar todo
out_comun();
out_f1();
comun=1;
f1=0;
VDelay_ms(tiempo);
}


//enciende el 2 led
void prende_2(unsigned int tiempo)
{
in_todo();
out_comun();
out_f1();
comun=0;
f1=1;
VDelay_ms(tiempo);
}

//enciende el 3 led
void prende_3(unsigned int tiempo)
{
in_todo();
out_comun();
out_f2();
comun=1;
f2=0;
VDelay_ms(tiempo);
}

//enciende el 4 led
void prende_4(unsigned int tiempo)
{
in_todo();
out_comun();
out_f2();
comun=0;
f2=1;
VDelay_ms(tiempo);
}



//enciende el 5 led
void prende_5(unsigned int tiempo)
{
in_todo();
out_comun();
out_f3();
comun=1;
f3=0;
VDelay_ms(tiempo);
}

//enciende el 6 led
void prende_6(unsigned int tiempo)
{
in_todo();
out_comun();
out_f3();
comun=0;
f3=1;
VDelay_ms(tiempo);
}

//enciende el 7 led
void prende_7(unsigned int tiempo)
{
in_todo();
out_comun();
out_f4();
comun=1;
f4=0;
VDelay_ms(tiempo);
}

//enciende el 8 led
void prende_8(unsigned int tiempo)
{
in_todo();
out_comun();
out_f4();
comun=0;
f4=1;
VDelay_ms(tiempo);
}


//apaga el 1 led
void apaga_1(unsigned int tiempo)
{
in_todo();
out_comun();
out_f1();
comun=0;
f1=0;
VDelay_ms(tiempo);
}


//apaga el 2 led
void apaga_2(unsigned int tiempo)
{
in_todo();
out_comun();
out_f1();
comun=0;
f1=0;
VDelay_ms(tiempo);
}

//apaga el 3 led
void apaga_3(unsigned int tiempo)
{
in_todo();
out_comun();
out_f2();
comun=0;
f2=0;
VDelay_ms(tiempo);
}

//apaga el 4 led
void apaga_4(unsigned int tiempo)
{
in_todo();
out_comun();
out_f2();
comun=0;
f2=0;
VDelay_ms(tiempo);
}

//apaga el 5 led
void apaga_5(unsigned int tiempo)
{
in_todo();
out_comun();
out_f3();
comun=0;
f3=0;
VDelay_ms(tiempo);
}

//apaga el 6 led
void apaga_6(unsigned int tiempo)
{
in_todo();
out_comun();
out_f3();
comun=0;
f3=0;
VDelay_ms(tiempo);
}

//apaga el 7 led
void apaga_7(unsigned int tiempo)
{
in_todo();
out_comun();
out_f4();
comun=0;
f4=0;
Delay_5ms();
VDelay_ms(tiempo);
}

//apaga el 8 led
void apaga_8(unsigned int tiempo)
{
in_todo();
out_comun();
out_f4();
comun=0;
f4=0;
VDelay_ms(tiempo);
}

//apaga todo;
void apaga_todo(unsigned int tiempo)
{
in_todo();
VDelay_ms(tiempo);
}

//prende 4 led parte baja
void prende_4_bajo(unsigned int tiempo)
{
in_todo();
out_todo();
comun=1;
f1=0;
f2=0;
f3=0;
f4=0;
VDelay_ms(tiempo);
}



//prende 4 led parte alta
void prende_4_alta(unsigned int tiempo)
{
in_todo();
out_todo();
comun=0;
f1=1;
f2=1;
f3=1;
f4=1;
VDelay_ms(tiempo);
}

  //Timer1
//Prescaler 1:4; TMR1 Preload = 15536; Actual Interrupt Time : 200 ms

//Place/Copy this part in declaration section
void InitTimer1(){
  T1CON	 = 0x21;
  TMR1IF_bit	 = 0;
  TMR1H	 = 0x3C;
  TMR1L	 = 0xB0;
  TMR1IE_bit	 = 1;
  INTCON	 = 0xC0;
}

void Interrupt(){
  if (TMR1IF_bit){
    TMR1IF_bit = 0;
    TMR1H	 = 0x3C;
    TMR1L	 = 0xB0;
    //Enter your code here

       if (sw==0)
        {
         TMR1ON_bit=0; //para el timer, para evitar mas intrrupciones
        efecto++;
        Delay_ms(200); // retardo antirebote
         TMR1ON_bit=1;
        }
        if (efecto>n_efectos)  efecto=0;  //limete de nuemro de efectos a realizar


  }
}


void main()
 {
 //comparador apagado
 CMCON = 7;
 
 InitTimer1(); //configuiramos int cada 200ms

   while(1)
   {
  switch (efecto)
{
    case 0:
    {
    prende_1(200);
    prende_2(200);
    prende_3(200);
    prende_4(200);
    prende_5(200);
    prende_6(200);
    prende_7(200);
    prende_8(200);
   }break;  // efecto 0

    case 1:
    {
    prende_8(100);
    prende_7(100);
    prende_6(100);
    prende_5(100);
  prende_4(100);
    prende_3(100);
     prende_2(100);
   prende_1(100);
   }break;  // efecto 1

    case 2:
    {
    prende_1(100);
    prende_2(100);
    prende_3(100);
    prende_4(100);
    prende_5(100);
    prende_6(100);
     prende_7(100);
     prende_8(100);
    prende_8(100);
    prende_7(100);
    prende_6(100);
    prende_5(100);
    prende_4(100);
    prende_3(100);
     prende_2(100);
   prende_1(100);
   }break;  // efecto 2


    case 3:
    {
   prende_4_bajo(300);
   prende_4_alta(300);

   }break;  // efecto 3


    case 4:
    {
    for (cuenta=1;cuenta<=3;cuenta++)
    {
    prende_1(100);
    apaga_1(80);
    }

    for (cuenta=1;cuenta<=3;cuenta++)
    {
    prende_2(100);
    apaga_2(80);
    }

    for (cuenta=1;cuenta<=3;cuenta++)
    {
    prende_3(100);
    apaga_3(80);
    }
    for (cuenta=1;cuenta<=3;cuenta++)
    {
    prende_4(100);
    apaga_4(80);
    }

     for (cuenta=1;cuenta<=3;cuenta++)
    {
    prende_5(100);
    apaga_5(80);
    }

     for (cuenta=1;cuenta<=3;cuenta++)
    {
    prende_6(100);
    apaga_6(80);
    }

     for (cuenta=1;cuenta<=3;cuenta++)
    {
    prende_7(100);
    apaga_7(80);
    }

     for (cuenta=1;cuenta<=3;cuenta++)
    {
    prende_8(100);
    apaga_8(80);
    }


   }break;  // efecto 4




 }  //fin switch



   
   
   }


 

}