% Sub routine to allow the valve firmware process to keep track of the
% current position of the requested motor

function res = motor_encoder(task,valveID,newSteps)
    setData();
    res = encoderReturnPosition(task,valveID,newSteps);
end

function setData()
    global CALIBRATE;
    CALIBRATE = 0;
    global INCREMENT;
    INCREMENT = 1;
    %Valve Task - Index 0,
    %Valve current step - Index 1
    global valveMap;
    valveMap = [];
    
end

function pos = encoderReturnPosition(task,valveID,newSteps)
    global CALIBRATE;
    global INCREMENT;
    
    if task == CALIBRATE
        %calibrate to ZERO
        calibrateToZero(valveID);
        pos = 0;
        return;
    end 

    if task == INCREMENT
        %increment
        stepUpdate = modifyValveIDStepData(valveID,newSteps);
        %Return
        pos = stepUpdate;
    end

    if task ~= CALIBRATE || task ~= INCREMENT
       error("Invalid task for motor encoder");
       pos = 0;
    end

end

function vSteps = retrieveValveIDStepData(valveID)
    global valveMap;
    %Search for valve ID and get data in next index
    valveIndex = find(valveMap == valveID,1);
    %Return data
    vSteps = valveMap(valveIndex + 1);
end

function upD = modifyValveIDStepData(valveID, steps)
    global valveMap;
    currentStep = retrieveValveIDStepData(valveID);
    %Get index
    valveIndex = find(valveMap == valveID,1);
    %Modify
    valveMap(valveIndex + 1) = (currentStep + steps);
    %Return 
    upD = (currentStep + steps);
end

function calibrateToZero(valveID)
    global valveMap;
    %Get index
    valveIndex = find(valveMap == valveID,1);
    %Set to 0
    valveMap(valveIndex + 1) = 0;
end