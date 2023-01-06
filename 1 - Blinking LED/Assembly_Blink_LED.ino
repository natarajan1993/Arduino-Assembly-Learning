// Code is external to the C file
extern "C"
{
  void start();
  void led(byte);
}

// setup() is native arduino library -> Runs once on start
void setup()
{
  start();
}

// loop() is native arduino library
// loop checks the button pin each time,
// and will send serial if it is pressed
void loop()
{
  // call the led() function defined in the S file
  led(1);
  // delay() is built-in to arduino API
  delay(200);
  led(0);
  delay(200);
}
