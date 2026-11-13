

unsigned char readbuff[8] absolute 0x500;
unsigned char writebuff[8] absolute 0x509;


void interrupt()
{
     USB_Interrupt_Proc();        // INTERRPCION POR USB
}



void main() 
{
//Initialize ports
     ADCON1=0b1111;   // todo digital
      TRISB=0x0F;//  RB0 -RB7 ENTRADAS
      NOT_RBPU_bit=0; //HABILITA PULL UPS
      HID_Enable(readbuff,writebuff);
     LATB=0;
    while(1)
      {
        memset(writebuff,0,8);      /// borra buffer

         writebuff[0]=0;  // mofificador modifier keys (SHIFT, CTRL, etc)
         writebuff[1]=0;  //releno o  padding  siempre cero

         if (RB0_bit==0)
         {
          writebuff[2]=4;   //manda la 'A'
         while(!HID_Write(writebuff,8));
         Delay_ms(500);
          writebuff[2]=0;
         while(!HID_Write(writebuff,8));   // deja de mandar

        }

         if (RB1_bit==0)
         {
          writebuff[2]=7;   //manda la 'D'
         while(!HID_Write(writebuff,8));
          Delay_ms(500);
          writebuff[2]=0;
         while(!HID_Write(writebuff,8));   // deja de mandar

         }

         if (RB2_bit==0)
         {
          writebuff[2]=26;   //manda la 'W
         while(!HID_Write(writebuff,8));
        Delay_ms(500);
          writebuff[2]=0;
         while(!HID_Write(writebuff,8));   // deja de mandar

         }

              LATB7_bit=~LATB7_bit;

         Delay_ms(100);



        }

}