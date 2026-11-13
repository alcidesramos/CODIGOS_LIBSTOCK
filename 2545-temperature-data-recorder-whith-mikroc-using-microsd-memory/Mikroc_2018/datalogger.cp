#line 1 "C:/Users/Alcides_Ramos/Desktop/Datalogger/Mikroc_2018/datalogger.c"
#line 1 "c:/users/alcides_ramos/desktop/datalogger/mikroc_2018/librerias/ds18b20.h"
float ds18b20_read(char *puerto,char pin);


float ds18b20_read(char *puerto,char pin)
{
unsigned int temp_;
float tempo__;
unsigned char t1_,t2_,td__;
float signo=1.0;
float sensor_temp_;



 Ow_Reset(puerto, pin);
 Delay_ms(18);
 Ow_Write(puerto, pin, 0xCC);
 Delay_ms(1);
 Ow_Write(puerto, pin, 0x44);
 Delay_ms(150);

 Ow_Reset(puerto, pin);
 Delay_ms(18);
 Ow_Write(puerto, pin, 0xCC);
 Delay_ms(1);
 Ow_Write(puerto, pin, 0xBE);
 Delay_ms(1);
 t1_ = Ow_Read(puerto, pin);
 t2_ = Ow_Read(puerto, pin);

 temp_=( (unsigned int)t2_<<8) | t1_;


 if ( t2_ & 0x80)
 {
 temp_=~temp_+1;
 signo=-1.0;
 }
 temp_=temp_>>4;

 td__=t1_ & 0x0f;

 tempo__=0;
 if (td__.b3==1)tempo__=tempo__+0.5;
 if (td__.b2==1) tempo__=tempo__+0.25;
 if (td__.b1==1) tempo__=tempo__+0.125;
 if (td__.b0==1) tempo__=tempo__+0.0625;
 if (signo<0) tempo__=-tempo__;
 sensor_temp_=(temp_*signo)+tempo__;

 return (sensor_temp_);

}
#line 1 "c:/users/alcides_ramos/desktop/datalogger/mikroc_2018/librerias/ds1307_sh.h"


extern sfr sbit Soft_I2C_Scl;
extern sfr sbit Soft_I2C_Sda ;
extern sfr sbit Soft_I2C_Scl_Direction ;
extern sfr sbit Soft_I2C_Sda_Direction ;

typedef struct ds1307_estruct {
 char _segundo,_minuto,_hora;
 char _dia,_fecha,_mes,_anho;
 char _control;
}reloj;

extern reloj ds1307;


void reloj_init_s();
void guarda_segundo_s();
void guarda_minuto_s();
void guarda_hora_s();
void guarda_dia_s();
void guarda_fecha_s();
void guarda_mes_s();
void guarda_anho_s();
void guarda_control_s();
void guardatodo_s();
char lee_segundo_s();
char lee_minuto_s();
char lee_dia_s();
char lee_hora_s();
char lee_fecha_S();
char lee_mes_S();
char lee_anho_s();
void leertodo_s();
void carga_inicial(char _seg,char _min,char _hor,char _dia,char _fecha,char _mes, char _anho);
#line 7 "C:/Users/Alcides_Ramos/Desktop/Datalogger/Mikroc_2018/datalogger.c"
float temperatura;
char texto[50];


sbit Mmc_Chip_Select at LATB4_bit;
sbit Mmc_Chip_Select_Direction at TRISB4_bit;




sbit Soft_I2C_Scl at RC0_BIT;
sbit Soft_I2C_Sda at RC1_bit;
sbit Soft_I2C_Scl_Direction at TRISC0_bit;
sbit Soft_I2C_Sda_Direction at TRISC1_bit;



reloj ds1307;


void reloj_carga_inicial()
{
ds1307._hora=9;
ds1307._minuto=10;
ds1307._segundo=0;
ds1307._fecha=11;
ds1307._mes=8;
ds1307._anho=18;
ds1307._dia=6;
guardatodo_s();
}




void main()
{

ANSELA=0;
ANSELB=0;
ANSELC=0;


TRISA=0;
TRISB=0;
TRISC=0;

 RBPU_bit=0;
 TRISB7_bit=1;

UART1_Init(9600);

TRISB0_bit=1;
TRISB3_bit=0;
TRISB1_bit=0;

UART1_Write_Text("INICIANDO\r\n");




ds18b20_read(&porta,0);
Delay_ms(1000);
ds18b20_read(&porta,0);
Delay_ms(800);





 SPI1_Init_Advanced(_SPI_MASTER_OSC_DIV64, _SPI_DATA_SAMPLE_MIDDLE, _SPI_CLK_IDLE_LOW, _SPI_LOW_2_HIGH);

 while (Mmc_Fat_Init()!=0) ;


 SPI1_Init_Advanced(_SPI_MASTER_OSC_DIV4, _SPI_DATA_SAMPLE_MIDDLE, _SPI_CLK_IDLE_LOW, _SPI_LOW_2_HIGH);
 UART1_Write_Text("MEMORIA INICIADA\r\n");




 Mmc_Fat_Assign("Datos.TXT",0xA0);
 Mmc_Fat_Write("TEMPE\t", 6);
 Mmc_Fat_Write("HORA\t\t", 6);
 Mmc_Fat_Write("FECHA\r\n", 7);

 reloj_init_s();





 while (1)
 {

 temperatura=ds18b20_read(&porta,0);
 memset(texto,0,50);

 sprintf(texto,"%06.3f\t",temperatura);

 if(RB7_bit==1) Mmc_Fat_Write(texto, strlen(texto));

 UART1_Write_Text(texto);


 leertodo_s();

 memset(texto,0,50);
 sprintf(texto,"%02u:%02u:%02u\t",(unsigned int)ds1307._hora,(unsigned int)ds1307._minuto,(unsigned int)ds1307._segundo);

 if(RB7_bit==1) Mmc_Fat_Write(texto, strlen(texto));

 UART1_Write_Text(texto);

 memset(texto,0,50);
 sprintf(texto,"%02u/%02u/20%02u\r\n",(unsigned int)ds1307._fecha,(unsigned int)ds1307._mes,(unsigned int)ds1307._anho);

 if(RB7_bit==1) Mmc_Fat_Write(texto, strlen(texto));

 UART1_Write_Text(texto);
 if(RB7_bit==0) Mmc_Fat_Close();

 Delay_ms(2000);

 }


}
