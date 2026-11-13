// Software I2C connections
extern sbit Soft_I2C_Sda ;
extern sbit Soft_I2C_Scl;
extern Soft_I2C_Sda_Direction;
extern Soft_I2C_Scl_Direction ;


// PINES USADOS  EN EL PCF8574
// P7, P6, P5, P4 = Data, P3=Backlight (BL), P2=E, P1=RW, P0=RS
#define LCD_ADDR 0x4E     //direccion del i2c   A2A1A0 1
//#define LCD_ADDR 0x7E      //direccion del i2c  0b0100 A2A1A0 0

//ARDUINO
//#define LCD_ADDR 0x27      //direccion del i2c  0b0100 A2A1A0 1
//#define LCD_ADDR 0x3F      //direccion del i2c  0b0100 A2A1A0 0

#define LCD_BL 0x08
#define LCD_EN 0x04
#define LCD_RS 0x01

void I2C_LCD_Cmd(char out_char);
void I2C_LCD_init() ;
void I2C_LCD_Chr(char row, char column, char out_char);
void I2C_LCD_Chr_Cp(char out_char);
void I2C_LCD_Out(char row, char col, char *text);
void I2C_LCD_Out_Cp(char *text);
