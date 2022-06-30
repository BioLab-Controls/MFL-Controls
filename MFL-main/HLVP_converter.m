% Converts valve position in range from 0(OPEN) and 255 (CLOSED) to motor
%increment steps from current position to desired step position

function stepsToDestination = HLVP_converter(valvePosition)
    %Get current step position as position from calibrated ZERO
    currentStepPosition = encoderReturnPosition(INCREMENT,0);
    %Get

    %Return number of steps to destination position
    
end