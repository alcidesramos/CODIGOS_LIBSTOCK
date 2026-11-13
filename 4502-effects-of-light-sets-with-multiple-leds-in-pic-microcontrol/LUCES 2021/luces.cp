#line 1 "C:/Users/Alcides Ramos/Desktop/LUCES 2021/luces.c"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for pic/include/built_in.h"
#line 8 "C:/Users/Alcides Ramos/Desktop/LUCES 2021/luces.c"
unsigned int retardo;
unsigned int codigo;

unsigned long salida;

char efecto=0;
const max_efect=8;

void saca(unsigned long dato)
{
  PORTB = ((char *)&dato)[0] ;
  PORTC = ((char *)&dato)[1] ;
  PORTD = ((char *)&dato)[2] ;
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
 salida=0x800000;
 saca(salida);
 for (cuenta=0;cuenta<24;cuenta++)
 {
 VDelay_ms(velo);
 salida=salida>>1L;
 saca(salida);
 }

}



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



void auto_fantastico(unsigned int tiempo)
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
 salida=0x800000;
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
 unsigned long aux;
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
 salida=0x800000;
 for (cuenta=23;cuenta>=0;cuenta--)
 {
 VDelay_ms(velo);
 base=(base<<1)+1;
 salida=(salida>>1);
 saca(~(salida | base<<(cuenta-1)));
 }
}






void InitTimer1(){
 T1CON = 0x31;
 TMR1IF_bit = 0;
 TMR1H = 0x3C;
 TMR1L = 0xB0;
 TMR1IE_bit = 1;
 INTCON = 0xC0;
}

void Interrupt(){
 if (TMR1IF_bit){
 TMR1IE_bit=0;

 TMR1IF_bit = 0;
 TMR1H = 0x3C;
 TMR1L = 0xB0;

 if ( RA1_bit ==0) efecto++;
 if (efecto>=max_efect) efecto=0;

 TMR1IE_bit=1;


 }
}



void main()

{

 ADC_Init();

 ADCON1=ADCON1 | 0b1110;

 TRISA0_bit=1;
 TRISA1_bit=1;
 TRISB=TRISC=TRISD=0;
 InitTimer1();

 PORTB=PORTC=PORTD=0;

 while(1)
 {
 codigo=ADC_Get_Sample(0);
 retardo=codigo*300.0/1023.0;




 switch (efecto)
 {

 case 0:

 derecha_on(100);
 izquierda_off(100);
 izquierda_on(100);
 derecha_off(100);

 break;


 case 1:
 alternado(retardo);

 break;


 case 2:
 policia(retardo);

 break;


 case 3:
 derecha(retardo);


 break;



 case 4:
 izquierda(retardo);
 break;



 case 5:
 acerca(retardo);
 break;



 case 6:
 aleja(retardo);
 break;



 case 7:
 auto_fantastico(retardo);
 break;





 case 8:
 derecha(retardo);
 izquierda(retardo);
 flash(retardo);
 break;



 default :
 break;



 }



 }



}
