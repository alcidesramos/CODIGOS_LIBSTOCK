#include "dac.h"


unsigned int codigo;

void main() 
{
   // LATx registers

    LATA = 0x00;
    LATC = 0x00;

    /**
    TRISx registers
    */
    TRISA = 0x37;
    TRISC = 0x3F;

    /**
    ANSELx registers
    */
    ANSELC = 0x3F;
    ANSELA = 0x17;

    /**
    WPUx registers
    */
    WPUA = 0x00;
    WPUC = 0x00;
    OPTION_REG.nWPUEN = 1;

    /**
    ODx registers
    */
    ODCONA = 0x00;
    ODCONC = 0x00;

    /**
    SLRCONx registers
    */
    SLRCONA = 0x37;
    SLRCONC = 0x3F;
    
    DAC_Initialize();
    
    
    while (1)
    
    {
    codigo=ADC_Read(1);
    DAC_SetOutput(codigo/4);
    Delay_ms(200);
    
    
    }






}