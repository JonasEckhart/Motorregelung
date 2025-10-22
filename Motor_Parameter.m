clear;

tf('s');

%% Parameter des zu regelden Motors
Phaseses = 3; % Anzahl der Phasen
PolePairs = 2; % Anzahl der Polpaare
ResistancePerPhase = 2*1.15; % Ohm
L_d = 2*0.36e-3; % H SCHAETZWERT!!!
L_q = L_d; % H
Verlust_im_Motor = 4.12e-6;
Massentraegheit = 0.57e-6;

Power = 0.2; % in Prozent

NoLoadSpeed = 8900; % RPM
RatedSpeed = 7100; % RPM
Leerlaufstrom = 0.5; % A
Uebersetzung = 76/1; % 

wirkungsgrad = 0.95;

max_current = 2; % A
Supply_Voltage = 24; % V

max_mag_per_flux_linkage = Supply_Voltage / (2*pi*NoLoadSpeed/60);

Soll_M = 1.5;

%% Zusände der Channels
Ch1_on   = [1 0 0 0 0 1];
Ch1N_on  = [0 0 1 1 0 0];
Ch2_on   = [0 0 0 1 1 0];
Ch2N_on  = [1 1 0 0 0 0];
Ch3_on   = [0 1 1 0 0 0];
Ch3N_on  = [0 0 0 0 1 1];

Ch1_off  = [1 0 0 0 0 1];
Ch1N_off = [0 0 0 0 0 0];
Ch2_off  = [0 0 0 1 1 0];
Ch2N_off = [0 0 0 0 0 0];
Ch3_off  = [0 1 1 0 0 0];
Ch3N_off = [0 0 0 0 0 0];

%% Zustände der Gatetreiber
state1_on  = [1 0 0 0 0 1];
state2_on  = [0 0 1 0 0 1];
state3_on  = [0 1 1 0 0 0];
state4_on  = [0 1 0 0 1 0];
state5_on  = [0 0 0 1 1 0];
state6_on  = [1 0 0 1 0 0];

state1_off = [0 1 0 0 1 0];
state2_off = [0 0 0 1 1 0];
state3_off = [1 0 0 1 0 0];
state4_off = [1 0 0 0 0 1];
state5_off = [0 0 1 0 0 1];
state6_off = [0 1 1 0 0 0];


%% Motor als PT2
B = 3.7e-6; % Nms
L = L_d; % H
K_e = 0.01995; % V/rad/s
J = 0.51e-6; % Nms^2
R = ResistancePerPhase; % Ohm

K = 1/K_e;
T = sqrt(L*J/(K_e^2));
D = R/2 * sqrt(J/(L*K_e^2));

%% Auslegung Regler

%K_p = 1/K * 76;
%T_I = 2 * D * T;
%T_D = T^2/T_I;

T_t = (J*K_e)/(R*B+K_e^2);
K_p = (R*B+K_e^2)/(K_e);
T_I = (L*B+R*J)/(R*B+K_e^2);
T_D = (L*J)/(T_I*(R*B+K_e^2));

% 
% SimOut = sim('Motor_Regelung.slx');
% 
% ScopeData = SimOut.get('logsout').getElement('ScopeData7');
% 
% BusData = ScopeData.Values;
% t = BusData.Time;              % Zeitvektor
% y1 = BusData.Data(:,1);        % Erstes Signal im Bus
% y2 = BusData.Data(:,2);        % Zweites Signal
% y3 = BusData.Data(:,3);  
% 
% figure;
% plot(t, y1, 'r', 'LineWidth', 1.2); hold on;
% plot(t, y2, 'g', 'LineWidth', 1.2);
% plot(t, y3, 'b', 'LineWidth', 1.2);
% hold off;
% 
% xlabel('Time (s)');
% ylabel('Drehmoment');
% title('Drehmoment Soll, Ist, Diff');
% legend({'Soll','Ist','Diff'}, 'Location','best');
% grid on;
% 
% set(gcf, "Color", 'white');
% set(gca, 'Color', 'white');
% 
% print(gcf, 'scopeOutput.png', '-dpng');
