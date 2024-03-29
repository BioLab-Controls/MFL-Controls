% Sub routine to allow the valve firmware process to keep track of the
% current position of the requested motor

function res = motor_encoder(task,valveID,newSteps)
    setData();
    res = encoderReturnPosition(task,valveID,newSteps);
    pushToStorage(valveID,res);
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
    valveID3 = 3;
    valveID4 = 4;
    valveID5 = 5;
    valveID6 = 6;
    taskVal1 = retrieveFromStorage(valveID1);
    taskVal2 = retrieveFromStorage(valveID2);
    taskVal3 = retrieveFromStorage(valveID3);
    taskVal4 = retrieveFromStorage(valveID4);
    taskVal5 = retrieveFromStorage(valveID5);
    taskVal6 = retrieveFromStorage(valveID6);
    global valveMap;
    valveMap = [];
    valveMap(1) = valveID1;
    valveMap(2) = taskVal1;
    valveMap(3) = valveID2;
    valveMap(4) = taskVal2;
    valveMap(5) = valveID3;
    valveMap(6) = taskVal3;
    valveMap(7) = valveID4;
    valveMap(8) = taskVal4;
    valveMap(9) = valveID5;
    valveMap(10) = taskVal5;
    valveMap(11) = valveID6;
    valveMap(12) = taskVal6;
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
        return;
    end

    if task ~= CALIBRATE || task ~= INCREMENT
       pos = 0;
       error("Invalid task for motor encoder");
       
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

function pushToStorage(valveID,value)
    assignment = ["1","MFL-1.txt","2","MFL-2.txt","3","MFL-3.txt","4","MFL-4.txt","5","MFL-5.txt","6","MFL-6.txt"];
    dir = "mfldir/";
    if ~exist("mfldir", 'dir')
       mkdir mfldir;
    end
    fileIndex = assignment(find(assignment == string(valveID)) + 1);
    formatSpec = '%3d';
    s = strcat(dir,fileIndex);
    fileID = fopen(strcat(dir,fileIndex),'wt');
    M = [value];
    writematrix(M,s);
    fclose(fileID);
end

function val = retrieveFromStorage(valveID)
    assignment = ["1","MFL-1.txt","2","MFL-2.txt","3","MFL-3.txt","4","MFL-4.txt","5","MFL-5.txt","6","MFL-6.txt"];
    dir = "mfldir/";
    if ~exist("mfldir", 'dir')
       mkdir mfldir;
    end
    fileIndex = assignment(find(assignment == string(valveID)) + 1);
    formatSpec = '%f\n';
    [fileID,msg] = fopen(strcat(dir,fileIndex),'r+');
    input = fscanf(fileID,formatSpec);
    fclose(fileID);
    if isempty(input)
        error("DATA READ CONFLICT - RUN PROGRAM AGAIN");
    else
        val = input;
    end
end