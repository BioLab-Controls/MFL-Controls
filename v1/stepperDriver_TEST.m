clc
clear
close all

stepCount = 40;

%% Waveform Setup
%{
Creates a wave with frequency of the stepCount for arbitrary amount
of time. Instruction set replicates the wave with 0 for -1 to allow for
direct input to pin control.
%}
t = 0:stepCount*2*pi;
y = square(t,50);

y(y==-1) = 0;
instSet = [y];

%% Plot
figure
plot(t,y)

%% Timing
for i = 1:1:length(instSet)
    fprintf('%i\n',y(i));
    pause(0.001);
end

%% Accurate Timing
for j = 1:1:length(instSet)j
    
    
    fprintf('%i\n',y(i))
    
end

