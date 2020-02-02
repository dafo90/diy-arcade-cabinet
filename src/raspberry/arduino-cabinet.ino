#include <Bounce2.h>
#include <jled.h>
#include <EEPROM.h>

// time (in millis) to hold down the power button befor shutting down raspberry
#define powerButtonDelay 3000
// delay time between raspberry kill the script and it is really powered off
#define poweroffPsuDelay 20000

#define delayTime 5

// power button
#define powerButtonPin 3
#define powerPin 8

// lighting button
#define lightingButtonPin 2
#define lightingPin 7

// eeprom address where the last lighting status is stored
#define lightingStatusAddr 0

/*
 * On most Arduino boards (those with the ATmega168 or ATmega328P),
 * this function works on pins 3, 5, 6, 9, 10, and 11.
 * On the Arduino Mega, it works on pins 2 - 13 and 44 - 46.
 * Older Arduino boards with an ATmega8 only support analogWrite() on pins 9, 10, and 11.
 * The Arduino DUE supports analogWrite() on pins 2 through 13, plus pins DAC0 and DAC1.
 * Unlike the PWM pins, DAC0 and DAC1 are Digital to Analog converters,
 * and act as true analog outputs.
 */
#define powerButtonLedPin 6
#define lightingButtonLedPin 5
#define commonButtonLedPin 4

// raspberry communication
#define raspberryRunningScriptPin 10
#define shutdownRaspberryPin 9

// leds timing in millis
#define fadeTime 1500
#define breatheTime 2000

// interval time in millis for switches
#define powerButtonInterval 100
#define lightingButtonInterval 100
#define raspberryRunningScriptInterval 50

#define ALL_OFF 0
#define STARTINGUP_RASPBERRY 1
#define RASPBERRY_RUN 2
#define RASPBERRY_SHUTTING_DOWN 3

#define LED_OFF 0
#define LED_ON 1
#define LED_BREATHE 2

unsigned short state = ALL_OFF;
unsigned short powerButtonLedState = LED_OFF;
unsigned short lightingButtonLedState = LED_OFF;

Bounce powerButton = Bounce();
JLed powerButtonLed = JLed(powerButtonLedPin);

Bounce lightingButton = Bounce();
JLed lightingButtonLed = JLed(lightingButtonLedPin);

Bounce raspberryRunningScript = Bounce();

unsigned long powerButtonStartPressing = 0;
unsigned long raspberryRunningScriptStartStopping = 0;

/*************************************************************
  UTILS
*************************************************************/
void breatheButtonLed(JLed &led, unsigned short &ledState)
{
    if (ledState != LED_BREATHE)
    {
        led.Forever().Breathe(breatheTime);
        ledState = LED_BREATHE;
    }
}

void turnOnButtonLed(JLed &led, unsigned short &ledState)
{
    if (ledState != LED_ON)
    {
        led.Forever().On();
        ledState = LED_ON;
    }
}

void turnOffButtonLed(JLed &led, unsigned short &ledState)
{
    if (ledState != LED_OFF)
    {
        led.Forever().Off();
        ledState = LED_OFF;
    }
}

bool isPsuOn()
{
    return !digitalRead(powerPin);
}

void turnOffAllOutput()
{
    powerButtonStartPressing = 0;
    raspberryRunningScriptStartStopping = 0;
    digitalWrite(powerPin, HIGH);
    digitalWrite(lightingPin, HIGH);
    digitalWrite(shutdownRaspberryPin, HIGH);
}

boolean delayAndCheckState(unsigned short stateToCheck)
{
    refreshButtonState_Refresher();
    buttonLed_Refresher();
    if (state != stateToCheck)
    {
        return false;
    }
    delay(delayTime);
    return true;
}

void toggleOutputPinState(unsigned short pinNumber)
{
    digitalWrite(pinNumber, !digitalRead(pinNumber));
}

/*************************************************************
  STATES REFRESHERS
*************************************************************/
void refreshButtonState_Refresher()
{
    powerButton.update();
    lightingButton.update();
    raspberryRunningScript.update();
}

void buttonLed_Refresher()
{
    powerButtonLed.Update();
    lightingButtonLed.Update();
    if (raspberryRunningScript.read())
    {
        // Raspberry is up and running
        if (!lightingButton.read())
        {
            breatheButtonLed(lightingButtonLed, lightingButtonLedState);
        }
        else
        {
            turnOnButtonLed(lightingButtonLed, lightingButtonLedState);
        }
    }
    else
    {
        // Raspberry is poweredoff
        turnOffButtonLed(lightingButtonLed, lightingButtonLedState);
    }
    if (!powerButton.read() || (isPsuOn() && !raspberryRunningScript.read()) || powerButtonStartPressing > 0 || raspberryRunningScriptStartStopping > 0)
    {
        breatheButtonLed(powerButtonLed, powerButtonLedState);
    }
    else
    {
        if (raspberryRunningScript.read())
        {
            turnOnButtonLed(powerButtonLed, powerButtonLedState);
        }
        else
        {
            turnOffButtonLed(powerButtonLed, powerButtonLedState);
        }
    }
}

/*************************************************************
  TASKS
*************************************************************/
void allOff_Task()
{
    if (state != ALL_OFF)
    {
        return;
    }
    turnOffAllOutput();
    while (!powerButton.read())
    {
        if (!delayAndCheckState(ALL_OFF))
        {
            return;
        }
    }
    while (powerButton.read())
    {
        if (!delayAndCheckState(ALL_OFF))
        {
            return;
        }
    }
    while (!powerButton.read())
    {
        if (!delayAndCheckState(ALL_OFF))
        {
            return;
        }
    }
    //digitalWrite(LED_BUILTIN, HIGH);
    // Now the user has released the button
    digitalWrite(powerPin, LOW);
    digitalWrite(shutdownRaspberryPin, HIGH);
    state = STARTINGUP_RASPBERRY;
}

void startingupRaspberry_Task()
{
    if (state != STARTINGUP_RASPBERRY)
    {
        return;
    }
    while (!raspberryRunningScript.read())
    {
        if (!delayAndCheckState(STARTINGUP_RASPBERRY))
        {
            return;
        }
    }
    // Now the raspberry script is up and running
    digitalWrite(shutdownRaspberryPin, HIGH);
    unsigned short eepromLightingStatus = EEPROM.read(lightingStatusAddr); // read the lighting value (byte) from EEPROM
    digitalWrite(lightingPin, eepromLightingStatus);
    state = RASPBERRY_RUN;
}

void raspberryUpAndRunning_Task()
{
    if (state != RASPBERRY_RUN)
    {
        return;
    }
    while (!powerButton.read())
    {
        if (!delayAndCheckState(RASPBERRY_RUN))
        {
            return;
        }
    }
    powerButtonStartPressing = 0;
    while ((powerButtonStartPressing == 0 || (millis() - powerButtonStartPressing) < powerButtonDelay) && raspberryRunningScript.read())
    {
        refreshButtonState_Refresher();
        buttonLed_Refresher();
        if (lightingButton.rose())
        {
            toggleOutputPinState(lightingPin);
        }
        if (!powerButton.read() && powerButtonStartPressing == 0)
        {
            powerButtonStartPressing = millis();
        }
        else if (powerButton.read())
        {
            powerButtonStartPressing = 0;
        }
        if (!delayAndCheckState(RASPBERRY_RUN))
        {
            return;
        }
    }
    powerButtonStartPressing = 0;
    if (raspberryRunningScript.read())
    {
        // Shutdown by button
        digitalWrite(shutdownRaspberryPin, LOW);
        while (raspberryRunningScript.read())
        {
            if (!delayAndCheckState(RASPBERRY_RUN))
            {
                return;
            }
        }
    }
    digitalWrite(shutdownRaspberryPin, HIGH);
    unsigned short eepromLightingStatus = digitalRead(lightingPin);
    EEPROM.update(lightingStatusAddr, eepromLightingStatus); // store the lighting value (byte) to EEPROM
    digitalWrite(lightingPin, HIGH);
    raspberryRunningScriptStartStopping = millis();
    state = RASPBERRY_SHUTTING_DOWN;
}

void raspberryShuttingdown_Task()
{
    if (state != RASPBERRY_SHUTTING_DOWN)
    {
        return;
    }
    while ((millis() - raspberryRunningScriptStartStopping) < poweroffPsuDelay && !raspberryRunningScript.read())
    {
        if (!delayAndCheckState(RASPBERRY_SHUTTING_DOWN))
        {
            return;
        }
    }
    raspberryRunningScriptStartStopping = 0;
    if (raspberryRunningScript.read())
    {
        // It is a restart!
        digitalWrite(shutdownRaspberryPin, HIGH);
        state = STARTINGUP_RASPBERRY;
        return;
    }
    else
    {
        turnOffAllOutput();
        state = ALL_OFF;
    }
}

void setup()
{

    // set power button pin
    pinMode(powerButtonPin, INPUT_PULLUP);
    pinMode(powerPin, OUTPUT);
    powerButtonLed.Forever().Off();
    powerButton.attach(powerButtonPin);
    powerButton.interval(powerButtonInterval);

    // set lighting button pin
    pinMode(lightingButtonPin, INPUT_PULLUP);
    pinMode(lightingPin, OUTPUT);
    lightingButtonLed.Forever().Off();
    lightingButton.attach(lightingButtonPin);
    lightingButton.interval(lightingButtonInterval);

    // set raspberry cominication pin
    pinMode(raspberryRunningScriptPin, INPUT);
    pinMode(shutdownRaspberryPin, OUTPUT);

    raspberryRunningScript.attach(raspberryRunningScriptPin);
    raspberryRunningScript.interval(raspberryRunningScriptInterval);

    turnOffAllOutput();

    // set the common pin for the button leds to ground
    pinMode(commonButtonLedPin, OUTPUT);
    digitalWrite(commonButtonLedPin, LOW);

    refreshButtonState_Refresher();
    buttonLed_Refresher();
}

void loop()
{
    refreshButtonState_Refresher();
    buttonLed_Refresher();
    allOff_Task();
    startingupRaspberry_Task();
    raspberryUpAndRunning_Task();
    raspberryShuttingdown_Task();
}