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
    valveID1 = 1;
    valveID2 = 2;
    taskVal1 = retrieveFromStorage(valveID1);
    taskVal2 = retrieveFromStorage(valveID2);
    global valveMap;
    valveMap = [];
    valveMap(1) = valveID1;
    valveMap(2) = taskVal1;
    valveMap(3) = valveID2;
    valveMap(4) = taskVal2;
end

function pos = encoderReturnPosition(task,valveID,newSteps)
    global CALIBRATE;
    global INCREMENT;
    cpy = 0;
    if task == CALIBRATE
        %calibrate to ZERO
        calibrateToZero(valveID);
        pos = 0;
        cpy = 0;
        return;
    end 

    if task == INCREMENT
        %increment
        stepUpdate = modifyValveIDStepData(valveID,newSteps);
        %Return
        pos = stepUpdate;
        cpy = stepUpdate;
    end

    if task ~= CALIBRATE || task ~= INCREMENT
       error("Invalid task for motor encoder");
       pos = 0;
    end
    pushToStorage(valveID,value)
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

function pushToStorage(valveID,value)
    assignment = ["1","MFL-1.txt","2","MFL-2.txt"];
    mkdir mfldir;
    fileIndex = assignment(find(assignment == string(valveID)) + 1);
    fileID = fopen(fileIndex,'w');
    nbytes = fprintf(fileID,value);
    fclose(fileID);
end

function val = retrieveFromStorage(valveID)
    assignment = ["1","MFL-1.txt","2","MFL-2.txt"];
    mkdir mfldir;
    fileIndex = assignment(find(assignment == string(valveID)) + 1);
    formatSpec = '%f';
    fileID = fopen(fileIndex,'r+');
    input = fscanf(fileID,formatSpec);
    fclose(fileID);
    val = input;
end