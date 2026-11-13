#line 1 "C:/Users/Alcides Ramos/Desktop/HID_READ/HID_READ.c"
unsigned char readbuff[64] absolute 0x500;
unsigned char writebuff[64] absolute 0x540;
sbit led1 at LATB0_bit;

sbit led2 at LATB1_bit;

 char tramita[20];

 unsigned int pwm1;
 float pwm2;

 char led;




void interrupt(){
 USB_Interrupt_Proc();
}




void main()
{
ADCON1=0b1111;

TRISB0_bit=0;
TRISB1_bit=0;


TRISC1_bit=0;
TRISC2_bit=0;


PWM1_Init(500);
PWM2_Init(500);
PWM1_Set_Duty(100);
PWM2_Set_Duty(200);

PWM1_Start();
PWM2_Start();



 HID_Enable(&readbuff,&writebuff);



 while (1)
 {
 while(!HID_Read());

 if (strstr(&readbuff,"dat="))

 {
 strcpy(tramita, strtok(&readbuff, "="));

 strcpy(tramita, strtok(0, "/"));
 pwm1= atoi(tramita) ;
 PWM1_Set_Duty(pwm1*255/100);

 strcpy(tramita, strtok(0, "/"));
 pwm2= atof(tramita) ;
 PWM2_Set_Duty(pwm2*255/100);

 strcpy(tramita, strtok(0, "/"));
 led= atoi(tramita) ;

 if (led==1) led1=1; else led1=0;

 strcpy(tramita, strtok(0, "/"));
 led= atoi(tramita) ;

 if (led==1) led2=1; else led2=0;




 }








 }




}
