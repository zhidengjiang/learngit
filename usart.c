#include <htc.h>
#include <stdio.h>
#include "usart.h"
#include "SYSCFG.h"

void 
putch(unsigned char byte) 
{
	/* output one byte */
	while(!TXEF)	/* set when register is empty */
		continue;
	TXREG = byte;
}
unsigned char 
getch() {
	/* retrieve one byte */
	while(!RXNEF)	/* set when register is not empty */
		continue;
	return RCREG;	
}
unsigned char
getche(void)
{
	unsigned char c;
	putch(c = getch());
	return c;
}

