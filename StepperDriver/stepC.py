#!/usr/bin/env python

import RPi.GPIO as GPIO
import time as time

# setup
GPIO.setmode(GPIO.BCM)
GPIO.setwarnings(False)
GPIO.setup(17,GPIO.OUT)
GPIO.setup(18,GPIO.OUT)
GPIO.setup(27,GPIO.OUT)
GPIO.setup(22,GPIO.OUT)   

steps = [[1,1,0,0],[0,1,1,0],[0,0,1,1],[1,0,0,1]]
pins = [17,18,27,22]

for x in steps:
        for y in steps:
                if steps[x][y] == 1:
                        GPIO.output(pins[y],GPIO.HIGH)
                else:
                        GPIO.output(pins[y],GPIO.LOW)

GPIO.cleanup()


