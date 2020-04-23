%Turn Radius As A Function of Rover Velocity

clear; close all;

h = 0.538; %Height of CG, m
c = 2; %Length of wheel base, m
y = c/2; %Horizontal location of CG from right wheel, m

g = 1.62; %Lunar gravity, m/s^2
v = [0:0.01:5]; %Velocity, m/s

%Flat Ground Turning
r_flat = ((v.^2)./g).*(h/y);

%Sloped Turning
theta = 25; %Slope angle, Deg

r_slope = ((v.^2)./g)*((((y/h)*cosd(theta))-sind(theta))^-1);

%Plots
figure(1);
hold on;
grid on;
plot(v,r_flat,'r');
plot(v,r_slope,'b');
xlabel('Velocity (m/s)');
ylabel('Turn Radius (m)');
title('Unmanned Turn Radius Vs. Velocity')
legend('\theta = 0 Deg' ,['\theta = ' num2str(theta) ' Deg']);
set(gca,'FontSize',25);
hold off;