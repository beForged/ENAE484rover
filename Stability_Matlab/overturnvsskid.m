%Overturning vs Skidding
%By: Braden Rothwell
clear; close all;


SSF = [0.5:0.5:2]; %static stability factor (d/2h)
theta = [0:1:40]; %degrees
mu = [0.25:0.25:1];

v = 4.16667; %m/s
g = 1.62; %m/s^2

SSFcurrent = 2/(2*0.73)
mucurrent = [0.3,0.6];


%Banked Overturning

for i=1:length(SSF)
    for j=1:length(theta)
          r1(i,j) = (((v^2)/g)*((1-(SSF(i)*tand(theta(j))))/(tand(theta(j))+SSF(i))));
          r1current(j) = ((v^2)/g)*(((1/SSFcurrent)-tand(theta(j)))/(((1/SSFcurrent)*tand(theta(j)))+1));
    end
end

%Skidding
for i=1:length(mu)
    for j = 1:length(theta)
        r2(i,j) = ((v^2)/g)*((1-(mu(i)*tand(theta(j))))/(mu(i)+tand(theta(j))));
    end
end
for i=1:length(mucurrent)
    for j = 1:length(theta)
        r2current(i,j) = ((v^2)/g)*((1-(mucurrent(i)*tand(theta(j))))/(mucurrent(i)+tand(theta(j))));
    end
end

figure(1);
hold on;
plot(theta,r1(1,:),'c');
plot(theta,r1(2,:),'g');
plot(theta,r1(3,:),'y');
plot(theta,r1(4,:),'k');
plot(theta,r1current,'r--');
xline(30,'b--');
legend(['SSF = ' num2str(SSF(1))],['SSF = ' num2str(SSF(2))],...
    ['SSF = ' num2str(SSF(3))],['SSF = ' num2str(SSF(4))],...
    ['Current SSF = ' num2str(SSFcurrent)]);
title({['Overturn Turn Radius as a Function of SSF and Slope Angle'];...
    ['V = ' num2str(v) ' m/s']});
xlabel('\theta (Degrees)');
ylabel('Turn Radius (m)');
grid on;
hold off;

figure(2);
hold on;
plot(theta,r2(1,:),'k');
plot(theta,r2(2,:),'c');
plot(theta,r2(3,:),'g');
plot(theta,r2(4,:),'y');
plot(theta,r2current(1,:),'r--');
plot(theta,r2current(2,:),'r--');
xline(30,'b--');
legend(['\mu = ' num2str(mu(1))],['\mu = ' num2str(mu(2))],...
    ['\mu = ' num2str(mu(3))],['\mu = ' num2str(mu(4))],...
    ['\mu_C_u_r_r_e_n_t = ' num2str(mucurrent(1)) ' - ' num2str(mucurrent(2))]);
title({['Skid Turn Radius as a Function of Coefficient of Friction and Slope Angle'];...
    ['V = ' num2str(v) ' m/s']});
xlabel('\theta (Degrees)');
ylabel('Turn Radius (m)');
grid on;
hold off;

clear;

SSF = [0.5:0.5:2]; %static stability factor (d/2h)
r = [0:1:1000]; %m
g = 1.62; %m/s^2
SSFcurrent = 2/(2*0.616727);

for i = 1:length(SSF)
    for j = 1:length(r)
        V(i,j) = sqrt(SSF(i)*r(j)*g);
    end
end
Vcurrent = sqrt(SSFcurrent*r*g);
rmincurrent = (4.17^2)/(SSFcurrent*g);

figure(3);
hold on;
plot(r,V(1,:),'c');
plot(r,V(2,:),'g');
plot(r,V(3,:),'y');
plot(r,V(4,:),'k');
plot(r,Vcurrent,'r--');
yline(4.17,'k--');
plot(rmincurrent,4.17,'ro');
legend(['SSF = ' num2str(SSF(1))],['SSF = ' num2str(SSF(2))],...
    ['SSF = ' num2str(SSF(3))],['SSF = ' num2str(SSF(4))],...
    ['Current SSF = ' num2str(SSFcurrent)],['V = 4.17 m/s']);
xlabel('Turn Radius (m)');
ylabel('Velocity (m/s)');
ylim([0 6]);
title('Velocity as a Function of Turn Radius and Static Stability Factor');
grid on;
hold off;

figure(4);
hold on;
plot(V(1,:),r,'c');
plot(V(2,:),r,'g');
plot(V(3,:),r,'y');
plot(V(4,:),r,'k');
plot(Vcurrent,r,'r--');
xline(4.17,'k--');
plot(4.17,rmincurrent,'ro');
legend(['SSF = ' num2str(SSF(1))],['SSF = ' num2str(SSF(2))],...
    ['SSF = ' num2str(SSF(3))],['SSF = ' num2str(SSF(4))],...
    ['Current SSF = ' num2str(SSFcurrent)],['V = 4.17 m/s']);
ylabel('Minimum Turn Radius (m)');
xlabel('Velocity (m/s)');
xlim([0 6]);
title('Minimum Turn Radius as a Function of Velocity and Static Stability Factor');
grid on;
hold off;