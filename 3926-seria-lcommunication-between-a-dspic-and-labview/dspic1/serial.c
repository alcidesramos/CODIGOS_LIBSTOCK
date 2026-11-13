sbit sw1 at RB0_bit  ;
#define sw2  RB1_bit

unsigned int codigo;
 char texto[50];
float velocidad;
void main()
{
//INICIALIZA PINES DIGITALES
  AD1PCFGL = 0xFFFF;        //1=digital  0=analogo
  AD1PCFGLbits.PCFG0=0;// an0 es analogo
  
  TRISA=0; //todo salida  A
  TRISB=0;  //salida todo B
  TRISB0_bit=1; //ENTRADA PULSADOR1
  TRISB1_bit=1; //ENTRADA
  TRISA0_bit=1; //entrada analoga
  
   PPS_Mapping(13,_OUTPUT,_U1TX);
  UART1_Init(9600); //puerto serial a 9600 baudios
  
  ADC1_Init_Advanced(_ADC_12bit, _ADC_INTERNAL_REF);  //ADC A 12BITS
  
  
  UART1_Write_Text("TEM=22.5/");
  
  while(1)
  {

   if (sw1==0)  UART1_Write_Text("LED1=ON/");
   else    UART1_Write_Text("LED1=OFF/");
  
   if (sw2==0)  UART1_Write_Text("LED2=ON/");
   else    UART1_Write_Text("LED2=OFF/");

   codigo=ADC1_Get_Sample(0);
   velocidad=codigo*200.0/4095.0;
 
 
   sprintf( texto,"VEL=%.1f/" ,velocidad);
   UART1_Write_Text(texto);
   

  LATB=~LATB; // porque se usa puerto como salida
  Delay_ms(300);
  
  }
  


}