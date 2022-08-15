function motorDriver(valveID, steps)
    %Assign
    pin = AssignIDtoPin(valveID);
    pin2 = 27;
    disp(pin);
    %Config
    duty = 0.5;
    frequency = 400;
    set = setMotorProperties(pin,pin2,duty,frequency);
    %Delay between each step
    delay = 0.000001;
    %Driver
    driveMtr(pin,steps,delay,set);
end

function driveMtr(pin, steps, delay,pi)
    %Output signal to stepper n times to increment motor
    for i = 0: steps
        writeDigitalPin(pi,pin,1);
        pause(delay);
    end

end

function prop = setMotorProperties(pin1,pin2, dutyC, freq)
    %Raspberry Pi Object
    pi = raspi();

    configurePin(pi,pin2,'DigitalOutput');
    configurePin(pi,pin1,'PWM');
    
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