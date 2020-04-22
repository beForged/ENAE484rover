clear; close all;
v = [0:0.5:5]; %m/s
theta = [0,25]; %degrees
g = 1.62; %m/s^2

y = 0.725; %m
h = 0.75; %m

for i = 1:length(v)
    for j = 1:length(theta)
        r(i,j) = ((v(i)^2)/g)*((((y/h)*cosd(theta(j)))-sind(theta(j)))^-1);
    end
end


figure(1)
hold on;
set(gca,'FontSize',20);
plot(v,r(:,1),'r');
plot(v,r(:,2),'b');
legend('\theta = 0',"\theta = 25");
xlabel("Velocity (m/s)");
ylabel("Turn Radius (m)");
title("Minimum Turn Radius As a Function of Rover Velocity and Slope Angle");
grid on;
hold off;
