#line 1 "C:/Users/Alcides Ramos/Desktop/Eeprom/eeprom2.c"
float contador;
unsigned char pruebA;
char texto[50];
unsigned int EEPROM_Read_Int(unsigned char dir)
{
 char *punte;
 unsigned int leido;
 punte=&leido;
dir+=1;
 *punte=EEPROM_Read(dir);
 punte++;
 dir--;
 *punte=EEPROM_Read(dir);
 return (leido);

}

void EEPROM_Write_Int(unsigned char dir, unsigned int dato_e)
{
char *punte;
 punte=&dato_e;
 dir+=1;
EEPROM_Write(dir,*punte);

 punte++;
 dir--;
 EEPROM_Write(dir,*punte);


}

 unsigned long EEPROM_Read_Long(unsigned char dir)
{
 char *punte;
 unsigned long leido;
 punte=&leido;
 dir+=3;
 *punte=EEPROM_Read(dir);
 punte++;
 dir--;
 *punte=EEPROM_Read(dir);
 punte++;
 dir--;
 *punte=EEPROM_Read(dir);
 punte++;
 dir--;
 *punte=EEPROM_Read(dir);
 return (leido);

}

void EEPROM_Write_Long(unsigned char dir, unsigned long dato_e)
{
char *punte;
 punte=&dato_e;
 dir+=3;
EEPROM_Write(dir,*punte);

 punte++;
 dir--;
 EEPROM_Write(dir,*punte);
 punte++;
 dir--;
 EEPROM_Write(dir,*punte);
 punte++;
 dir--;
 EEPROM_Write(dir,*punte);


}

float EEPROM_Read_Float(unsigned char dir)
{
 char *punte;
 float leido;

 punte=&leido;
 dir+=3;
 *punte=EEPROM_Read(dir);
 punte++;
 dir--;
 *punte=EEPROM_Read(dir);
 punte++;
 dir--;
 *punte=EEPROM_Read(dir);
 punte++;
 dir--;
 *punte=EEPROM_Read(dir);
 return (leido);

}

void EEPROM_Write_Float(unsigned char dir, float dato_e)
{
char *punte;
 punte=&dato_e;
 dir+=3;
EEPROM_Write(dir,*punte);

 punte++;
 dir--;
 EEPROM_Write(dir,*punte);
 punte++;
 dir--;
 EEPROM_Write(dir,*punte);
 punte++;
 dir--;
 EEPROM_Write(dir,*punte);


}

void EEPROM_Read_Texto(unsigned char dir, char* cadena)
{
 char dato;
 do
 {
 dato=EEPROM_Read(dir);
 *cadena=dato;
 cadena++;
 dir++;
 }
 while (dato!=0);
 *cadena=0;



}

void EEPROM_Write_Texto(unsigned char dir, char *cadena)
{

 while(*cadena)
 {
 EEPROM_Write(dir,*cadena);
 cadena++;
 dir++;
 }
 EEPROM_Write(dir,0); ;



}



void main()
{


ADCON1=0B1111;
TRISB7_bit=1;
TRISC6_bit=0;
NOT_RBPU_bit=0;

 UART1_Init(9600);
 contador=10.5;
#line 172 "C:/Users/Alcides Ramos/Desktop/Eeprom/eeprom2.c"
if (RB7_bit==0) EEPROM_Write_Texto(0,"Hola mundo");
EEPROM_Read_Texto(0,&texto);
UART1_Write_Text(texto);



 UART1_Write_Text("INICIANDO\r\n");

 while (1)
 {
 EEPROM_Write_Texto(0,"probando");
 UART1_Write_Text("probando\r\n");
 Delay_ms(1000) ;

 EEPROM_Write_Texto(0,"hola mundo");
 UART1_Write_Text("hola mundo\r\n");
 Delay_ms(1000) ;

 EEPROM_Write_Texto(0,"como va todo");
 UART1_Write_Text("como va todo\r\n");
 delay_ms(1000) ;



 }

 while (1)
 {
 contador+=1;
 EEPROM_Write_Float(0,contador);

 sprintf(texto,"valor=%.2f\r\n", contador);

 UART1_Write_Text(texto);
 Delay_ms(1000);


 }
}
