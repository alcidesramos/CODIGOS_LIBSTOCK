#line 1 "C:/Users/Alcides Ramos/Desktop/HID_Transmision/HID_WRITE.c"
unsigned char readbuff[64] absolute 0x500;
unsigned char writebuff[64] absolute 0x540;
 unsigned int codigo;
 float voltaje,temperatura;

 sbit sw at RB6_bit;
sbit sw1 at RB7_bit;


void interrupt()
{
 USB_Interrupt_Proc();


}


void main()
{
ADCON1=0B1101;

TRISA=255;
TRISB=255;
RBPU_bit=0;


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

 sprintf(&writebuff,"%.3f/%.2f/",temperatura,voltaje);

 if (sw==0) strcat(&writebuff,"1/"); else strcat(&writebuff,"0/") ;

 if (sw1==0) strcat(&writebuff,"1/"); else strcat(&writebuff,"0/") ;

 strcat(&writebuff,"\0");

 while(!HID_Write(&writebuff,64));


 Delay_ms(1);






 }


}
