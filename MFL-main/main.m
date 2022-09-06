while 1
    %Valve No
    no_of_valves = 1;

    dataPointsFLOW = [];
    dataPointsPRESSURE = [];

    %Iterate through all ValveIDs to get data from all valves
    for k = 1:no_of_valves
        %Get data
        ValveData = data(k);
        %Append new data to vectors
        dataPointsFLOW(k) = ValveData(1);
        dataPointsPRESSURE(k) = ValveData(2);
    end

    disp("Most Recent Flow : " + dataPointsFLOW);
    disp("Most Recent Pressure : " + dataPointsPRESSURE);
    
    if dataPointsFLOW == 0 && dataPointsPRESSURE == 0
        disp("DATA CONFLICT - RESTARTING");
        continue;
    end
    

    %Calibration function / Valve Order Assignment
    %For each value lets assign a value and create an instruction set
    instructionSet = [];

    for i = 1:no_of_valves
        %Get Assignment
        point = ValveAssignment(dataPointsFLOW(i),dataPointsPRESSURE(i));
        %Add to instruction set
        instructionSet(i) = i;
        instructionSet(i + 1) = point;
    end

    %Instruction Set Parser -> Valve Firmware
    IS_Parser(instructionSet);

end
