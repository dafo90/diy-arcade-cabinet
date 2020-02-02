#include <IoAbstraction.h>
#include <Bounce2.h>
#include <jled.h>
#include <EEPROM.h>

// power button is directly connected to MoBo
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

// pc communication
#define psuPowerPin 9

// leds timing in millis
#define fadeTime 1500
#define breatheTime 2000

// interval time in millis for switches
#define powerButtonInterval 100
#define lightingButtonInterval 100
#define psuPowerInterval 5

Bounce powerButton = Bounce();
JLed powerButtonLed = JLed(powerButtonLedPin);

Bounce lightingButton = Bounce();
JLed lightingButtonLed = JLed(lightingButtonLedPin);

Bounce psuPower = Bounce();

volatile boolean powerButtonLedOn = false;
volatile boolean lightingButtonLedOn = false;

bool isPcPoweredOn()
{
    return !psuPower.read();
}

void turnOnPowerButtonLed()
{
    if (!powerButtonLedOn)
    {
        powerButtonLed.Repeat(1).FadeOn(fadeTime);
        powerButtonLedOn = true;
    }
    else
    {
        powerButtonLed.Forever().On();
    }
}

void turnOffPowerButtonLed()
{
    if (powerButtonLedOn)
    {
        powerButtonLed.Repeat(1).FadeOff(fadeTime);
        powerButtonLedOn = false;
    }
    else
    {
        powerButtonLed.Forever().Off();
    }
}

void turnOnLightingButtonLed()
{
    if (!lightingButtonLedOn)
    {
        lightingButtonLed.Repeat(1).FadeOn(fadeTime);
        lightingButtonLedOn = true;
    }
    else
    {
        lightingButtonLed.Forever().On();
    }
}

void turnOffLightingButtonLed()
{
    if (lightingButtonLedOn)
    {
        lightingButtonLed.Repeat(1).FadeOff(fadeTime);
        lightingButtonLedOn = false;
    }
    else
    {
        lightingButtonLed.Forever().Off();
    }
}

void powerManagementTask()
{
    bool psuUpdateStatus = psuPower.update();
    powerButtonLed.Update();
    lightingButtonLed.Update();
    unsigned short eepromLightingStatus = 0;
    if (psuUpdateStatus && psuPower.fell())
    {
        // pc starting up
        turnOnPowerButtonLed();
        turnOnLightingButtonLed();
        eepromLightingStatus = EEPROM.read(lightingStatusAddr); // read the lighting value (byte) from EEPROM
        digitalWrite(lightingPin, eepromLightingStatus);
    }
    else if (psuUpdateStatus && psuPower.rose())
    {
        // pc shutting down
        eepromLightingStatus = digitalRead(lightingPin);
        EEPROM.update(lightingStatusAddr, eepromLightingStatus); // store the lighting value (byte) to EEPROM
        digitalWrite(lightingPin, HIGH);                         // turn off lighting
        turnOffPowerButtonLed();
        turnOffLightingButtonLed();
    }
}

void powerButtonTask()
{
    powerButtonLed.Update();
    if (powerButton.update())
    {
        if (powerButton.rose())
        {
            // power button released
            pinMode(powerPin, INPUT);
            if (isPcPoweredOn())
            {
                turnOnPowerButtonLed();
            }
            else
            {
                turnOffPowerButtonLed();
            }
        }
        else if (powerButton.fell())
        {
            // power button pressed when PC is on
            powerButtonLedOn = true;
            powerButtonLed.Forever().Breathe(breatheTime);
            digitalWrite(powerPin, LOW);
            pinMode(powerPin, OUTPUT);
            digitalWrite(powerPin, LOW);
        }
    }
}

void toggleOutputPinState(unsigned short pinNumber)
{
    digitalWrite(pinNumber, !digitalRead(pinNumber));
}

void lightingButtonTask()
{
    lightingButtonLed.Update();
    if (!isPcPoweredOn())
    {
        return;
    }
    if (lightingButton.update())
    {
        if (lightingButton.rose())
        {
            // lighting button released when PC is on
            toggleOutputPinState(lightingPin);
            lightingButtonLed.Forever().On();
            lightingButtonLedOn = true;
        }
        else if (lightingButton.fell())
        {
            // lighting button pressed when PC is on
            lightingButtonLed.Forever().Breathe(breatheTime);
            lightingButtonLedOn = true;
        }
    }
}

void setup()
{
    // set power button pin
    pinMode(powerButtonPin, INPUT_PULLUP);
    digitalWrite(powerPin, LOW); // ensure that this pin is configured as input without pullup
    pinMode(powerPin, INPUT);    // it is not a real input, but is configured as input to have a floating wire...
    digitalWrite(powerPin, LOW);
    powerButtonLed.Forever().Off();
    powerButton.attach(powerButtonPin);
    powerButton.interval(powerButtonInterval);

    // set lighting button pin
    pinMode(lightingButtonPin, INPUT_PULLUP);
    pinMode(lightingPin, OUTPUT);
    lightingButtonLed.Forever().Off();
    lightingButton.attach(lightingButtonPin);
    lightingButton.interval(lightingButtonInterval);

    // set pc communication pin
    pinMode(psuPowerPin, INPUT_PULLUP);

    psuPower.attach(psuPowerPin);
    psuPower.interval(psuPowerInterval);

    // set the common pin for the button leds to ground
    pinMode(commonButtonLedPin, OUTPUT);
    digitalWrite(commonButtonLedPin, LOW);

    taskManager.scheduleFixedRate(5, lightingButtonTask);
    taskManager.scheduleFixedRate(5, powerButtonTask);
    taskManager.scheduleFixedRate(5, powerManagementTask);
}

void loop()
{
    taskManager.runLoop();
}