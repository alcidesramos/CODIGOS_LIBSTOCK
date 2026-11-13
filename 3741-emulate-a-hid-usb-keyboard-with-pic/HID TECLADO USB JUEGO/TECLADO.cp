#line 1 "C:/Users/Alcides Ramos/Desktop/TECLADO USB/TECLADO.c"


unsigned char readbuff[8] absolute 0x500;
unsigned char writebuff[8] absolute 0x509;


void interrupt()
{
 USB_Interrupt_Proc();
}



void main()
{

 ADCON1=0b1111;
 TRISB=0x0F;
 NOT_RBPU_bit=0;
 HID_Enable(readbuff,writebuff);
 LATB=0;
 while(1)
 {
 memset(writebuff,0,8);

 writebuff[0]=0;
 writebuff[1]=0;

 if (RB0_bit==0)
 {
 writebuff[2]=4;
 while(!HID_Write(writebuff,8));
 Delay_ms(500);
 writebuff[2]=0;
 while(!HID_Write(writebuff,8));

 }

 if (RB1_bit==0)
 {
 writebuff[2]=7;
 while(!HID_Write(writebuff,8));
 Delay_ms(500);
 writebuff[2]=0;
 while(!HID_Write(writebuff,8));

 }

 if (RB2_bit==0)
 {
 writebuff[2]=26;
 while(!HID_Write(writebuff,8));
 Delay_ms(500);
 writebuff[2]=0;
 while(!HID_Write(writebuff,8));

 }

 LATB7_bit=~LATB7_bit;

 Delay_ms(100);



 }

}
