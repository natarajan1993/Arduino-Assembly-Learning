; Defines I/O space address
#define __SFR_OFFSET 0x00
 ; Allows access to ports
#include "avr/io.h"

.global start
.global led

start:
  SBI DDRB, 4       ; set pin PB5 (D12) as output
  RET               ; Return to setup()

; led() is called via loop()
led:
  CPI R24, 0x00     ; Compare (immediate) passed value in Register 24 with 0
  BREQ ledOFF       ; Branch if equal and branch to subroutine ledOFF
  SBI PORTB, 4      ; set pin D12 to high
  RET               ; Return to loop() function

ledOFF:             ; ledOFF subroutine
  CBI PORTB, 4      ; set D12 to low
  RET               ; Return to loop() function