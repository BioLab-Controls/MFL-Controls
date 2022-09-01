#!/usr/bin/env python

import RPi.GPIO as GPIO
import time as time
import piplates.DAQC2plate as DAQC

# setup
GPIO.setmode(GPIO.BCM)
GPIO.setwarnings(False)
GPIO.setup(17,GPIO.OUT)
GPIO.setup(18,GPIO.OUT)
GPIO.setup(27,GPIO.OUT)
GPIO.setup(22,GPIO.OUT)   



steps = [[1,1,0,0],[0,1,1,0],[0,0,1,1],[1,0,0,1]]
pins = [0,1,2,3]

def repeat():
        while True:
                for x in range(4):
                        for y in range(4):
                                if steps[x][y] == 1:
                                        #GPIO.output(0,pins[y]PIO.HIGH)
                                        DAQC.setDOUTbit(0,pins[y])
                                else:
                                        #GPIO.output(0,pins[y]PIO.LOW)
                                        DAQC.setDOUTbit(0,pins[y])

repeat()
GPIO.cleanup()


