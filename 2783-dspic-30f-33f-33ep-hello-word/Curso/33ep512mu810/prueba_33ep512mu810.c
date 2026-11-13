
void main()
 {
  //Configuración de operacion.

//CONFIGURA VELOCIDAD DE OPERACION    A 80 MEGAHERT CON CRISTAL DE 8 MEGA
//VELOCIDAD= 8M*M/(N1*N2)= 10M*48/4=140M

  CLKDIVbits.PLLPRE = 0;      // N1 = 2
  CLKDIVbits.PLLPOST = 0;     // N2 = 2
  PLLFBD=68; // selecciona  M=68;  siempre lo deseado menos 2;  CRISTAL EXTERNO     8Mhz

  //  Todo Digital
  ANSELA = 0x00;
  ANSELB = 0x00;
  ANSELC = 0x00;
  ANSELD = 0x00;
  ANSELE = 0x00;
  ANSELG = 0x00;
  TRISB=0; //TODO SALIDA
  
     Unlock_IOLOCK();

  PPS_Mapping_NoLock(101, _OUTPUT, _U1TX);     //RP101   RF5 ES TX
  
  
  Lock_IOLOCK();
   UART1_Init(9600);

    LATB=0;
    
      while (1)
   {
   LATB=~LATB;
   Delay_ms(200);
   UART1_Write_Text("HOLA MUNDO\r\n");


   }
    


}