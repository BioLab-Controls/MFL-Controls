function motorDriver(valveID, steps)
    %Assign
%     pin = AssignIDtoPin(valveID);
    pin1 = 17;
    pin2 = 27;
    disp(pin1);
    %Config
    duty = 0.5;
    frequency = 400;
    %set = setMotorProperties(pin1,pin2,duty,frequency);
    %Delay between each step
    delay = 0.000001;
    %Driver
    %driveMtr(pin1,steps,delay,set,frequency,duty);
end

function driveMtr(pin, steps,delay,pi,frequency,duty)
    %Output signal to stepper n times to increment motor
%     for i = 0: steps
%         writeDigitalPin(pi,pin,1);
%         pause(delay);
%     end
    writeDigitalPin(pi,27,0);

    writePWMFrequency(pi,pin,frequency);
    writePWMDutyCycle(pi,pin,duty);
end

function prop = setMotorProperties(pin1,pin2, dutyC, freq)
    %Raspberry Pi Object
    pi = raspi();

    %Step and direction pins
    configurePin(pi,pin2,'DigitalOutput');
    configurePin(pi,pin1,'PWM');
    
    %Stop pin
    configurePin(pi,0,'DigitalOutput');
    
    writePWMDutyCycle(pi, pin1, dutyC);
    writePWMFrequency(pi, pin1, freq);
    prop = pi;
end

function pinR = AssignIDtoPin(valveID)
    %Pin assignment
    %1 - 13
    %2 - 14
    %etc
    valves_Pins = [13,14,15,16,17,18,19,20]; % pins
    pinR = valves_Pins(valveID);
end

function stopMovement(pi)
    stopPin = 0;
    writeDigitalPin(pi,stopPin,0);
end