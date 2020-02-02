#!/usr/bin/env python

import RPi.GPIO as GPIO
import subprocess
import time

#constants
shutdownAfter = 0.05

#initialize pins
powerSignalPin = 3

#initialize GPIO settings
def init():
	GPIO.setmode(GPIO.BCM)

	#initialize power button (IN)
	GPIO.setup(powerSignalPin, GPIO.IN, pull_up_down=GPIO.PUD_UP)
	GPIO.setwarnings(False)

# main
if __name__ == "__main__":
	#initialize GPIO settings
	init()

	while GPIO.input(powerSignalPin):
		GPIO.wait_for_edge(powerSignalPin, GPIO.FALLING)
		time.sleep(shutdownAfter)

	subprocess.call(['shutdown', '-h', 'now'], shell=False)
	GPIO.cleanup()