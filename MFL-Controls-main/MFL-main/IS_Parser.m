%Parser for instruction set

function IS_Parser(instruction_set)
    %Main
   parserLoop(instruction_set);
end

function outputToStepper(valveID,valvePosition)
    %Get steps to destination form HLVP converter
    stepsTo = HLVP_converter(valveID,valvePosition);
    %Output steps to driver
    disp("Valve : " + valveID);
    if ~isnan(stepsTo)
        disp("Steps Output : " + stepsTo);
        motorDriver(valveID, stepsTo);
    end
end

function parserLoop(instruction_set)
    %Length of instruction set
    lengthSet = length(instruction_set);
    instructions = lengthSet / 2;
    
    %for each instruction in set
    iter = 1;
    while iter < lengthSet
        %Get valveID
        valveID = instruction_set(iter);
        
        %Get valve position
        valvePosition = instruction_set(iter + 1);
        
        %Output to Stepper Driver
        outputToStepper(valveID,valvePosition);
        
        iter = iter + 2;
    end
    
end