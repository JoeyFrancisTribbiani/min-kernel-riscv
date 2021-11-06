#define UART0 0x10000000L
#define Reg(reg) ((volatile unsigned char *)(UART0 + reg))
#define WriteReg(reg, v) (*(Reg(reg)) = (v))
typedef unsigned long uint64;
#define UART_TX_BUF_SIZE 32
// char uart_tx_buf[UART_TX_BUF_SIZE];
uint64 uart_tx_w; // write next to uart_tx_buf[uart_tx_w % UART_TX_BUF_SIZE]
uint64 uart_tx_r;
#include "types.h"
#include "param.h"
void main();
void timerinit();

// entry.S needs one stack per CPU.
__attribute__((aligned(16))) char stack0[4096 * NCPU];

// a scratch area per CPU for machine-mode timer interrupts.
uint64 timer_scratch[NCPU][5];

// assembly code in kernelvec.S for machine-mode timer interrupt.
extern void timervec();

// entry.S jumps here in machine mode on stack0.
void start()
{
  // set M Previous Privilege mode to Supervisor, for mret.
  char uart_tx_buf[4] = {'f', 'u', 'c', 'k'};
  uart_tx_r = 0;
  while (1)
  {
    if (uart_tx_r == 4)
    {
      uart_tx_r = 0;
    }
    int c = uart_tx_buf[uart_tx_r];
    WriteReg(0, c);
    uart_tx_r += 1;
  }
}