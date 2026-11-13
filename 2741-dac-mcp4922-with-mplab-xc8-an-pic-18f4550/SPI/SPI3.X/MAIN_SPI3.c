/*
 * File:   MAIN_SPI3.c
 * Author: Alcides Ramos
 *
 * Created on January 31, 2019, 8:57 PM
 */


// PIC18F4550 Configuration Bit Settings

// 'C' source line config statements

// CONFIG1L
#pragma config PLLDIV = 1       // PLL Prescaler Selection bits (No prescale (4 MHz oscillator input drives PLL directly))
#pragma config CPUDIV = OSC1_PLL2// System Clock Postscaler Selection bits ([Primary Oscillator Src: /1][96 MHz PLL Src: /2])
#pragma config USBDIV = 1       // USB Clock Selection bit (used in Full-Speed USB mode only; UCFG:FSEN = 1) (USB clock source comes directly from the primary oscillator block with no postscale)

// CONFIG1H
#pragma config FOSC = XT_XT     // Oscillator Selection bits (XT oscillator (XT))
#pragma config FCMEN = OFF      // Fail-Safe Clock Monitor Enable bit (Fail-Safe Clock Monitor disabled)
#pragma config IESO = OFF       // Internal/External Oscillator Switchover bit (Oscillator Switchover mode disabled)

// CONFIG2L
#pragma config PWRT = ON        // Power-up Timer Enable bit (PWRT enabled)
#pragma config BOR = ON         // Brown-out Reset Enable bits (Brown-out Reset enabled in hardware only (SBOREN is disabled))
#pragma config BORV = 3         // Brown-out Reset Voltage bits (Minimum setting 2.05V)
#pragma config VREGEN = OFF     // USB Voltage Regulator Enable bit (USB voltage regulator disabled)

// CONFIG2H
#pragma config WDT = OFF        // Watchdog Timer Enable bit (WDT disabled (control is placed on the SWDTEN bit))
#pragma config WDTPS = 32768    // Watchdog Timer Postscale Select bits (1:32768)

// CONFIG3H
#pragma config CCP2MX = ON      // CCP2 MUX bit (CCP2 input/output is multiplexed with RC1)
#pragma config PBADEN = ON      // PORTB A/D Enable bit (PORTB<4:0> pins are configured as analog input channels on Reset)
#pragma config LPT1OSC = OFF    // Low-Power Timer 1 Oscillator Enable bit (Timer1 configured for higher power operation)
#pragma config MCLRE = ON       // MCLR Pin Enable bit (MCLR pin enabled; RE3 input pin disabled)

// CONFIG4L
#pragma config STVREN = ON      // Stack Full/Underflow Reset Enable bit (Stack full/underflow will cause Reset)
#pragma config LVP = ON         // Single-Supply ICSP Enable bit (Single-Supply ICSP enabled)
#pragma config ICPRT = OFF      // Dedicated In-Circuit Debug/Programming Port (ICPORT) Enable bit (ICPORT disabled)
#pragma config XINST = OFF      // Extended Instruction Set Enable bit (Instruction set extension and Indexed Addressing mode disabled (Legacy mode))

// CONFIG5L
#pragma config CP0 = OFF        // Code Protection bit (Block 0 (000800-001FFFh) is not code-protected)
#pragma config CP1 = OFF        // Code Protection bit (Block 1 (002000-003FFFh) is not code-protected)
#pragma config CP2 = OFF        // Code Protection bit (Block 2 (004000-005FFFh) is not code-protected)
#pragma config CP3 = OFF        // Code Protection bit (Block 3 (006000-007FFFh) is not code-protected)

// CONFIG5H
#pragma config CPB = OFF        // Boot Block Code Protection bit (Boot block (000000-0007FFh) is not code-protected)
#pragma config CPD = OFF        // Data EEPROM Code Protection bit (Data EEPROM is not code-protected)

// CONFIG6L
#pragma config WRT0 = OFF       // Write Protection bit (Block 0 (000800-001FFFh) is not write-protected)
#pragma config WRT1 = OFF       // Write Protection bit (Block 1 (002000-003FFFh) is not write-protected)
#pragma config WRT2 = OFF       // Write Protection bit (Block 2 (004000-005FFFh) is not write-protected)
#pragma config WRT3 = OFF       // Write Protection bit (Block 3 (006000-007FFFh) is not write-protected)

// CONFIG6H
#pragma config WRTC = OFF       // Configuration Register Write Protection bit (Configuration registers (300000-3000FFh) are not write-protected)
#pragma config WRTB = OFF       // Boot Block Write Protection bit (Boot block (000000-0007FFh) is not write-protected)
#pragma config WRTD = OFF       // Data EEPROM Write Protection bit (Data EEPROM is not write-protected)

// CONFIG7L
#pragma config EBTR0 = OFF      // Table Read Protection bit (Block 0 (000800-001FFFh) is not protected from table reads executed in other blocks)
#pragma config EBTR1 = OFF      // Table Read Protection bit (Block 1 (002000-003FFFh) is not protected from table reads executed in other blocks)
#pragma config EBTR2 = OFF      // Table Read Protection bit (Block 2 (004000-005FFFh) is not protected from table reads executed in other blocks)
#pragma config EBTR3 = OFF      // Table Read Protection bit (Block 3 (006000-007FFFh) is not protected from table reads executed in other blocks)

// CONFIG7H
#pragma config EBTRB = OFF      // Boot Block Table Read Protection bit (Boot block (000000-0007FFh) is not protected from table reads executed in other blocks)

// #pragma config statements should precede project file includes.
// Use project enums instead of #define for ON and OFF.



#include <xc.h>
#define cs1 LATB2
#define ldac LATB3

#define  _XTAL_FREQ 4000000

//spi_software

#define spi_ck  LATC0
#define spi_dat  LATC1


unsigned char dato_spi;
unsigned int codigo;


 void UNO (unsigned int  *port, char bit1)
{
    *port |= (1 << bit1);
}


unsigned char spi_write(unsigned char spi_dat)
{
    SSPBUF=spi_dat;
    while (BF==0);
    return(SSPBUF);
 }

void dac_write(unsigned int dat,char canal)
{
    unsigned char low_b,hig_b;
    
   UNO(&dat,12); // deja habilitado el shundownt
   UNO(&dat,13); // sin ganancia
   
   if (canal==2)  UNO(&dat,15); // saca por el canal b
  
    low_b=dat & 0x00FF;// captura bute bajo
    hig_b=dat >> 8;// captura el bute alto
   
    
    cs1=0;
     spi_write(hig_b);
    spi_write(low_b);   
    cs1=1;
    
    ldac=0;
    __delay_us(100);
    ldac=1;
}



unsigned int adc_read(char canal)
{
    ADCON0bits.CHS = canal;    
   
    ADCON0bits.ADON = 1; //  prende el modulo
    __delay_us(10);
    
      GO_nDONE = 1;

     while (GO_nDONE==1); //espera que obtenga el dato  o puede ser un retardo  
    
    return((unsigned int)ADRESH<<8 | ADRESL);
 
}

void spi_s_write(unsigned char dato_)
{
  unsigned char cont_s= 0;

  for(cont_s = 0;cont_s < 8; cont_s++)
  {

    if((dato_ & 0x80) != 0) spi_dat = 1;  //sino termina 1 rotacion coloca un uno sino un cero
    else    spi_dat = 0;
    dato_ <<= 1;  //rota
    //genera un pulso del reloj
    spi_ck = 1;
    __delay_us(10);
    spi_ck = 0;
    __delay_us(10);
  }
}


void dac_write_s(unsigned int dat,char canal)
{
    unsigned char low_b,hig_b;
    
   UNO(&dat,12); // deja habilitado el shundownt
   UNO(&dat,13); // sin ganancia
   
   if (canal==2)  UNO(&dat,15); // saca por el canal b
  
    low_b=dat & 0x00FF;
    hig_b=dat >> 8;
   
    
    cs1=0;
     spi_s_write(hig_b);
    spi_s_write(low_b);
    cs1=1;           
    ldac=0;
    __delay_us(100);
    ldac=1;
}


void main(void) 

{
    ADCON1bits.PCFG=0B1101;// RA0 RA1 SON ANALOGOS
    TRISA0=1;
    TRISA1=1;
    
    //spi
    TRISB0=1;
    TRISB1=0; //SCK
    TRISB2=0; // CS
    TRISC7=0; //SDO
    TRISB3=0; //ldac
    
    //PINES SOFTWARE
    TRISC0=0;
    TRISC1=0;
    
    ldac=1;
    
    cs1=1;
    
    
    SSPSTAT=0;
    SMP=0;// MUESTREA A LA MITAD DEL RELOJ
    CKE=0;// RECIBE CUENDO  PASA DE REPOSO A ACTIVO EL RELOJ
    
    SSPCON1=0;
    SSPEN=1; // HABILITA SPI
    CKP=0; // EL ESTADO DE REPOSO ES CERO
    SSPCON1bits.SSPM=0B0010; // VELOCIDAD DEL RELOD ES CRISTAL /16
    
    // adc
    
    ADCON0=0;
    
    ADCON2=0;
    ADFM=1; // JUSTIFICA RESULTADO A LA DERECHA
    //TIEMPO DE ADQUISICION 4 TDA
    ADCON2bits.ACQT=0b010;
    
    //RELOJ DE CONVERSION 4TCY
    ADCS2=1;
    ADCS1=0;
    ADCS0=0;

    
    while (1)
   {    codigo=adc_read(0)*4;
        dac_write_s(codigo,1);
    codigo=adc_read(1)*4;
        dac_write_s(codigo,2);
        __delay_ms(100);
        
   
   }
    
    
    
    
    
    
    
    return;
}
