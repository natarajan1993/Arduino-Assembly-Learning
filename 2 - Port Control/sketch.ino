//-----------------------------
// AVR Assembly via Arduino IDE
//-----------------------------
// # 8 bit ports
// PORTB - D13 to D8
// PORTD - D0 to D7
// PORTC - A0 to A5

// Each port has 3 I/O registers
//    - Data Direction
//      - Determines if port is input or output
//      - Send 0xFF for output (to DDRD)
//      - Send 0x00 for input (to DDRD)
//      - DDRD, DDRC, DDRA are in-built
//    - Port Register
//    - Port input pins register

extern "C"
{
  void start();
}
//----------------------------------------------------
void setup()
{
  start();
}
//----------------------------------------------------
void loop()
{}

