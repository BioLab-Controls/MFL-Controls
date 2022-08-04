%Valve No
no_of_valves = 6;

%Read Spreadsheet
fileName = 'mfldir/dataValue-1.csv';
spreadsheetData = readtable(fileName);

%Separate flow data and pressure
%FLOW | PRESSURE

%Flow
flow_data = spreadsheetData{:,1};
%Pressure
pressure_data = spreadsheetData{:,2};

%Parse to get most recent value


dataPointsFLOW = [];
dataPointsPRESSURE = [];
%Calibration function / Valve Order Assignment

%For each value lets assign a value and create an instruction set
instructionSet = [];

for i = 1:no_of_valves
    %Get Assignment
    point = ValveAssignment(dataPointsFLOW(i),dataPointsPRESSURE(i));
    %Add to instruction set
    instructionSet(i) = valveID;
    instructionSet(i + 1) = point;
end

%Instruction Set Parser -> Valve Firmware

task = 1;
valveID = 5;
increment_steps = 2;
x = 0;
valvePosition = 255;

test_instruction_set1 = [1,90,2,45,3,180,4,60];
test_instruction_set2 = [1,90];

%IS_Parser(instruction_set);
ValveAssignment(16, 2);
