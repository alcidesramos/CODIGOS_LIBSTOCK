#line 1 "C:/Users/Alcides Ramos/Desktop/UBIDOTS HLK - RM04/esp8266_full_con_mikroc_pic/PIC2018_Full_2018/UBIDOTS.c"
sbit suiche at RB0_bit;
sbit led_out at LATB7_bit;


unsigned int codigo;
float temperatura;

char trama[150];
char trama_largo[20];
char captu[30];


char led;
int var_largo;



enum estados_ {cap_l,cap_u,cap_e,cap_co,esp_final} ;

 char estado_rec=cap_l;


float valor_rx;
char trama_rx[50];
char contador_trama=0;
unsigned long demora=0;


char lee_trama()
{
char dato_rx;

memset(trama_rx,50,0);
demora=0;
contador_trama=0;
estado_rec=cap_l;

RCIF_bit=0;
CREN_bit=0;
CREN_bit=1;

while (demora<=66667)
{
 demora++;
 switch (estado_rec)
 {
 case cap_l:
 if (RCIF_bit==1)
 {
 dato_rx=UART_Read();
 trama_rx[contador_trama]=dato_rx;
 if (dato_rx!='l') contador_trama=0;
 else
 {
 contador_trama++;
 estado_rec=cap_u;
 }
 RCIF_bit=0;
 }
 break;
 case cap_u:
 if (RCIF_bit==1)
 {
 dato_rx=UART_Read();
 trama_rx[contador_trama]=dato_rx;
 if (dato_rx!='u')
 {
 contador_trama=0;
 estado_rec=cap_l;
 }
 else
 {
 contador_trama++;
 estado_rec=cap_e;
 }
 RCIF_bit=0;
 }
 break;

 case cap_e:
 if (RCIF_bit==1)
 {
 dato_rx=UART_Read();
 trama_rx[contador_trama]=dato_rx;
 if (dato_rx!='e')
 {
 contador_trama=0;
 estado_rec=cap_l;
 }
 else
 {
 contador_trama++;
 estado_rec=cap_co;
 }
 RCIF_bit=0;
 }
 break;


 case cap_co:
 if (RCIF_bit==1)
 {
 dato_rx=UART_Read();
 trama_rx[contador_trama]=dato_rx;
 if (dato_rx!='\"')
 {
 contador_trama=0;
 estado_rec=cap_l;

 }
 else
 {
 contador_trama++;
 estado_rec=esp_final;
 }
 RCIF_bit=0;
 }

 break;

 case esp_final:
 if (RCIF_bit==1)
 {
 dato_rx=UART_Read();
 trama_rx[contador_trama]=dato_rx;
 contador_trama++;
 if (dato_rx=='}') return(1);
 RCIF_bit=0;
 }
 break;


 }

 }
 return(0);

}



unsigned long strlen_const(const char *const_pun)
{
 unsigned int cuen_const=0;

 while (*const_pun++!=0) cuen_const++;
 return (cuen_const);

}

void manda_serial_const(const char *info)
{
 while(*info) UART1_Write(*info++);
}

void DAC_Initialize(void)
{

 VREFCON1 = 0xA0;

 VREFCON2 = 0x00;
}

void DAC_SetOutput(char inputData)
{
 VREFCON2 = inputData;
}


void main()
{


 ANSELA=0;
 ANSELB=0;
 ANSELC=0;
 ANSELA.b0=1;

 trisa.b0=1;
 trisb.b0=1;
 TRISB.b7=0;

 TRISC6_bit=0;
 TRISC7_bit=1;

 UART1_Init(115200);
 DAC_Initialize();
 while (1)
 {

 codigo=ADC_Read(0);
 temperatura=codigo*500.0/1023.0;

 if (suiche==0) led='0'; else led='1';

 memset(trama_largo,20,0);
 memset(trama,150,0);


 sprintf(trama,"{\"temperatura\": %5.2f ,\"led\": %c}\n",temperatura,led);

 var_largo=strlen(trama)-1;

 sprinti(trama_largo,"%u\n\n",var_largo);





 manda_serial_const("POST /api/v1.6/devices/clase/?token=BBFF-YjaqLBFKWPA4FWJoKb8j2xwigDRXkL HTTP/1.1\nHost: things.ubidots.com\nContent-Type: application/json\nContent-Length: ");

 UART1_Write_Text(trama_largo);


 UART1_Write_Text(trama);
 Delay_ms(2000);


 manda_serial_const("GET /api/v1.6/devices/clase/suiche/values?page_size=1&token=BBFF-YjaqLBFKWPA4FWJoKb8j2xwigDRXkL HTTP/1.1\nHost: things.ubidots.com\n\n");

 lee_trama();

 strcpy(captu, strtok(trama_rx, ":"));
 strcpy(captu, strtok(0, "}"));

 valor_rx=atof(captu);
 if (valor_rx==1.0) led_out=1; else led_out=0;


 manda_serial_const("GET /api/v1.6/devices/clase/voltaje/values?page_size=1&token=BBFF-YjaqLBFKWPA4FWJoKb8j2xwigDRXkL HTTP/1.1\nHost: things.ubidots.com\n\n");

 lee_trama();

 strcpy(captu, strtok(trama_rx, ":"));
 strcpy(captu, strtok(0, "}"));

 valor_rx=atof(captu);

 DAC_SetOutput(valor_rx*31.0/5.0) ;






 }

}
