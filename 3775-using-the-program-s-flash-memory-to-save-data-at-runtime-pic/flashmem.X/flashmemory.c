/**
  MEMORY Generated Driver File

  @Company
    Microchip Technology Inc.

  @File Name
    memory.c

  @Summary
    This is the generated driver implementation file for the MEMORY driver using PIC10 / PIC12 / PIC16 / PIC18 MCUs

  @Description
    This file provides implementations of driver APIs for MEMORY.
    Generation Information :
        Product Revision  :  PIC10 / PIC12 / PIC16 / PIC18 MCUs - 1.81.0
        Device            :  PIC16F15324
        Driver Version    :  2.02
    The generated drivers are tested against the following:
        Compiler          :  XC8 2.10 and above
        MPLAB             :  MPLAB X 5.35
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

/**
  Section: Included Files
*/

#include <xc.h>
#include "flashmemory.h"


/**
  Section: Flash Module APIs
*/

unsigned int FLASH_Read(unsigned int flash_dir)
{
    unsigned char GIE_Value = GIE;   // captura estado actual del habilitador de interrupcion
    
    GIE = 0;     // Disable interrupts
    NVMADRL = (flash_dir & 0x00FF);
    NVMADRH = ((flash_dir & 0xFF00) >> 8);
     
    NVMCON1bits.NVMREGS = 0;    
    NVMCON1bits.RD = 1;      // Inicia la lectura
    NOP();
    NOP();
    GIE = GIE_Value;	// restaura el valor de GIE

    //retorna el dato leido
    return ((unsigned int)((NVMDATH << 8) | NVMDATL));
}

//guarda un solo dato, pero debe leer en bufffer y despues gurdar todo el buffer
// la direccion no es necesariamente multiple de 32
void FLASH_Write(unsigned int flash_dir, unsigned int *Buf, unsigned int data_flash)
{
    // captura la direccion inicial multiplo de 32 donde se encuenra la direccion dada
    unsigned int dir_ini = (unsigned int)(flash_dir & ((END_FLASH-1) ^ (FLASH_BLOCKSIZE -1)));
    //captura la posicion del dato a guardar dentro de la fila
    unsigned char offset = (unsigned char)(flash_dir & (FLASH_BLOCKSIZE -1));
    unsigned char i;

    //Lee la flash toda la fila y lo guarda en el buffer
    for (i=0; i<FLASH_BLOCKSIZE ; i++)
    {
        Buf[i] = FLASH_Read((dir_ini+i));
    }

    // escribe en el buffer el nuevo dato
    Buf[offset] = data_flash;

    //Guarda la info
    FLASH_WriteBlock(dir_ini, Buf);
}

signed char FLASH_WriteBlock(unsigned int FLASH_DIR, unsigned int *flashWordArray)
{
    unsigned int    dir_aux  = (unsigned int )(FLASH_DIR & ( (END_FLASH-1) ^ (FLASH_BLOCKSIZE -1)));
    unsigned char     GIE_Value = GIE;   // captura el valor de gie
    unsigned char i;

    
    // analiza si es multiplo de 32 
    if( FLASH_DIR != dir_aux )
    {
        return -1;
    }

    GIE = 0;         // deshabilita interrpcion

    //borra el Bloque
    FLASH_EraseBlock(FLASH_DIR);

    // Block write sequence
    NVMCON1bits.NVMREGS = 0;    
    NVMCON1bits.WREN = 1;    // habilita escritura
    NVMCON1bits.LWLO = 1;   

    for (i=0; i<FLASH_BLOCKSIZE; i++)
    {
        // carga parte baja de la direccion
        NVMADRL = (FLASH_DIR & 0xFF);
        // carga la parte alta
        NVMADRH = ((FLASH_DIR & 0xFF00) >> 8);

	// guarta el dato
        NVMDATL = flashWordArray[i];// parte baja del dato
        NVMDATH = ((flashWordArray[i] & 0xFF00) >> 8);//parte alta del dato

        if(i == (FLASH_BLOCKSIZE-1))
        {
            // incia escritura de la flash
            NVMCON1bits.LWLO = 0;
        }

    // comando para acceder a la flash
        NVMCON2 = 0x55;
        NVMCON2 = 0xAA;
        NVMCON1bits.WR = 1;//CTIVA BIT DE LECURA
        NOP();
        NOP();

	FLASH_DIR++;// pasa a la siguiente direccion
    }

    NVMCON1bits.WREN = 0;       // deshabilita escritura
    GIE = GIE_Value;   // habilita escritura

    return 0;
}

void FLASH_EraseBlock(unsigned int startAddr)
{
    unsigned char GIE_Value = GIE;   // almacena el bit de autorización de interrupciones
    

    GIE = 0; // deshabilita las interrupciones
    // carga parte baja
    NVMADRL = (startAddr & 0xFF);
    // carga parte alta
    NVMADRH = ((startAddr & 0xFF00) >> 8);

    // secuencia de borrado
    NVMCON1bits.NVMREGS = 0;    // Deselect Configuration space
    NVMCON1bits.FREE = 1;    // Specify an erase operation
    NVMCON1bits.WREN = 1;    // Allows erase cycles

    //secuencia para acceder a la flash
    NVMCON2 = 0x55;
    NVMCON2 = 0xAA;
    NVMCON1bits.WR = 1;      
    NOP();
    NOP();

    NVMCON1bits.WREN = 0;       // deshabilita la escritura
    GIE = GIE_Value;	// Recupera el valor de GIE
}


void FLASH_Write_Int(unsigned int flash_dir, unsigned int *Buf, unsigned int data_flash)
{
    char *punte;//puntero tipo char

 // captura la direccion inicial multiplo de 32 donde se encuenra la direccion dada
    unsigned int dir_ini = (unsigned int)(flash_dir & ((END_FLASH-1) ^ (FLASH_BLOCKSIZE -1)));
    //captura la posicion del dato a guardar dentro de la fila
    unsigned char offset = (unsigned char)(flash_dir & (FLASH_BLOCKSIZE -1))+1;
    unsigned char i;

    punte=&data_flash;
    
   
 
     //Lee la flash toda la fila y lo guarda en el buffer
    for (i=0; i<FLASH_BLOCKSIZE ; i++)
    {
        Buf[i] = FLASH_Read((dir_ini+i));
    }

        // escribe en el buffer el nuevo dato
   
    Buf[offset] = *punte;
    punte++;
    offset--;
    Buf[offset] = *punte;
    
    //Guarda la info
    FLASH_WriteBlock(dir_ini, Buf);
}

unsigned int FLASH_Read_Int(unsigned int flash_dir)
{
  char *punte;//puntero tipo char
  unsigned int data;
  unsigned int leido;

  unsigned char GIE_Value = GIE;   // captura estado actual del habilitador de interrupcion

   punte=&leido;
   flash_dir+=1; //apunta a la parte alta

  
    GIE = 0;     // Disable interrupts
    NVMADRL = (flash_dir & 0x00FF);
    NVMADRH = ((flash_dir & 0xFF00) >> 8);
     
    NVMCON1bits.NVMREGS = 0;    
    NVMCON1bits.RD = 1;      // Inicia la lectura
    NOP();
    NOP();
    GIE = GIE_Value;	// restaura el valor de GIE

    //retorna el dato leido
    *punte= ((unsigned int)((NVMDATH << 8) | NVMDATL));
  
   punte++;
   flash_dir--; //pasa siguiente Byte
  
    NVMADRL = (flash_dir & 0x00FF);
    NVMADRH = ((flash_dir & 0xFF00) >> 8);
     
    NVMCON1bits.NVMREGS = 0;    
    NVMCON1bits.RD = 1;      // Inicia la lectura
    NOP();
    NOP();
    GIE = GIE_Value;	// restaura el valor de GIE

    //retorna el dato leido
    *punte= ((unsigned int)((NVMDATH << 8) | NVMDATL));
    
    return (leido);       
 
}

void FLASH_Write_Long(unsigned int flash_dir, unsigned int *Buf, unsigned long data_flash)
{
    char *punte;//puntero tipo char

 // captura la direccion inicial multiplo de 32 donde se encuenra la direccion dada
    unsigned int dir_ini = (unsigned int)(flash_dir & ((END_FLASH-1) ^ (FLASH_BLOCKSIZE -1)));
    //captura la posicion del dato a guardar dentro de la fila
    unsigned char offset = (unsigned char)(flash_dir & (FLASH_BLOCKSIZE -1))+3;
    unsigned char i;

    punte=&data_flash;
    
   
 
     //Lee la flash toda la fila y lo guarda en el buffer
    for (i=0; i<FLASH_BLOCKSIZE ; i++)
    {
        Buf[i] = FLASH_Read((dir_ini+i));
    }

        // escribe en el buffer el nuevo dato
   
    Buf[offset] = *punte;
    punte++;
    offset--;
    
    Buf[offset] = *punte;
    punte++;
    offset--;
    Buf[offset] = *punte;
    punte++;
    offset--;
    Buf[offset] = *punte;
    
    //Guarda la info
    FLASH_WriteBlock(dir_ini, Buf);
}

unsigned long FLASH_Read_Long(unsigned int flash_dir)
{
  char *punte;//puntero tipo char
  unsigned int data;
  unsigned long leido;

  unsigned char GIE_Value = GIE;   // captura estado actual del habilitador de interrupcion

   punte=&leido;
   flash_dir+=3; //apunta a la parte alta

  
    GIE = 0;     // Disable interrupts
    NVMADRL = (flash_dir & 0x00FF);
    NVMADRH = ((flash_dir & 0xFF00) >> 8);
     
    NVMCON1bits.NVMREGS = 0;    
    NVMCON1bits.RD = 1;      // Inicia la lectura
    NOP();
    NOP();
    GIE = GIE_Value;	// restaura el valor de GIE

    //retorna el dato leido
    *punte= ((unsigned int)((NVMDATH << 8) | NVMDATL));
  
   punte++;
   flash_dir--; //pasa siguiente Byte
  
    NVMADRL = (flash_dir & 0x00FF);
    NVMADRH = ((flash_dir & 0xFF00) >> 8);
     
    NVMCON1bits.NVMREGS = 0;    
    NVMCON1bits.RD = 1;      // Inicia la lectura
    NOP();
    NOP();
    GIE = GIE_Value;	// restaura el valor de GIE

    //retorna el dato leido
    *punte= ((unsigned int)((NVMDATH << 8) | NVMDATL));
    
   punte++;
   flash_dir--; //pasa siguiente Byte
  
    NVMADRL = (flash_dir & 0x00FF);
    NVMADRH = ((flash_dir & 0xFF00) >> 8);
     
    NVMCON1bits.NVMREGS = 0;    
    NVMCON1bits.RD = 1;      // Inicia la lectura
    NOP();
    NOP();
   
    //retorna el dato leido
    *punte= ((unsigned int)((NVMDATH << 8) | NVMDATL));
    
   punte++;
   flash_dir--; //pasa siguiente Byte
  
    NVMADRL = (flash_dir & 0x00FF);
    NVMADRH = ((flash_dir & 0xFF00) >> 8);
     
    NVMCON1bits.NVMREGS = 0;    
    NVMCON1bits.RD = 1;      // Inicia la lectura
    NOP();
    NOP();
    GIE = GIE_Value;	// restaura el valor de GIE

    //retorna el dato leido
    *punte= ((unsigned int)((NVMDATH << 8) | NVMDATL));
    
    return (leido);       
 
}

void FLASH_Write_Float(unsigned int flash_dir, unsigned int *Buf, float data_flash)
{
    char *punte;//puntero tipo char

 // captura la direccion inicial multiplo de 32 donde se encuenra la direccion dada
    unsigned int dir_ini = (unsigned int)(flash_dir & ((END_FLASH-1) ^ (FLASH_BLOCKSIZE -1)));
    //captura la posicion del dato a guardar dentro de la fila
    unsigned char offset = (unsigned char)(flash_dir & (FLASH_BLOCKSIZE -1))+3;
    unsigned char i;

    punte=&data_flash;
    
   
 
     //Lee la flash toda la fila y lo guarda en el buffer
    for (i=0; i<FLASH_BLOCKSIZE ; i++)
    {
        Buf[i] = FLASH_Read((dir_ini+i));
    }

        // escribe en el buffer el nuevo dato
   
    Buf[offset] = *punte;
    punte++;
    offset--;
    Buf[offset] = *punte;
    punte++;
    offset--;
    Buf[offset] = *punte;
    punte++;
    offset--;
    Buf[offset] = *punte;
    
    //Guarda la info
    FLASH_WriteBlock(dir_ini, Buf);
}

float FLASH_Read_Float(unsigned int flash_dir)
{
  char *punte;//puntero tipo char
  unsigned int data;
  float leido;

  unsigned char GIE_Value = GIE;   // captura estado actual del habilitador de interrupcion

   punte=&leido;
   flash_dir+=3; //apunta a la parte alta

  
    GIE = 0;     // Disable interrupts
    NVMADRL = (flash_dir & 0x00FF);
    NVMADRH = ((flash_dir & 0xFF00) >> 8);
     
    NVMCON1bits.NVMREGS = 0;    
    NVMCON1bits.RD = 1;      // Inicia la lectura
    NOP();
    NOP();
   
    //retorna el dato leido
    *punte= ((unsigned int)((NVMDATH << 8) | NVMDATL));
  
   punte++;
   flash_dir--; //pasa siguiente Byte
  
    NVMADRL = (flash_dir & 0x00FF);
    NVMADRH = ((flash_dir & 0xFF00) >> 8);
     
    NVMCON1bits.NVMREGS = 0;    
    NVMCON1bits.RD = 1;      // Inicia la lectura
    NOP();
    NOP();
   
    //retorna el dato leido
    *punte= ((unsigned int)((NVMDATH << 8) | NVMDATL));
    
   punte++;
   flash_dir--; //pasa siguiente Byte
  
    NVMADRL = (flash_dir & 0x00FF);
    NVMADRH = ((flash_dir & 0xFF00) >> 8);
     
    NVMCON1bits.NVMREGS = 0;    
    NVMCON1bits.RD = 1;      // Inicia la lectura
    NOP();
    NOP();
   
    //retorna el dato leido
    *punte= ((unsigned int)((NVMDATH << 8) | NVMDATL));
    
   punte++;
   flash_dir--; //pasa siguiente Byte
  
    NVMADRL = (flash_dir & 0x00FF);
    NVMADRH = ((flash_dir & 0xFF00) >> 8);
     
    NVMCON1bits.NVMREGS = 0;    
    NVMCON1bits.RD = 1;      // Inicia la lectura
    NOP();
    NOP();
    GIE = GIE_Value;	// restaura el valor de GIE

    //retorna el dato leido
    *punte= ((unsigned int)((NVMDATH << 8) | NVMDATL));
    
    return (leido);       
 
}


void FLASH_Write_Texto(unsigned int flash_dir, unsigned int *Buf,char *data_flash)
{
       
    //captura la direccion inicial multiplo de 32 donde se encuenra la direccion dada
    unsigned int dir_ini = (unsigned int)(flash_dir & ((END_FLASH-1) ^ (FLASH_BLOCKSIZE -1)));
    //captura la posicion del dato a guardar dentro de la fila
    unsigned char offset = (unsigned char)(flash_dir & (FLASH_BLOCKSIZE -1));
    unsigned char i;
    
    
   
     //Lee la flash toda la fila y lo guarda en el buffer
    for (i=0; i<FLASH_BLOCKSIZE ; i++)
    {
        Buf[i] = FLASH_Read((dir_ini+i));
    }

        // escribe en el buffer el nuevo dato
   
// HASTA QUE ECUENTE EL FINAL DE CADENA ESCRIBE
    while(*data_flash)
   {
    Buf[offset] = *data_flash;
    data_flash++;
    offset++;     
    }
    Buf[offset] = 0;// agrega final de la cadena caracter null
     
   
    //Guarda la info
    FLASH_WriteBlock(dir_ini, Buf);
    

}


void FLASH_Read_Texto(unsigned int flash_dir, char *data_flash)
{
   unsigned int dato;
  unsigned int data;
  
  unsigned char GIE_Value = GIE;   // captura estado actual del habilitador de interrupcion

   do
    {
   GIE_Value = GIE;
    GIE = 0;     // Disable interrupts
    NVMADRL = (flash_dir & 0x00FF);
    NVMADRH = ((flash_dir & 0xFF00) >> 8);
     
    NVMCON1bits.NVMREGS = 0;    
    NVMCON1bits.RD = 1;      // Inicia la lectura
    NOP();
    NOP();
    GIE = GIE_Value;	// restaura el valor de GIE
 
    //retorna el dato leido
    dato= ((unsigned int)((NVMDATH << 8) | NVMDATL));
    
    *data_flash=dato;    
   data_flash++;
   flash_dir++; //pasa siguiente Byte

   }while (dato!=0); 
     
   
    GIE = GIE_Value;	// restaura el valor de GIE

   
}
