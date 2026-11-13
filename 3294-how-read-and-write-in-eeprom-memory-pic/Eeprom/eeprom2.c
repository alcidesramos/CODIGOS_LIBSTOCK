float  contador;
unsigned char pruebA;
char texto[50];
unsigned int EEPROM_Read_Int(unsigned char dir)
{
  char *punte;//puntero tipo char
 unsigned int leido;
 punte=&leido;
dir+=1; //apunta a la parte alta
 *punte=EEPROM_Read(dir);
   punte++;
   dir--; //Apunta a la baja
   *punte=EEPROM_Read(dir);
 return (leido);

}

void EEPROM_Write_Int(unsigned char dir, unsigned int dato_e)
{
char *punte;//puntero tipo char
 punte=&dato_e;
 dir+=1;//   apunta a la parte baja
EEPROM_Write(dir,*punte);
//  prueba=*punte;
 punte++;
 dir--;   // pasa a la parte alta
 EEPROM_Write(dir,*punte);
//  prueba=*punte;

}

  unsigned long EEPROM_Read_Long(unsigned char dir)
{
  char *punte;//puntero tipo char
 unsigned long leido;
 punte=&leido;
  dir+=3; //apunta a la parte alta
 *punte=EEPROM_Read(dir);
   punte++;
   dir--; //pasa siguiente Byte
   *punte=EEPROM_Read(dir);
   punte++;
   dir--; //pasa siguiente Byte
   *punte=EEPROM_Read(dir);
   punte++;
   dir--; //pasa siguiente Byte
   *punte=EEPROM_Read(dir);
 return (leido);

}

void EEPROM_Write_Long(unsigned char dir, unsigned long dato_e)
{
char *punte;//puntero tipo char
 punte=&dato_e;
 dir+=3;//   apunta a la parte baja
EEPROM_Write(dir,*punte);
//  prueba=*punte;
 punte++;
 dir--;   // pasa siguiente dir
 EEPROM_Write(dir,*punte);
 punte++;
 dir--;   // pasa siguiente dir
 EEPROM_Write(dir,*punte);
 punte++;
 dir--;   // pasa siguiente dir
 EEPROM_Write(dir,*punte);
//  prueba=*punte;

}

float EEPROM_Read_Float(unsigned char dir)
{
  char *punte;//puntero tipo char
 float leido;

 punte=&leido;
  dir+=3; //apunta a la parte alta
 *punte=EEPROM_Read(dir);
   punte++;
   dir--; //pasa siguiente Byte
   *punte=EEPROM_Read(dir);
   punte++;
   dir--; //pasa siguiente Byte
   *punte=EEPROM_Read(dir);
   punte++;
   dir--; //pasa siguiente Byte
   *punte=EEPROM_Read(dir);
 return (leido);

}

void EEPROM_Write_Float(unsigned char dir, float dato_e)
{
char *punte;//puntero tipo char
 punte=&dato_e;
 dir+=3;//   apunta a la parte baja
EEPROM_Write(dir,*punte);
//  prueba=*punte;
 punte++;
 dir--;   // pasa siguiente dir
 EEPROM_Write(dir,*punte);
 punte++;
 dir--;   // pasa siguiente dir
 EEPROM_Write(dir,*punte);
 punte++;
 dir--;   // pasa siguiente dir
 EEPROM_Write(dir,*punte);
//  prueba=*punte;

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
    *cadena=0; // coloca caracter null a la variable de la cadena



}

void EEPROM_Write_Texto(unsigned char dir, char *cadena)
{

    while(*cadena)
   {
   EEPROM_Write(dir,*cadena);
   cadena++;
   dir++;   // pasa a la parte alta
   }
   EEPROM_Write(dir,0);  ;// escribe caracter null



}



void main() 
{
//EEPROM_Write_Int(0,500);

ADCON1=0B1111; // TODO DIGITAL
TRISB7_bit=1; // entrda pulsador
TRISC6_bit=0; // salita tx
NOT_RBPU_bit=0; // Habilito las pull ups portb

   UART1_Init(9600);
    contador=10.5;
    
  /*  if (RB7_bit==0) EEPROM_Write(0,contador);
    contador=EEPROM_Read(0);
    */
  /* if (RB7_bit==0) EEPROM_Write_Int(0,contador);
    contador=EEPROM_Read_Int(0);  */

       /*if (RB7_bit==0) EEPROM_Write_Long(0,contador);
    contador=EEPROM_Read_Long(0); */
    
    /*if (RB7_bit==0) EEPROM_Write_Float(0,contador);
    contador=EEPROM_Read_Float(0);    */
    

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
      // sprintf(texto,"valor=%lu\r\n",(unsigned long) contador);
        sprintf(texto,"valor=%.2f\r\n", contador);

       UART1_Write_Text(texto);
       Delay_ms(1000);
       
   
   }
}