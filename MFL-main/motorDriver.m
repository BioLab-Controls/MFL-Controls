function motorDriver(valveID, steps)
    %Assign
    pin = AssignIDtoPin(valveID);
    disp(pin);
    %Config
    duty = 0.5;
    frequency = 1000;
%     set = setMotorProperties(pin,duty,frequency);
    %Delay between each step
    delay = 0.000001;
    %Driver
%     driveMtr(pin,steps,delay,set);
end

function driveMtr(pin, steps, delay,pi)
    %Output signal to stepper n times to increment motor
    for i = 0: steps
        writeDigitalPin(pi,pin,1);
        pause(delay);
    end

end

function prop = setMotorProperties(pin, dutyC, freq)
    %Raspberry Pi Object
    pi = raspi();

    configurePin(pi,pin,'DigitalOutput');
    
    writePWMDutyCycle(pi, pin, dutyC);
    writePWMFrequency(pi, pin, freq);
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