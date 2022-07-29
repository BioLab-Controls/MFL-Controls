clc
clear
close all

%% Initial Encoder Position
% Read the encoders value at the start, store as array

valves = [13,14,15,16,17,18,19,20]; % pins
valvePos = [45,60,70,180,90,20,30,270]; % angle
flowData = [120, 100, 80];

%% Set Valves
% Start valves in fully open position

calibrationMFL();

%% Open Instruction Set
% Read the csv carrying data for flow

tableLookup();

%% Compare Flow With Lookup Table



flow = startAngle;

for row = 1:1:height(table)
    if flowData(1,1) == table(row,2)
    
        setPos = table(row,1);

    end
end

angularAdjustment();


