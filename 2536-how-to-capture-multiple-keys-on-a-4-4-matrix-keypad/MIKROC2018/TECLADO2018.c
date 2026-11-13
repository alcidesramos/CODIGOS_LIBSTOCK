// LCD module connections
sbit LCD_RS at RB7_bit;
sbit LCD_EN at RB6_bit;
sbit LCD_D4 at RB5_bit;
sbit LCD_D5 at RB4_bit;
sbit LCD_D6 at RB3_bit;
sbit LCD_D7 at RB2_bit;

sbit LCD_RS_Direction at TRISB7_bit;
sbit LCD_EN_Direction at TRISB6_bit;
sbit LCD_D4_Direction at TRISB5_bit;
sbit LCD_D5_Direction at TRISB4_bit;
sbit LCD_D6_Direction at TRISB3_bit;
sbit LCD_D7_Direction at TRISB2_bit;
// End LCD module connections

//puerto del teclado
char keypadPort at PORTD;
char tecla;
char texto[10];

sbit led at LATC0_bit;
sbit led1 at LATA0_bit;

char retardo_cad[10];
unsigned int retardo=100;


//maquina de estado para capturar varias teclas
enum teclado_estado {n1,n2,n3,n4,en};
char estado_teclado=n1;


char teclado_deco()
{
char tec=0;
   tec = Keypad_Key_Press();     //mejor
    if (tec!=0)
    {
    switch (tec)
    {
     case 1:tec='7';break;
     case 2:tec='8';break;
     case 3:tec='9';break;
     case 4:tec='/';break;
     case 5:tec='4';break;
     case 6:tec='5';break;
     case 7:tec='6';break;
     case 8:tec='*';break;
     case 9:tec='1';break;
     case 10:tec='2';break;
     case 11:tec='3';break;
     case 12:tec='-';break;
     case 13:tec='E';break;
     case 14:tec='0';break;
     case 15:tec='=';break;
     case 16:tec='+';break;
     }//Fin del switch
    return (tec);

    }//si hay una tecla valida
    
    }
    
    
void teclado_estado()
{
    tecla=teclado_deco();

    switch (estado_teclado)
    {
      case n1:

              if ( (tecla!=0)  && (isdigit(tecla)))
              {
              led1=1;
              retardo_cad[0]=tecla;
              estado_teclado=n2;
              Lcd_Chr(2,8,tecla);
              Delay_ms(400); // retardo antirrebote
              }
            break;
            
            

      case n2:
              if ((tecla!=0)  && (isdigit(tecla)))
              {
              retardo_cad[1]=tecla;
              estado_teclado=n3;
              Lcd_Chr(2,9,tecla);
              Delay_ms(400); // retardo antirrebote
              }
            break;


      case n3:

              if ((tecla!=0)  && (isdigit(tecla)))
              {
              retardo_cad[2]=tecla;
              estado_teclado=n4;
              Lcd_Chr(2,10,tecla);
              Delay_ms(400); // retardo antirrebote
              }
            break;


      case n4:
              if ((tecla!=0)  && (isdigit(tecla)))
              {
              retardo_cad[3]=tecla;
              estado_teclado=en;
              Lcd_Chr(2,11,tecla);
              Delay_ms(400); // retardo antirrebote

              }
            break;

        case en:

               if ((tecla!=0)  && (tecla!='='))  // no se presiono el igual
              {
              led1=0;
               estado_teclado=n1; // vuelve al estado de  captura del primer numero
             Lcd_Out(2,8,"      ");// borra la pantalla
             Delay_ms(600); // retardo antirrebote


              }
               // si si se presiono el enter
              else if ((tecla!=0)  && (tecla=='='))  //si se presiono el igual
              {
              led1=0;
             retardo_cad[4]=0;  //final de cadena
              retardo=atoi(retardo_cad); // lo pasa a numero y calcula el retardo deseado
              estado_teclado=n1; // vuelve al estado de caprura del primer numero.
              Lcd_Out(2,8,"      ");// borra la pantalla
             Delay_ms(600); // retardo antirrebote
              }

              break;
            
            
      }
      
   }



 void miretardo(signed int valor)
{

while (valor>0)
{
   Delay_us(800);
     teclado_estado();
     valor--;
 }

}

void main()
{
//TODO DIGITAL
ANSELA=0;
ANSELB=0;
ANSELC=0;
ANSELD=0;
ANSELE=0;
 Lcd_Init();                        // Initialize LCD
 Lcd_Cmd(_LCD_CLEAR);               // Clear display
 Lcd_Cmd(_LCD_CURSOR_OFF);          // Cursor off
 Lcd_Out(1,6,"TECLADO");
 
 Keypad_Init();
 
 

   TRISC0_bit=0; //salida led
      TRISA0_bit=0; //salida led1
   led=1;
   led1=0;
 

    while (1)
    {

      led=~led;//invierte el led
   miretardo(retardo);


    }




}