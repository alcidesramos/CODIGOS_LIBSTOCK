#line 1 "C:/Users/Alcides/Desktop/multiplexacion 7 segmentos/multiplexacion 7 segmentos.c"



void InitTimer0(){
 OPTION_REG = 0x82;
 TMR0 = 6;
 INTCON = 0xA0;
}







char codigo_siete[]={63,6,91,79,102,109,125,7,127,111};


 sbit dis1 at portb.b0;
 sbit dis2 at portb.b1;
 sbit dis3 at portb.b2;
 sbit dis4 at portb.b3;

char mux_siete=1;
char num_dis1=1,num_dis2=2,num_dis3=3,num_dis4=4;
unsigned int numero=0;

char dis_caracteres[6];




void limpia_display()
{
dis1=0;
dis2=0;
dis3=0;
dis4=0;
}

void Interrupt()
{

 if (TMR0IF_bit)
 {
 TMR0IF_bit = 0;
 TMR0 = 100;
 limpia_display();
  portb =  portb  | mux_siete;

 switch (mux_siete)
 {

 case 0b1:
 {
  portd =codigo_siete[num_dis1];
 }break;


 case 0b10:
 {
  portd =codigo_siete[num_dis2];
 }break;

 case 0b100:
 {
  portd =codigo_siete[num_dis3];
 }break;


 case 0b1000:
 {
  portd =codigo_siete[num_dis4];
 }break;



 }

 mux_siete=mux_siete<<1;
 if (mux_siete==0b10000) mux_siete=1;


 }
}

void main()

{
 trisb=0;
 TRISD=0;

 INTCON = 0b01000000;
 InitTimer0();
 GIE_bit=1;

 while (1)
 {

 numero++;
 if (numero>9999) numero=0;
 WordToStrWithZeros(numero,dis_caracteres);
 num_dis1=dis_caracteres[4]-48;
 num_dis2=dis_caracteres[3]-48;
 num_dis3=dis_caracteres[2]-48;
 num_dis4=dis_caracteres[1]-48;
 Delay_ms(500);


 }

 }
