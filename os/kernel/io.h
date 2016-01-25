#ifndef IO_H
#define IO_H

extern char IO_START;

#define IO_PORT(offset) (*(&IO_START + (offset)))
#define IO_UART_TX IO_PORT(0)
#define IO_UART_TX_READY IO_PORT(1)

#define IO_QUIT_EMU IO_PORT(255)

// Low-level debug message function. Should not be used
// in critical paths because it will block the kernel until
// the write is complete.
void io_uart_print(const char *data);

#endif
