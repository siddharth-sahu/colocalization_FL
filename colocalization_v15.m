% Code for colocalization analysis, version 15 - by Siddharth Sourabh Sahu


%% Clean

clc;
clear;
close all;
fig=0;


%% Data input
% sample_name = 'T109\W0';
% sample_name = 'T109\W32';

% sample_name = 'T114\W0';
% sample_name = 'T114\W72';
% sample_name = 'T123\W0';
sample_name = 'T123\W108';
% sample_name = 'T126\W0';
% sample_name = 'T126\W24';
% sample_name = 'T151\W0';
% sample_name = 'T151\W48';
% sample_name = 'T153\W0';
% sample_name = 'T153\W60';
% sample_name = 'T154\W0';
% sample_name = 'T154\W24';
% sample_name = 'T168\W0';
% sample_name = 'T168\W60';
% sample_name = 'T178\W0';
% sample_name = 'T178\W40';
% sample_name = 'T197\W0';
% sample_name = 'T197\W16';
% sample_name = 'T208\W0';
% sample_name = 'T208\W32';

file_path = ['C:\Users\sahus\Google Drive\4 Data\202212-now\TREM_files\',sample_name];

%specify the corresponding data folder in the input
[num_VB,  VB_intsy, VB_x, VB_y, ...
    num_FITC,  FITC_intsy, FITC_x, FITC_y, ...
    num_RPE,  RPE_intsy, RPE_x, RPE_y, ...
    num_APC,  APC_intsy,  APC_x, APC_y] = data_import(file_path);

clearvars num_VB num_FITC num_RPE num_APC;

%% Select Tolerance

tol = 0.6;

%% Intersection & subtraction - 2 channels

[inter2_FITC_RPE_x, inter2_FITC_RPE_y, inter2_FITC_RPE_intsy, inter2_RPE_FITC_intsy, ...
    minus2_FITC_RPE_x, minus2_FITC_RPE_y, minus2_FITC_RPE_intsy, ...
    minus2_RPE_FITC_x, minus2_RPE_FITC_y, minus2_RPE_FITC_intsy] = intersection_FL(FITC_x, FITC_y, RPE_x, RPE_y, FITC_intsy, RPE_intsy, tol);

[inter2_FITC_APC_x, inter2_FITC_APC_y, inter2_FITC_APC_intsy, inter2_APC_FITC_intsy, ...
    minus2_FITC_APC_x, minus2_FITC_APC_y, minus2_FITC_APC_intsy, ...
    minus_APC_FITC_x, minus_APC_FITC_y, minus_APC_FITC_intsy] = intersection_FL(FITC_x, FITC_y, APC_x, APC_y, FITC_intsy, APC_intsy, tol);

[inter2_RPE_APC_x, inter2_RPE_APC_y, inter2_RPE_APC_intsy, inter2_APC_RPE_intsy, ...
    minus2_RPE_APC_x, minus2_RPE_APC_y, minus2_RPE_APC_intsy, ...
    minus2_APC_RPE_x, minus2_APC_RPE_y, minus2_APC_RPE_intsy] = intersection_FL(RPE_x, RPE_y, APC_x, APC_y, RPE_intsy, APC_intsy, tol);

%% sanity check: intersection & subtraction - 2 channels
% if the code worked properly, 
% all the numbers in a row should be the same according to set theory

disp([length(FITC_x), ...
    (length(inter2_FITC_RPE_x) + length(minus2_FITC_RPE_x)), ...
    length(FITC_y), ...
    (length(inter2_FITC_RPE_y) + length(minus2_FITC_RPE_y)),... 
    length(FITC_intsy),...
    (length(inter2_FITC_RPE_intsy) + length(minus2_FITC_RPE_intsy))]);

disp([length(RPE_x), ...
    (length(inter2_FITC_RPE_x) + length(minus2_RPE_FITC_x)), ...
    length(RPE_y), ...
    (length(inter2_FITC_RPE_y) + length(minus2_RPE_FITC_y)),... 
    length(RPE_intsy),...
    (length(inter2_RPE_FITC_intsy) + length(minus2_RPE_FITC_intsy))]);

disp([length(FITC_x), ...
    (length(inter2_FITC_APC_x) + length(minus2_FITC_APC_x)), ...
    length(FITC_y), ...
    (length(inter2_FITC_APC_y) + length(minus2_FITC_APC_y)),... 
    length(FITC_intsy),...
    (length(inter2_FITC_APC_intsy) + length(minus2_FITC_APC_intsy))]);

disp([length(APC_x), ...
    (length(inter2_FITC_APC_x) + length(minus_APC_FITC_x)), ...
    length(APC_y), ...
    (length(inter2_FITC_APC_y) + length(minus_APC_FITC_y)),... 
    length(APC_intsy),...
    (length(inter2_APC_FITC_intsy) + length(minus_APC_FITC_intsy))]);

disp([length(RPE_x), ...
    (length(inter2_RPE_APC_x) + length(minus2_RPE_APC_x)), ...
    length(RPE_y), ...
    (length(inter2_RPE_APC_y) + length(minus2_RPE_APC_y)),... 
    length(RPE_intsy),...
    (length(inter2_RPE_APC_intsy) + length(minus2_RPE_APC_intsy))]);

disp([length(APC_x), ...
    (length(inter2_RPE_APC_x) + length(minus2_APC_RPE_x)), ...
    length(APC_y), ...
    (length(inter2_RPE_APC_y) + length(minus2_APC_RPE_y)),... 
    length(APC_intsy),...
    (length(inter2_APC_RPE_intsy) + length(minus2_APC_RPE_intsy))]);

%% Intersection & subtraction - 3 channels

[inter3_FITC_RPE_APC_x, inter3_FITC_RPE_APC_y, inter3_FITC_RPE_APC_intsy, inter3_APC_FITC_RPE_intsy, ...
    minus3_FITC_RPE_APC_x, minus3_FITC_RPE_APC_y, minus3_FITC_RPE_APC_intsy, ...
    minus3_APC_FITC_RPE_x, minus3_APC_FITC_RPE_y, minus3_APC_FITC_RPE_intsy] = intersection_FL(inter2_FITC_RPE_x, inter2_FITC_RPE_y, APC_x, APC_y, inter2_FITC_RPE_intsy, APC_intsy, tol);

%% sanity check: intersection & subtraction - 3 channels
% if the code worked properly, 
% all the numbers in a row should be the same according to set theory

disp([length(inter2_FITC_RPE_x), ...
    (length(inter3_FITC_RPE_APC_x) + length(minus3_FITC_RPE_APC_x)), ...
    length(inter2_FITC_RPE_y), ...
    (length(inter3_FITC_RPE_APC_y) + length(minus3_FITC_RPE_APC_y)),... 
    length(inter2_FITC_RPE_intsy),...
    (length(inter3_FITC_RPE_APC_intsy) + length(minus3_FITC_RPE_APC_intsy))]);

disp([length(APC_x), ...
    (length(inter3_FITC_RPE_APC_x) + length(minus3_APC_FITC_RPE_x)), ...
    length(APC_y), ...
    (length(inter3_FITC_RPE_APC_y) + length(minus3_APC_FITC_RPE_y)),... 
    length(APC_intsy),...
    (length(inter3_APC_FITC_RPE_intsy) + length(minus3_APC_FITC_RPE_intsy))]);

%% Union - 2 channels
% union of coordinates in channels A and B

[union2_FITC_RPE_x, union2_FITC_RPE_y, union2_FITC_RPE_intsy, union2_RPE_FITC_intsy] = ...
  union_FL(inter2_FITC_RPE_x, inter2_FITC_RPE_y, minus2_FITC_RPE_x, minus2_FITC_RPE_y, minus2_RPE_FITC_x, minus2_RPE_FITC_y, ...
  inter2_FITC_RPE_intsy, inter2_RPE_FITC_intsy, minus2_FITC_RPE_intsy, minus2_RPE_FITC_intsy);  

[union2_FITC_APC_x, union2_FITC_APC_y, union2_FITC_APC_intsy, union2_APC_FITC_intsy] = ...
  union_FL(inter2_FITC_APC_x, inter2_FITC_APC_y, minus2_FITC_APC_x, minus2_FITC_APC_y, minus_APC_FITC_x, minus_APC_FITC_y, ...
  inter2_FITC_APC_intsy, inter2_APC_FITC_intsy, minus2_FITC_APC_intsy, minus_APC_FITC_intsy);  

[union2_RPE_APC_x, union2_RPE_APC_y, union2_RPE_APC_intsy, union2_APC_RPE_intsy] = ...
  union_FL(inter2_RPE_APC_x, inter2_RPE_APC_y, minus2_RPE_APC_x, minus2_RPE_APC_y, minus2_APC_RPE_x, minus2_APC_RPE_y, ...
  inter2_RPE_APC_intsy, inter2_APC_RPE_intsy, minus2_RPE_APC_intsy, minus2_APC_RPE_intsy);  

%% sanity check: union - 2 channels
disp([length(union2_FITC_RPE_x), ...
    (length(FITC_x) + length(RPE_x) - length(inter2_FITC_RPE_x)), ...
    length(union2_FITC_RPE_y), ...
    (length(FITC_y) + length(RPE_y) - length(inter2_FITC_RPE_y)), ...
    length(union2_FITC_RPE_intsy),...
    (length(FITC_intsy) + length(RPE_intsy) - length(inter2_FITC_RPE_intsy))]);


disp([length(union2_FITC_APC_x), ...
    (length(FITC_x) + length(APC_x) - length(inter2_FITC_APC_x)), ...
    length(union2_FITC_APC_y), ...
    (length(FITC_y) + length(APC_y) - length(inter2_FITC_APC_y)), ...
    length(union2_FITC_APC_intsy),...
    (length(FITC_intsy) + length(APC_intsy) - length(inter2_FITC_APC_intsy))]);

disp([length(union2_RPE_APC_x), ...
    (length(RPE_x) + length(APC_x) - length(inter2_RPE_APC_x)), ...
    length(union2_RPE_APC_y), ...
    (length(RPE_y) + length(APC_y) - length(inter2_RPE_APC_y)), ...
    length(union2_RPE_APC_intsy),...
    (length(RPE_intsy) + length(APC_intsy) - length(inter2_RPE_APC_intsy))]);

%% Union - 3 channels - only numbers

num_union_3_channels = length(FITC_x)+ length(RPE_x) + length(APC_x) ...
    - length(inter2_FITC_RPE_x) - length(inter2_FITC_APC_x) - length(inter2_RPE_APC_x) ...
    + length(inter3_FITC_RPE_APC_x);

%% Venn Diagrams

areas = [length(FITC_x) length(RPE_x) length(APC_x)];
intersections = [length(inter2_FITC_RPE_x) length(inter2_FITC_APC_x) length(inter2_RPE_APC_x) length(inter3_FITC_RPE_APC_x)];
% intersections = [0 0 0 0];
fig = fig+1;
figure(fig), axis equal, axis off;
h1 = venn(areas, intersections, 'FaceColor',{'r', 'g', 'b'},...
    'EdgeColor','black', 'ErrMinMode', 'ChowRodgers');
set(h1, 'FaceAlpha', 0.5);
ax = gca;
ax.Units = 'inches';
height = (ax.YLim(2)-ax.YLim(1))/30;
width = (ax.XLim(2)-ax.XLim(1))/30;
ax.OuterPosition = [0 0 width height];


%% correlation coefficients
corrcoef_APC_RPE = corrcoef(union2_APC_RPE_intsy, union2_RPE_APC_intsy); 
corrcoef_APC_RPE = corrcoef_APC_RPE(1, 2);

corrcoef_APC_FITC = corrcoef(union2_APC_FITC_intsy, union2_FITC_APC_intsy); 
corrcoef_APC_FITC = corrcoef_APC_FITC(1, 2);

corrcoef_RPE_FITC = corrcoef(union2_RPE_FITC_intsy, union2_FITC_RPE_intsy); 
corrcoef_RPE_FITC = corrcoef_RPE_FITC(1, 2);

%% Correlation CD73 - PD-L1

% union - includes those EVs where one channel has zero values
fig = fig+1;
figure(fig)
scatter(union2_APC_RPE_intsy/max(union2_APC_RPE_intsy), union2_RPE_APC_intsy/max(union2_RPE_APC_intsy), 20, 'filled');
grid on;
set(gca, 'fontsize',15);
xlabel('norm. CD73 intensity');
ylabel('norm. PD-L1 intensity');
xlim([0 1.1]);
ylim([0 1.1]);
set(gcf,'position',[50, 40, 560, 420]);
text(0.3, 1.05, ['corr coef = ', num2str(corrcoef_APC_RPE)],'FontSize',15);
ax = gca;
ax.FontSmoothing = 'on';

% % intersection - only non-zero values of both channels
% fig = fig+1;
% figure(fig)
% scatter (inter2_APC_RPE_intsy/max(inter2_APC_RPE_intsy), inter2_RPE_APC_intsy/max(inter2_RPE_APC_intsy), 20, 'filled');
% grid on;
% set(gca, 'fontsize',15);%, 'XScale', 'log', 'YScale', 'log');
% xlabel('norm. CD73 intensity');
% ylabel('norm. PD-L1 intensity');
% ax = gca;
% ax.FontSmoothing = 'on';

%% Correlation CD73 - EphA2

% union - includes those EVs where one channel has zero values
fig = fig+1;
figure(fig)
scatter(union2_APC_FITC_intsy/max(union2_APC_FITC_intsy), union2_FITC_APC_intsy/max(union2_FITC_APC_intsy), 20, 'filled');
grid on;
set(gca, 'fontsize',15);
xlabel('norm. CD73 intensity');
ylabel('norm. EphA2 intensity');
xlim([0 1.1]);
ylim([0 1.1]);
set(gcf,'position',[650, 40, 560, 420]);
text(0.3, 1.05, ['corr coef = ', num2str(corrcoef_APC_FITC)],'FontSize',15);
ax = gca;
ax.FontSmoothing = 'on';

% % intersection - only non-zero values of both channels
% fig = fig+1;
% figure(fig)
% scatter (inter2_APC_FITC_intsy/max(inter2_APC_FITC_intsy), inter2_FITC_APC_intsy/max(inter2_FITC_APC_intsy), 20, 'filled');
% grid on;
% set(gca, 'fontsize',15);%, 'XScale', 'log', 'YScale', 'log');
% xlabel('norm. CD73 intensity');
% ylabel('norm. EphA2 intensity');
% ax = gca;
% ax.FontSmoothing = 'on';

%% Correlation PD-L1 - EphA2


% union - includes those EVs where one channel has zero values
fig = fig+1;
figure(fig)
scatter(union2_RPE_FITC_intsy/max(union2_RPE_FITC_intsy), union2_FITC_RPE_intsy/max(union2_FITC_RPE_intsy), 20, 'filled');
grid on;
set(gca, 'fontsize',15);
xlabel('norm. PD-L1 intensity');
ylabel('norm. EphA2 intensity');
xlim([0 1.1]);
ylim([0 1.1]);
set(gcf,'position',[1250, 40, 560, 420]);
text(0.3, 1.05, ['corr coef = ', num2str(corrcoef_RPE_FITC)],'FontSize',15);
ax = gca;
ax.FontSmoothing = 'on';

% % intersection - only non-zero values of both channels
% fig = fig+1;
% figure(fig)
% scatter (inter2_RPE_FITC_intsy/max(inter2_RPE_FITC_intsy), inter2_FITC_RPE_intsy/max(inter2_FITC_RPE_intsy), 20, 'filled');
% grid on;
% set(gca, 'fontsize',15);%, 'XScale', 'log', 'YScale', 'log');
% xlabel('norm. PD-L1 intensity');
% ylabel('norm. EphA2 intensity');
% ax = gca;
% ax.FontSmoothing = 'on';




%% Bar plots colocalization %

coloc_percent = 100*intersections/num_union_3_channels;

x_labels = ['  E\capP   '; '  E\capC   '; '  P\capC   '; 'E\capC\capP'];

fig=fig+1;
figure(fig);
h=bar(coloc_percent, 'BarWidth', 0.5);
hold on;
ylabel("Coloc. %");
ylim([0 5]);
grid on;
set(gca, 'fontsize',13,'xticklabel',x_labels, 'fontweight','bold');
set(gcf,'position',[150, 700, 300, 200]);
% set(gca, 'fontsize',15,'xticklabel',x_labels, 'YScale', 'log');
ax = gca;
ax.FontSmoothing = 'on';

%% Export graphs

% mkdir(sample_name)
% cd(sample_name);

% exportgraphics(figure(1),'Venn-CD73-EphA2-PD-L1.png','Resolution',1000);
% print(figure(2), 'corr_CD73-PD-L1','-dpng','-r1000');
% print(figure(3), 'corr_CD73-EphA2','-dpng','-r1000');
% print(figure(4), 'corr_PD-L1-EphA2','-dpng','-r1000');
% print(figure(5), 'coloc_bar_plot','-dpng','-r1000');