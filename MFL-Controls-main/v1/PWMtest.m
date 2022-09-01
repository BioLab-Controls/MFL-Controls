clear
clc
close all

t = linspace(0,3*pi);
x = square(t);

plot(t/pi,x,'.-',t/pi,sin(t))
grid on
