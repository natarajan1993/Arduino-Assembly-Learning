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
  RCALL customDelay ; (relative) call a subroutine customDelay
  RET               ; Return to loop() function

ledOFF:             ; ledOFF subroutine
  CBI PORTB, 4      ; set D12 to low
  RCALL customDelay ; (relative) call a subroutine customDelay
  RET               ; Return to loop() function

.equ delayVal, 10000  ; initial count for inner loop

customDelay:
  LDI R20, 100      ; initial count for outer loop

outerLoop:
  ; We have to do this because arduino is 8-bit only -> This means we HAVE to store large values in 2 registers
  LDI R30, lo8(delayVal)  ; low byte of delayVal in R30
  LDI R31, hi8(delayVal)  ; high byte of delayVal in R31
innerLoop:
  SBIW R30, 1       ; subtract 1 from 16-bit value in R30, R31
  BRNE innerLoop    ; Branch if delayVal not equal to 0

  SUBI R20, 1       ; Subtract 1 from R20
  BRNE outerLoop    ; Branch if R20 value is not equal to 0