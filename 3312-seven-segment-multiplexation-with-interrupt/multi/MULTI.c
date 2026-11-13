unsigned int conteo=0;

#define display LATB   // puerto del display

// pines de habilitador
sbit  EN1 at LATC0_bit;
sbit  EN2 at LATC1_bit;
sbit  EN3 at LATC2_bit;
sbit  EN4 at LATA2_bit;

sbit  LED at LATA1_bit;

 // CODIGO NUMEROS
char codigo_siete[]={63,6,91,79,102,109,125,7,127,111};//catodo
char multiplexa=1;

char digito1,digito2,digito3,digito4;
char texto[20];

void apaga_siete()
{
EN1=0;
EN2=0;
EN3=0;
EN4=0;
}

 void Interrupcion() iv 0x0008 ics ICS_AUTO 
 
 {
    if (TMR1IF_bit==1)
    {
     // carga el valor para mantener los 5ms
    TMR1H=231;
    TMR1L=150;
    apaga_siete();

     switch (multiplexa)
     {
       case 0b00001:
            display=codigo_siete[digito1];// suma la parte baja
               EN1=1;
              break;

      case 0b0010:
            display=codigo_siete[digito2];// suma la parte baja
               EN2=1;
              break;

      case 0b0100:
            display=codigo_siete[digito3];// suma la parte baja
             EN3=1;
              break;

      case 0b1000:
            display=codigo_siete[digito4];// suma la parte baja
             EN4=1;
              break;


     }
        multiplexa=multiplexa<<1;
        
     if (multiplexa==0b10000) multiplexa=1;  // si ya paso al cuarto display apunta de nuevo al primero


    
    
    
    TMR1IF_bit=0;
    }


  }

void mostrar()
{
 sprintf(texto,"%04d\r\n",conteo);
 digito1=texto[3]-48;//  pasa a numero;
 digito2=texto[2]-48;//  pasa a numero;
 digito3=texto[1]-48;//  pasa a numero;
 digito4=texto[0]-48;//  pasa a numero;

}


void main() 
{
ADCON1=0B1111; // TODO DIGITAL
// TODO SALIDA
TRISA=0;
TRISB=0;
TRISC=0;
INTCON=0B01000000;// HABILITA INTERRPCION D EPERIFERICOS
 UART1_Init(9600);
    // configuración timer 1 a 5ms
    T1CON=0;
    // preescaldor de 2
    T1CKPS1_bit=0;
    T1CKPS0_bit=1;
   
    TMR1H=231;
    TMR1L=150;
    
    TMR1IF_bit=0;
    TMR1IE_bit=1;  // HABILITA LA INTERRPCION DEL TIMER1
    TMR1ON_bit=1; // PRENDE EL TIMER

    GIE_bit=1; // AUTORIZA LAS INTERRPCIONES
    
        while (1)
        {
        
         if (conteo>9999) conteo=0;
          mostrar();
        conteo+=10;
        UART1_Write_Text(texto);
        Delay_ms(150);

        
        
        
        }




}