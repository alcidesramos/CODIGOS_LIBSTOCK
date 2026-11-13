void main() 
{

//Configuración de operacion.
//CONFIGURA VELOCIDAD DE OPERACION    A 80 MEGAHERT CON CRISTAL DE 8 MEGA

//DEJAMOS N1 Y N2  EN 2

//VELOCIDAD= 8M*M/(N1*N2)= 4M*80/4=80M

  CLKDIVbits.PLLPRE = 0;      // N1 = 2
  CLKDIVbits.PLLPOST = 0;     // N2 = 2
   PLLFBD=38; // selecciona  M=80;  siempre lo deseado menos 2;


//INICIALIZA PINES DIGITALES
  AD1PCFGL = 0xFFFF;

 //puertos como salida
 TRISB=0x0;
 latb=0;
 Unlock_IOLOCK();
 PPS_Mapping(14,_OUTPUT,_U1TX);
 
 UART1_Init(9600);
 
 Lock_IOLOCK();

 
 while (1)
 {
  LATB0_bit=~LATB0_bit;
  Delay_ms(200);
  
  UART1_Write_Text("HOLA MUNDO\r\n");
 
 }


}