#!/usr/bin/env python

import RPi.GPIO as GPIO
from gpiozero import CPUTemperature
import time

#constants
delayBetweenReadings = 5
startFanOver = 50

#initialize pins
fanPin = 18
minSpin = 10

#initialize GPIO settings
def init():
    GPIO.setmode(GPIO.BCM)

    #initialize fan (OUT)
    GPIO.setup(fanPin, GPIO.OUT)
    GPIO.setwarnings(False)

# main
if __name__ == "__main__":
    #initialize GPIO settings
    init()

    fan = GPIO.PWM(fanPin, 100)
    fan.start(0)

    cpu = CPUTemperature()
    oldtemp = cpu.temperature
    while True:
        temp = cpu.temperature
        if abs(temp - oldtemp) < 1.5:
            #same temperature, do nothing
            time.sleep(delayBetweenReadings)
            continue
        oldtemp = temp
        if temp > startFanOver:
            speed = ((temp - 45) * 4) + minSpin
            if speed > 100:
                speed = 100
            fan.ChangeDutyCycle(speed)
        else:
            #temperature is below the minimum value, turn off fan
            fan.ChangeDutyCycle(0)
        time.sleep(delayBetweenReadings)
    fan.stop()
    GPIO.cleanup()