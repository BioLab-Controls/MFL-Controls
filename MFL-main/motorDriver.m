function motorDriver(valveID, steps)
    %Assign
    pin = AssignIDtoPin(valveID);
    pin1 = 17;
    pin2 = 27;
    disp(pin1);
    %Config
    duty = 0.5;
    frequency = 400;
%     set = setMotorProperties(pin1,pin2,duty,frequency);
    %Delay between each step
    delay = 0.000001;
    %Driver
    t = stepsToTime(abs(steps))
    disp(t)
%     driveMtr(pin1,steps,delay,set,frequency,duty,t,0);
end

function driveMtr(pin, steps,delay,pi,frequency,duty,time,tally)
    
    tStart = tic;

    writeDigitalPin(pi,27,0);
    writeDigitalPin(pi,22,1);
    writePWMFrequency(pi,pin,frequency);
    writePWMDutyCycle(pi,pin,duty);

    tEnd = toc(tStart);

    dur = tally + tEnd;

    if dur < time
        disp(dur)
        driveMtr(pin, steps,delay,pi,frequency,duty,time,dur)
    else
        writeDigitalPin(pi,22,0);
    end

end

function prop = setMotorProperties(pin1,pin2, dutyC, freq)
    %Raspberry Pi Object
    pi = raspi();

    %Step and direction pins
    configurePin(pi,pin2,'DigitalOutput');
    configurePin(pi,pin1,'PWM');
    
    %Stop pin
    configurePin(pi,22,'DigitalOutput');
    
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
    stopPin = 22;
    writeDigitalPin(pi,stopPin,0);
end

function result = stepsToTime(steps)
    stepsPerSec = 400;
    temp1 = steps * 1;
    val = 1 / temp1;
    result = val;
end