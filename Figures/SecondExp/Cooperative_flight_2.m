close all
clear all
clc


load('glider1_states_6.mat')
load('glider2_states_6.mat')
format long

%% Plot altitude variation
figure1 = figure('Color',[1 1 1]);
plot(glider1_states(2502:181299-107500,1)-glider1_states(2502,1),glider1_states(2502:181299-107500,3),'r','LineWidth',1.5)
hold on
plot(glider2_states(735:179517-107500,1)-glider2_states(735,1),glider2_states(735:179517-107500,3),'b','LineWidth',2)
xlabel('Time, sec','FontSize',12)
ylabel('Altitude, m','FontSize',12)
% title('Gain in altitude')
leg1 = legend('Glider 1','Glider 2',2)
set(leg1,'FontSize',12,'EdgeColor',[1 1 1])
% axis([0 500 1000 3500])
set(gca,'FontSize',12)
grid on


% Create text in the plot
% Create textbox
annotation(figure1,'textbox',...
    [0.1385 0.133333333333334 0.322214285714286 0.0500000000000004],...
    'String',{'First thermal detected'},...
    'FontSize',12,...
    'FontName','Arial',...
    'FitBoxToText','off',...
    'EdgeColor',[1 1 1],...
    'BackgroundColor',[1 1 1]);

% Create arrow
annotation(figure1,'arrow',[0.196428571428571 0.2375],...
    [0.187095238095238 0.25952380952381]);

% Create arrow
annotation(figure1,'arrow',[0.471428571428571 0.380357142857143],...
    [0.269047619047619 0.226190476190476]);

% Create textbox
annotation(figure1,'textbox',...
    [0.483499999999999 0.256190476190477 0.350428571428572 0.0500000000000004],...
    'String',{'Second thermal detected'},...
    'FontSize',12,...
    'FontName','Arial',...
    'FitBoxToText','off',...
    'EdgeColor',[1 1 1],...
    'BackgroundColor',[1 1 1]);




%% Plot paths and thermal
figure2 = figure('Color',[1 1 1]);

% Plot thermals

% First thermal found
x03 = 15.112; y03 = 46.462;
sigma_x3 = 0.006;
sigma_y3 = 0.006;
A3 = 2802;
[X3,Y3] = meshgrid(x03-0.015:0.0001:x03+0.015, y03-0.015:0.0001:y03+0.015);
Z3 = A3*exp( - (((X3-x03).^2)./(2*sigma_x3^2) + ((Y3-y03).^2)./(2*sigma_y3^2)));
surf(X3,Y3,Z3,'FaceAlpha',0.3,'EdgeColor','none','FaceColor',[1 1 0]);
hold on

% Second thermal found
x02 = 15.129; y02 = 46.467;
sigma_x2 = 0.006;
sigma_y2 = 0.006;
A2 = 2730;
[X2,Y2] = meshgrid(x02-0.015:0.0001:x02+0.015, y02-0.015:0.0001:y02+0.015);
Z2 = A2*exp( - (((X2-x02).^2)./(2*sigma_x2^2) + ((Y2-y02).^2)./(2*sigma_y2^2)));
surf(X2,Y2,Z2,'FaceAlpha',0.3,'EdgeColor','none','FaceColor',[0.2 1 0]);



view(-170,44)


% Plot paths
plot3(glider1_states(2502+3000:181299-105000,39),glider1_states(2502+3000:181299-105000,38),glider1_states(2502+3000:181299-105000,3),'r','LineWidth',1.5)
plot3(glider2_states(735+12000:179517-105000,39),glider2_states(735+12000:179517-105000,38),glider2_states(735+12000:179517-105000,3),'b','LineWidth',1.5)


axis([15.08 15.15 46.43 46.5 0 2900])
a2 = gca;
set(a2,'FontSize',12)
xlabel('Longitude, deg','FontSize',12)
ylabel('Latitude, deg','FontSize',12)
zlabel('Altitude, m','FontSize',12)
% title('Paths in cooperative flight')
leg2 = legend('Thermal 1','Thermal 2','Glider 1','Glider 2',1);
set(leg2,'FontSize',12,'EdgeColor',[1 1 1])
% legend('boxoff')

% Plot starting points
plot3(glider1_states(2502+3000,39),glider1_states(2502+3000,38),glider1_states(2502+3000,3),'^r','MarkerSize',12)
plot3(glider2_states(735+12000,39),glider2_states(735+12000,38),glider2_states(735+12000,3),'<b','MarkerSize',12)



