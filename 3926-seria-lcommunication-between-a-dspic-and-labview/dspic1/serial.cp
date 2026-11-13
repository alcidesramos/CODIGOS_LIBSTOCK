#line 1 "C:/Users/Alcides Ramos/Desktop/dspic1/serial.c"
sbit sw1 at RB0_bit ;


unsigned int codigo;
 char texto[50];
float velocidad;
void main()
{

 AD1PCFGL = 0xFFFF;
 AD1PCFGLbits.PCFG0=0;

 TRISA=0;
 TRISB=0;
 TRISB0_bit=1;
 TRISB1_bit=1;
 TRISA0_bit=1;

 PPS_Mapping(13,_OUTPUT,_U1TX);
 UART1_Init(9600);

 ADC1_Init_Advanced(_ADC_12bit, _ADC_INTERNAL_REF);


 UART1_Write_Text("TEM=22.5/");

 while(1)
 {

 if (sw1==0) UART1_Write_Text("LED1=ON/");
 else UART1_Write_Text("LED1=OFF/");

 if ( RB1_bit ==0) UART1_Write_Text("LED2=ON/");
 else UART1_Write_Text("LED2=OFF/");

 codigo=ADC1_Get_Sample(0);
 velocidad=codigo*200.0/4095.0;


 sprintf( texto,"VEL=%.1f/" ,velocidad);
 UART1_Write_Text(texto);


 LATB=~LATB;
 Delay_ms(300);

 }



}
