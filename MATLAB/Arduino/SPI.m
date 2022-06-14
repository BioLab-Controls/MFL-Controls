SPI_PIN_NO = 0;
dirPin = 2;
stepPin = 3;
stepsPerRevolution = 200;
OUTPUT = 1;
HIGH = 1;
LOW = 0;
delay = 0.001;

target = arduino('COM4', 'Uno', 'Libraries', 'SPI');

function main()
    while True:
        %Get Data
        speed = getData(SPI_PIN_NO);
        %Push
        StepperSpin(1,speed);
    end
end

function getData(port)
    d_pot = device(target, 'SPIChipSelectPin', 'SPI_PIN_NO');
    readCmd = bin2dec('0000 0011');
    dataIn = [readCmd address zeros(1,2)];
    out = writeRead(target,dataIn);
    return out
end

function StepperSpin(direction,steps)
    if direction == 0:%ANTICLOCKWISE
        %Set direction Pin HIGH = CLOCKWISE LOW = ANTICLOCKWISE
        writeDigitalPin(target,dirPin,LOW);
        %Spin
        for i = 0:steps
            writeDigitalPin(target,stepPin,HIGH);
            pause(delay)
            writeDigitalPin(target,stepPin,LOW);
            pause(delay)
        end

    end
    if direction == 1: %CLOCKWISE
        %Set direction Pin HIGH = CLOCKWISE | LOW = ANTICLOCKWISE
        writeDigitalPin(target,dirPin,HIGH);
          %Spin
          for i = 0:steps
            writeDigitalPin(target,stepPin,HIGH);
            pause(delay)
            writeDigitalPin(target,stepPin,LOW);
            pause(delay)
        end

    end

end
