% Converts valve position in range from 0(OPEN) and 255 (CLOSED) to motor
%increment steps from current position to desired step position

function stepsXToDestination = HLVP_converter(valveID,valvePosition)
    %Get
    steps = returnCurrentStep(valveID);
    %Map valve position to steps full cycle rotation
    map = mapValues(valvePosition);
    
    %Return number of steps to destination position
    sTD = stepsToDestination(steps, map);
    stepsXToDestination = sTD;
    
    %Update encoder position
    updateEncoderPosition(valveID,sTD);
end

function current = returnCurrentStep(valveID)
    INCREMENT = 1;
    %Get current step position as position from calibrated ZERO
    currentStepPosition = motor_encoder(INCREMENT,valveID,0);
    current = currentStepPosition;
end

function updateEncoderPosition(valveID,pos)
    INCREMENT = 1;
    motor_encoder(INCREMENT,valveID,pos);
end

function val = mapValues(valvePosition)
    %Map valve position to steps 180 rotation
    %0 -255
    %0 - 180
    mapped = interp1([0,255],[0,180],valvePosition);
    val = mapped;
end

function steps = stepsToDestination(currentPos, finalPos)
    %Get steps to destination by subtracting current position from
    %final position 
    steps = (finalPos - currentPos);
end