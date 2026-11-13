#line 1 "C:/Users/Alcides Ramos/Desktop/multiplexación/luces.c"

char efecto=0;
char cuenta;


sbit comun at gpio.b0;

sbit f1 at gpio.b1;
sbit f2 at gpio.b2;
sbit f3 at gpio.b4;
sbit f4 at gpio.b5;


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


void in_todo()
{
in_comun();
in_f1();
in_f2();
in_f3();
in_f4();
}


void out_todo()
{
out_comun();
out_f1();
out_f2();
out_f3();
out_f4();
}


void prende_1(unsigned int tiempo)
{
in_todo();
out_comun();
out_f1();
comun=1;
f1=0;
VDelay_ms(tiempo);
}



void prende_2(unsigned int tiempo)
{
in_todo();
out_comun();
out_f1();
comun=0;
f1=1;
VDelay_ms(tiempo);
}


void prende_3(unsigned int tiempo)
{
in_todo();
out_comun();
out_f2();
comun=1;
f2=0;
VDelay_ms(tiempo);
}


void prende_4(unsigned int tiempo)
{
in_todo();
out_comun();
out_f2();
comun=0;
f2=1;
VDelay_ms(tiempo);
}




void prende_5(unsigned int tiempo)
{
in_todo();
out_comun();
out_f3();
comun=1;
f3=0;
VDelay_ms(tiempo);
}


void prende_6(unsigned int tiempo)
{
in_todo();
out_comun();
out_f3();
comun=0;
f3=1;
VDelay_ms(tiempo);
}


void prende_7(unsigned int tiempo)
{
in_todo();
out_comun();
out_f4();
comun=1;
f4=0;
VDelay_ms(tiempo);
}


void prende_8(unsigned int tiempo)
{
in_todo();
out_comun();
out_f4();
comun=0;
f4=1;
VDelay_ms(tiempo);
}



void apaga_1(unsigned int tiempo)
{
in_todo();
out_comun();
out_f1();
comun=0;
f1=0;
VDelay_ms(tiempo);
}



void apaga_2(unsigned int tiempo)
{
in_todo();
out_comun();
out_f1();
comun=0;
f1=0;
VDelay_ms(tiempo);
}


void apaga_3(unsigned int tiempo)
{
in_todo();
out_comun();
out_f2();
comun=0;
f2=0;
VDelay_ms(tiempo);
}


void apaga_4(unsigned int tiempo)
{
in_todo();
out_comun();
out_f2();
comun=0;
f2=0;
VDelay_ms(tiempo);
}


void apaga_5(unsigned int tiempo)
{
in_todo();
out_comun();
out_f3();
comun=0;
f3=0;
VDelay_ms(tiempo);
}


void apaga_6(unsigned int tiempo)
{
in_todo();
out_comun();
out_f3();
comun=0;
f3=0;
VDelay_ms(tiempo);
}


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


void apaga_8(unsigned int tiempo)
{
in_todo();
out_comun();
out_f4();
comun=0;
f4=0;
VDelay_ms(tiempo);
}


void apaga_todo(unsigned int tiempo)
{
in_todo();
VDelay_ms(tiempo);
}


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





void InitTimer1(){
 T1CON = 0x21;
 TMR1IF_bit = 0;
 TMR1H = 0x3C;
 TMR1L = 0xB0;
 TMR1IE_bit = 1;
 INTCON = 0xC0;
}

void Interrupt(){
 if (TMR1IF_bit){
 TMR1IF_bit = 0;
 TMR1H = 0x3C;
 TMR1L = 0xB0;


 if (sw==0)
 {
 TMR1ON_bit=0;
 efecto++;
 Delay_ms(200);
 TMR1ON_bit=1;
 }
 if (efecto> 4 ) efecto=0;


 }
}


void main()
 {

 CMCON = 7;

 InitTimer1();

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
 }break;

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
 }break;

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
 }break;


 case 3:
 {
 prende_4_bajo(300);
 prende_4_alta(300);

 }break;


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


 }break;




 }





 }




}
