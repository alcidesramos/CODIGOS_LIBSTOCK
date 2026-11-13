unsigned char readbuff[64] absolute 0x500;   // Buffers should be in USB RAM, please consult datasheet
unsigned char writebuff[64] absolute 0x540;
 unsigned int codigo;
 float voltaje,temperatura;
 
 sbit sw at  RB6_bit;// pin del suiche
sbit sw1 at  RB7_bit;// pin del suiche


void interrupt()
{
   USB_Interrupt_Proc();                   // USB servicing is done inside the interrupt

   
}


void main() 
{
ADCON1=0B1101;// DOS CANALES ANALOGOS
//ENTRADAS
TRISA=255;
TRISB=255;
RBPU_bit=0; // HABILITA PULL UP


 ADC_Init();

HID_Enable(&readbuff,&writebuff);

   while (1)
   {
    codigo=ADC_Get_Sample(0);
    temperatura=codigo*500.0/1023.0;
    Delay_us(10);
    codigo=ADC_Get_Sample(1);
    voltaje=codigo*5.0/1023.0;
    memset(&writebuff,0,64);
              // T/V/SW/SW1
    sprintf(&writebuff,"%.3f/%.2f/",temperatura,voltaje);
   
   if (sw==0) strcat(&writebuff,"1/"); else strcat(&writebuff,"0/") ;
    
   if (sw1==0) strcat(&writebuff,"1/"); else strcat(&writebuff,"0/") ;
   
   strcat(&writebuff,"\0"); // final de cadena
   
   while(!HID_Write(&writebuff,64));

   
   Delay_ms(1);
   

    
    


   }


}