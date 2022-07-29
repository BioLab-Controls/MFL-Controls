clc
clear
close all

pi = raspi();
configurePin(pi, 12, 'PWM');
configurePin(pi, 13, 'DigitalOutput')

writeDigitalPin(pi, 13, 1) % clockwise
writeDigitalPin(pi, 13, 0) % counter-clockwise

writePWMDutyCycle(pi, 12, 0.5);
writePWMFrequency(pi, 12, 1000);