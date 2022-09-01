clc
clear
close all

stepCount = input('Step Count: \n');
freq = input('Frequency: \n');

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

%% RPI Setup
pi = raspi();
activePin = 12;
configurePin(pi,activePin,'DigitalOutput')

% Testing Timing
% for i = 1:1:length(instSet)
%     fprintf('%i\n',y(i));
%     pause(0.001);
% end

for i = 1:1:length(instSet)
    writeDigitalPin(pi,12,y(i))
    pause(0.001) % Timing replaces the arbitraty timing from wave setup
end

%{
Timing may be replaced with more accurate/more complicated code using:

c = clock;
time  = c(6); 

Compare starting time to time 0.001 seconds later.
Applies 1000 hz frequency to instruction set.

%}