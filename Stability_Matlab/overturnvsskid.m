%Overturning vs Skidding
%By: Braden Rothwell
clear; close all;


SSF = [0.5:0.5:2]; %static stability factor (d/2h)
theta = [0:1:50]; %degrees
mu = [0.25:0.25:1];

v = 4.16667; %m/s
g = 1.62; %m/s^2

SSFcurrent = 2.326131/(2*0.74765)
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
xline(25,'b--');
legend(['SSF = ' num2str(SSF(1))],['SSF = ' num2str(SSF(2))],...
    ['SSF = ' num2str(SSF(3))],['SSF = ' num2str(SSF(4))],...
    ['Current SSF = ' num2str(SSFcurrent)],['\theta = 25']);
title({['Turn Radius Required to Overturn Rover as a Function of SSF and Slope Angle'];...
    ['V = ' num2str(v) ' m/s']});
xlabel('\theta (Degrees)');
ylabel('Turn Radius (m)');
set(gca,'FontSize',25);
grid on;
hold off;

figure(2);
hold on;
plot(theta,r2(1,:),'k');
plot(theta,r2(2,:),'c');
plot(theta,r2(3,:),'g');
plot(theta,r2(4,:),'y');
plot(theta,r2current(1,:),'r--');
xline(25,'b--');
plot(theta,r2current(2,:),'r--');
legend(['\mu = ' num2str(mu(1))],['\mu = ' num2str(mu(2))],...
    ['\mu = ' num2str(mu(3))],['\mu = ' num2str(mu(4))],...
    ['\mu_C_u_r_r_e_n_t = ' num2str(mucurrent(1)) ' - ' num2str(mucurrent(2))],['\theta = 25']);
title({['Turn Radius Required to Induce Slidding as a Function of Coefficient of Friction and Slope Angle'];...
    ['V = ' num2str(v) ' m/s']});
xlabel('\theta (Degrees)');
ylabel('Turn Radius (m)');
set(gca,'FontSize',24);
grid on;
hold off;

clear;

SSF = [0.5:0.5:2]; %static stability factor (d/2h)
r = [0:1:1000]; %m
g = 1.62; %m/s^2
SSFcurrent = 2.326131/(2*0.74765)

for i = 1:length(SSF)
    for j = 1:length(r)
        V(i,j) = sqrt(SSF(i)*r(j)*g);
    end
end
Vcurrent = sqrt(SSFcurrent*r*g);
rmincurrent = (4.17^2)/(SSFcurrent*g);

% figure(3);
% hold on;
% plot(r,V(1,:),'c');
% plot(r,V(2,:),'g');
% plot(r,V(3,:),'y');
% plot(r,V(4,:),'k');
% plot(r,Vcurrent,'r--');
% yline(4.17,'k--');
% plot(rmincurrent,4.17,'ro');
% legend(['SSF = ' num2str(SSF(1))],['SSF = ' num2str(SSF(2))],...
%     ['SSF = ' num2str(SSF(3))],['SSF = ' num2str(SSF(4))],...
%     ['Current SSF = ' num2str(SSFcurrent)],['V = 4.17 m/s']);
% xlabel('Turn Radius (m)');
% ylabel('Velocity (m/s)');
% ylim([0 6]);
% title('Velocity as a Function of Turn Radius and Static Stability Factor');
% grid on;
% hold off;

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
title({['Turn Radius Required to Overturn Rover as a Function of Velocity and Static Stability Factor'];['\theta = 0']});
set(gca,'FontSize',25);
grid on;
hold off;

%%
clear all;

theta = [0:1:50];
mu = tand(theta);

figure(5);
hold on;
plot(mu,theta,'r');
yline(25,'b--');
xline(0.3,'k--');
xline(0.6,'k--');
legend(['\theta(\mu)'],['\theta = 25'],['\mu = 0.3 - 0.6']);
xlabel('Coefficient of Friction (\mu)');
ylabel('Slope Angle (Degrees)');
title({['Slope Angle as a Function of Coefficient of Friction'];['V = 0 km/hr']});
set(gca,'FontSize',25);
grid on;
hold off;

%%
clear;

SSF = [0.5:0.5:2]; %static stability factor (d/2h)
T = [0:1:500]; %Wheel Torque
r = 0.5; %m
W = 1000; %kg
SSFcurrent = 1.2532

for i = 1:length(SSF)
    for j = 1:length(T)
        theta(i,j) = acosd((2*T(j))/(r*W*SSF(i)));
    end
end
for j = 1:length(T)
    thetaCurrent(j) = acosd((2*T(j))/(r*W*SSFcurrent));
end


figure(6);
hold on;
plot(theta(1,:),T,'c');
plot(theta(2,:),T,'g');
plot(theta(3,:),T,'y');
plot(theta(4,:),T,'k');
plot(thetaCurrent,T,'r--');
yline(300,'k--');
xline(25,'b--');
grid on;
legend(['SSF = ' num2str(SSF(1))],['SSF = ' num2str(SSF(2))],...
    ['SSF = ' num2str(SSF(3))],['SSF = ' num2str(SSF(4))],...
    ['Current SSF = ' num2str(SSFcurrent)],['\tau = 300 N-m'],['\theta = 25'],'fontsize',18);
xlabel('Slope Angle \theta (Degrees)');
ylabel('Torque \tau (N/m)');
title('Torque (\tau) Required to Overturn Rover on Slope (\theta) for a range of SSF');
set(gca,'FontSize',25)
hold off;
