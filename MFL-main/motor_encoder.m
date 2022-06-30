% Sub routine to allow the valve firmware process to keep track of the
% current position of the motor

global stepUpdate;

global CALIBRATE;
CALIBRATE = 0;

global INCREMENT;
INCREMENT = 1;

function pos = encoderReturnPosition(task, newSteps)
    if task == CALIBRATE
        %calibrate to ZERO
        calibrateToZero();
    end 
    
    if task == INCREMENT
        %increment
        stepUpdate = stepUpdate + newSteps;
        %Return
        pos = stepUpdate;
    end
    
    if task ~= CALIBRATE || task ~= INCREMENT
       error("Invalid task for motor encoder");
    end
    
end


function calibrateToZero()
    stepUpdate = 0;
end