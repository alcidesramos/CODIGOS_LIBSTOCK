

void I2C_CONFIG_master(unsigned long  i2c_velo);
void I2C_WAIT();
void I2C_STARTBIT();
void I2C_STOPBIT();
void I2C_REPEATSTARTBIT();
void I2C_ACKBIT();
void I2C_NOACKBIT();
char  I2C_ACK_READBIT();
char I2C_WRITE_BYTE(unsigned char dato_i2c);
unsigned char I2C_READ_BYTE(char ack_bit) ;