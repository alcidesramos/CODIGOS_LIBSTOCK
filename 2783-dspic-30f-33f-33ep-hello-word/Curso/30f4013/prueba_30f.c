void main()
 {
  ADPCFG=0xffff;    //todo en uno 1=digital  0=analogo
  TRISB=0; // pportb salida
  TRISF3_bit=0; //salida tx
  TRISF2_bit=1; //entrada rx
   UART1_Init(9600);
   

  
  while (1)
  
  {
   LATB=~LATB;
   Delay_ms(200);
   UART1_Write_Text ("HOLA MUNDO\r\n");
  
  }
  
  

}