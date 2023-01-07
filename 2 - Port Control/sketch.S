; This should turn on all LEDs at once and then turn them off one by one
; Loops indefinitely
#define __SFR_OFFSET 0x00
#include "avr/io.h"
;------------------------
.global start
;------------------------
start:
    LDI   R18, 0
    LDI   R19, 0xFF
    OUT   DDRD, R19   ;set port D as o/p
    ;------------------------------------------------
agn:SBI   PORTD, 0    ;set pin PD0 to PD7 (D0 --> D7)
    RCALL customDelay ;delay 0.25s
    SBI   PORTD, 1    ; Set Pin 1 in PORTD. SBI is a single bit instruction
    RCALL customDelay
    SBI   PORTD, 2
    RCALL customDelay
    SBI   PORTD, 3
    RCALL customDelay
    SBI   PORTD, 4
    RCALL customDelay
    SBI   PORTD, 5
    RCALL customDelay
    SBI   PORTD, 6
    RCALL customDelay
    SBI   PORTD, 7
    RCALL customDelay
    OUT   PORTD, R18  ;clear port D
    RCALL customDelay
    RJMP  agn         ;repeat indefinitely
;----------------------------------------------------------------
; Calculating the delay
; Outer loop count * Mid loop Count * Inner loop count * number of cycles in inner loop * (1/16000000) 
customDelay:              ;nested loop subroutine (max delay 3.11s)
    LDI   R20, 255    ;outer loop counter 
l1: LDI   R21, 255    ;mid loop counter
l2: LDI   R22, 20     ;inner loop counter to give 0.25s delay
l3: DEC   R22         ;decrement inner loop
    BRNE  l3          ;loop if not zero
    DEC   R21         ;decrement mid loop
    BRNE  l2          ;loop if not zero
    DEC   R20         ;decrement outer loop
    BRNE  l1          ;loop if not zero
    RET               ;return to caller
;----------------------------------------------------------------

