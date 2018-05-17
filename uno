#include <Wire.h>
#include <Multiservo.h>
 
Multiservo servo;
 //
void setup(void)
{
  Serial.begin(9600);
  servo.attach(17);
  pinMode(7, INPUT);
  pinMode(8, INPUT);
  digitalWrite(7, HIGH);
  digitalWrite(8, HIGH);
  servo.write(90);
}
 
bool diraction = true; //false - left - (0) | true - right - (180) 
 
void loop(void)
{
  char cmd = Serial.read();
  Serial.print(digitalRead(7));
  Serial.println(digitalRead(8));
  if (cmd == (int)'1') {
   servo.write(0);
    diraction = true;
    Serial.print("right");
  }
  if (cmd == (int)'0') {
    servo.write(180);
    diraction = false;
    Serial.print("left");
  }
  if (digitalRead(7) == 0 && diraction == true) {
    servo.write(90);
  }
  if (digitalRead(8) == 0 && diraction == false) {
    servo.write(90);
  }
//  if (diraction == false) se{rvo.write(180);
//  else servo.write(0);
}
