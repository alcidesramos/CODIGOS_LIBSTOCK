#line 1 "C:/Users/Alcides Ramos/Desktop/MODBUS TCP PIC/esp8266_modbus.c"
#line 1 "c:/users/alcides ramos/desktop/modbus tcp pic/librerias/modbus_tcp.h"


extern char modbus_rx[];
extern char modbus_tx[];

extern unsigned char rec_largo;
extern unsigned char rec_socket;


void modbus_write_holding(unsigned int dir_mod, unsigned int dat_mod);
void modbus_write_holding_varios(unsigned int dir_mod, unsigned int *buff_datos,unsigned int cuantos);
void modbus_write_digitalcoils(unsigned int dir_mod, unsigned int dat_dig);
void modbus_read_analog(unsigned int dir_mod, unsigned int cuantos);
#line 1 "c:/users/alcides ramos/desktop/modbus tcp pic/librerias/esp8266.h"



extern char modbus_rx[];
extern char modbus_tx[];




void Uart1_write_text_const(const char *info);
char tiempo(unsigned int milis, char cap[30], char cap1[30]);
void esp82666_interrupcion();
char manda_AT_COMANDO(char *coman, char cap[30], char cap1[30],unsigned int retardo);
unsigned long strlen_const(const char *const_pun);
void manda_esp8266_const(const char *info);
void manda_esp8266(char *info);
void manda_esp8266_bytes(unsigned char *info,unsigned int largo);
unsigned char conecta(char *ip_dir);
#line 4 "C:/Users/Alcides Ramos/Desktop/MODBUS TCP PIC/esp8266_modbus.c"
sbit sw1 at RB4_bit;
sbit sw2 at RB5_bit;
sbit sw3 at RB6_bit;
sbit sw4 at RB7_bit;

sbit led1 at LATC0_bit;
sbit led2 at LATC1_bit;
sbit led3 at LATC2_bit;


extern unsigned int rec_son;
extern unsigned char flag_modbus;


unsigned int buff_tx[5];


unsigned int digital_out=0;

sbit digi1 at digital_out.B0;
sbit digi2 at digital_out.B1;
sbit digi3 at digital_out.B2;
sbit digi4 at digital_out.B3;
sbit digi5 at digital_out.B4;




unsigned int codigo;

float val1, val2;
unsigned int lectu1,lectu2;


 void soft_Uart_write_text(char *info)
{
 while(*info) Soft_UART_Write(*info++);
}


void soft_Uart_write_text_const(const char *info)
{
 while(*info) Soft_UART_Write(*info++);
}

 void soft_Uart_write_buff(char *info, unsigned char cuant1)
{
 unsigned char conta;
 for (conta=0;conta<cuant1;conta++) Soft_UART_Write(*info++);
}

 void Interrucciones() iv 0x0008 ics ICS_AUTO
 {
 esp82666_interrupcion();
 }


void main()
{
ADC_Init();
ADCON1=0B1101;

TRISA0_bit=1;
TRISA1_bit=1;

TRISB4_bit=1;
TRISB5_bit=1;
TRISB6_bit=1;
TRISB7_bit=1;

TRISC0_bit=0;
TRISC1_bit=0;
TRISC2_bit=0;


TRISC6_bit=0;
TRISC7_bit=1;

NOT_RBPU_bit=0;

INTCON=0B01000000;

UART1_Init(9600);
Soft_UART_Init(&PORTa, 3,2, 9600, 0);

soft_Uart_write_text("INCIIANDO\r\n");


led1=0;
led2=0;




 RCIF_bit=0;
 RCIE_bit=1;



 GIE_bit=1;


 manda_AT_COMANDO("ATE0","OK", "ERROR", 500);
 manda_AT_COMANDO("AT+CWMODE=1","OK", "no change", 1000);

 manda_AT_COMANDO("AT+CWJAP=\"Familia_Ramos_Zambrano\",\"forever17\"","OK","OK",10000);

 manda_AT_COMANDO("AT+CIPMUX=1","OK","OK",3000);
 manda_AT_COMANDO("AT+CIFSR","OK","OK",5000);
 Delay_ms(2000);

 conecta("192.168.1.15");

 while(1)
 {
 codigo=ADC_Get_Sample(0);
 val1=codigo*100.0/1023.0;
 Delay_us(2);
 codigo=ADC_Get_Sample(1);
 val2=codigo*100.0/1023.0;
 Delay_us(2);
#line 134 "C:/Users/Alcides Ramos/Desktop/MODBUS TCP PIC/esp8266_modbus.c"
 buff_tx[0]=val1;
 buff_tx[1]=val2;
 modbus_write_holding_varios(0,buff_tx,2);


 digi1=!sw1;
 digi2=!sw2;
 digi3=!sw3;
 digi4=!sw4;
 modbus_write_digitalcoils(0,digital_out);



 }



}
