clc
clear

pi = raspi()

configurePin(pi,17,'DigitalOutput');
configurePin(pi,27,'DigitalOutput');

writeDigitalPin(pi,27,0);

while 1
    writeDigitalPin(pi,17,1);
    pause(0.000001);
    
    writeDigitalPin(pi,17,0);
    pause(0.000001);
end

