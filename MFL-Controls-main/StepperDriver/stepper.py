import piplates.DAQC2plate as DAQC
import time

control_pins = [4,5,6,7]

halfstep_seq = [
  [1,0,0,0],
  [1,1,0,0],
  [0,1,0,0],
  [0,1,1,0],
  [0,0,1,0],
  [0,0,1,1],
  [0,0,0,1],
  [1,0,0,1]
]
for i in range(512):
  for halfstep in range(8):
    for pin in range(4):
      #GPIO.output(control_pins[pin], halfstep_seq[halfstep][pin])
      if(halfstep_seq[halfstep][pin] == 1):
        DAQC.setDOUTbit(0,control_pins[pin])
      if(halfstep_seq[halfstep][pin] == 0):
        DAQC.clrDOUTbit(0,control_pins[pin])

    time.sleep(0.001)

