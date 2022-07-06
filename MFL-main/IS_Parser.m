%Parser for instruction set

function IS_Parser(instruction_set)
   parserLoop(instruction_set);
end

function outputToStepper(valveID,valvePosition)
    %Get steps to destination form HLVP converter
    stepsTo = HLVP_converter(valvePosition);
    %Output steps to driver

end

function parserLoop(instruction_set)
    %Length of instruction set
    lengthSet = length(instruction_set);
    instructions = lengthSet / 2;
    %for each instruction in set
    for iter = 0: instruction_set: 2
        %Get valveID
        valveID = instruction_set(iter);
        %Get valve position
        valvePosition = instruction_set(iter + 1);
        outputToStepper(valveID,valvePosition);
    end
end