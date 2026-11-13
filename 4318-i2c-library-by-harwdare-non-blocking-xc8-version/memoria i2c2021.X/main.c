/**
  Generated Main Source File

  Company:
    Microchip Technology Inc.

  File Name:
    main.c

  Summary:
    This is the main file generated using PIC10 / PIC12 / PIC16 / PIC18 MCUs

  Description:
    This header file provides implementations for driver APIs for all modules selected in the GUI.
    Generation Information :
        Product Revision  :  PIC10 / PIC12 / PIC16 / PIC18 MCUs - 1.81.7
        Device            :  PIC16F1824
        Driver Version    :  2.00
*/

/*
    (c) 2018 Microchip Technology Inc. and its subsidiaries. 
    
    Subject to your compliance with these terms, you may use Microchip software and any 
    derivatives exclusively with Microchip products. It is your responsibility to comply with third party 
    license terms applicable to your use of third party software (including open source software) that 
    may accompany Microchip software.
    
    THIS SOFTWARE IS SUPPLIED BY MICROCHIP "AS IS". NO WARRANTIES, WHETHER 
    EXPRESS, IMPLIED OR STATUTORY, APPLY TO THIS SOFTWARE, INCLUDING ANY 
    IMPLIED WARRANTIES OF NON-INFRINGEMENT, MERCHANTABILITY, AND FITNESS 
    FOR A PARTICULAR PURPOSE.
    
    IN NO EVENT WILL MICROCHIP BE LIABLE FOR ANY INDIRECT, SPECIAL, PUNITIVE, 
    INCIDENTAL OR CONSEQUENTIAL LOSS, DAMAGE, COST OR EXPENSE OF ANY KIND 
    WHATSOEVER RELATED TO THE SOFTWARE, HOWEVER CAUSED, EVEN IF MICROCHIP 
    HAS BEEN ADVISED OF THE POSSIBILITY OR THE DAMAGES ARE FORESEEABLE. TO 
    THE FULLEST EXTENT ALLOWED BY LAW, MICROCHIP'S TOTAL LIABILITY ON ALL 
    CLAIMS IN ANY WAY RELATED TO THIS SOFTWARE WILL NOT EXCEED THE AMOUNT 
    OF FEES, IF ANY, THAT YOU HAVE PAID DIRECTLY TO MICROCHIP FOR THIS 
    SOFTWARE.
*/
#define Lo(param) ((char *)&param)[0]
#define Hi(param) ((char *)&param)[1]


#include "mcc_generated_files/mcc.h"

#include "I2C_ARZ.h"



#define led  LATC5

#define  dir_exclavo 0b10100000

unsigned char leido;
char texto[20];


void memoria_i2c_write(unsigned int dir_mem, unsigned char dato_mem)
{
       I2C_STARTBIT();
      I2C_WRITE_BYTE(dir_exclavo & 0b11111110);   //para escribir
     //Dirección
      I2C_WRITE_BYTE(Hi(dir_mem));
     I2C_WRITE_BYTE(Lo(dir_mem));
     //dato
     I2C_WRITE_BYTE(dato_mem);
     I2C_STOPBIT();
     //retardo de escritura
     __delay_ms(5);

}

unsigned char memoria_i2c_read(unsigned int dir_mem)
{
   unsigned char i2c_dato_read;

      I2C_STARTBIT();
      I2C_WRITE_BYTE(dir_exclavo & 0b11111110);   //para escribir
     //Dirección
      I2C_WRITE_BYTE(Hi(dir_mem));
  
      I2C_WRITE_BYTE(Lo(dir_mem));
     //inica proceso de leer
     I2C_REPEATSTARTBIT();
    I2C_WRITE_BYTE(dir_exclavo | 0b00000001);    // para DECIRLE QUE VA A LEER
     i2c_dato_read=I2C_READ_BYTE(0);// lee  1= con reconocimiento 0 sin
     I2C_STOPBIT();
    return(i2c_dato_read);
}


/*
                         Main application
 */
void main(void)
{
    // initialize the device
    SYSTEM_Initialize();

    // When using interrupts, you need to set the Global and Peripheral Interrupt Enable bits
    // Use the following macros to:

    // Enable the Global Interrupts
    //INTERRUPT_GlobalInterruptEnable();

    // Enable the Peripheral Interrupts
    //INTERRUPT_PeripheralInterruptEnable();

    // Disable the Global Interrupts
    //INTERRUPT_GlobalInterruptDisable();

    // Disable the Peripheral Interrupts
    //INTERRUPT_PeripheralInterruptDisable();
    
        printf("INICIANDO\r\n");
          I2C_CONFIG_master(100000);
     __delay_ms(100);
  
     memoria_i2c_write(0,10);

      memoria_i2c_write(1,11);

      memoria_i2c_write(2,12);
   
      memoria_i2c_write(3,13);
   
      memoria_i2c_write(4,14);
  leido=memoria_i2c_read(0);
     printf("leido1= %u  \r\n",(unsigned int)leido);
     
      leido=memoria_i2c_read(1);
     printf("leido1= %u  \r\n",(unsigned int)leido);
    
      leido=memoria_i2c_read(2);
     printf("leido1= %u  \r\n",(unsigned int)leido);
    
       leido=memoria_i2c_read(3);
     printf("leido1= %u  \r\n",(unsigned int)leido);
    

   

    while (1)
    {
        // Add your application code
        
        led=!led;
        __delay_ms(200);
    }
}
/**
 End of File
*/