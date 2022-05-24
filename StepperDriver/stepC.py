#!/usr/bin/env python

import RPi.GPIO as GPIO
import time as time

# setup
GPIO.setmode(GPIO.BCM)
GPIO.setwarnings(False)
GPIO.setup(17,GPIO.OUT)

while True:

        # initialization
        GPIO.output(17,GPIO.HIGH)
        time.sleep(1)
        GPIO.output(17,GPIO.LOW)
        time.sleep(1)

GPIO.cleanup()


