 // velocidad de comunicación

#define BAUDIOS 115200  // define la Velocidad deseada la Comunicación

void  SoftWareUart_Init();
void Software_UART_Write(unsigned char Data);
void Software_UART_Write_Text(char* Text);
void Software_UART_Write_Text_Const(const char* Text);
unsigned char Software_UART_Read ();
void Software_UART_Read_Text(char* Buffer, char StopChar,unsigned int tama);