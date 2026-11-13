

void usb_uart_write(char *trama_usb_tx)
{
	CDC_Transmit_FS(trama_usb_tx, strlen(trama_usb_tx));
}
