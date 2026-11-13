void main()
 {
 
 
 //Configuración de operacion.
//CONFIGURA VELOCIDAD DE OPERACION    A 80 MEGAHERT CON CRISTAL DE 4 MEGA

//DEJAMOS N1 Y N2  EN 2

//VELOCIDAD= 1M*M/(N1*N2)= 10M*80/4=80M

  CLKDIVbits.PLLPRE = 0;      // N1 = 2
  CLKDIVbits.PLLPOST = 0;     // N2 = 2
   PLLFBD=30; // selecciona  M=80;  siempre lo deseado menos 2;

  ADPCFG=0xffff; // todo digital
  AD1PCFGH=0xffff;
  AD1PCFGL=0xffff;
  TRISB=0;
  TRISF3_bit=0; //salida tx
  TRISF2_bit=1;// entrada rx
  
  UART1_Init(9600);
  
  
  
  
  while (1)
  {
  LATB=~LATB;
  Delay_ms(200);
  UART1_Write_Text("HOLA MUNDO\r\n");
  
  
  }
  
  


 }