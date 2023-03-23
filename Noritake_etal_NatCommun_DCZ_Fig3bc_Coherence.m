%% This code produces Figures 3b and 3c (field-field coherence).
clc ; clear ; close all ;
xlsname                  = 'Noritake_etal_NatCommun_DCZ_datasummary_forFigs.xlsx' ;

COLS.partner             = [ 0.0902    0.2902    0.6157] ;
COLS.self                = [ 0.9059    0.1294    0.1020] ;

sheetname                = 'Fig3b_Pre_self' ;
data.pre{1}              = xlsread(xlsname, sheetname) ;
sheetname                = 'Fig3b_Pre_partner' ;
data.pre{2}              = xlsread(xlsname, sheetname) ;
sheetname                = 'Fig3b_Pos_self' ;
data.pos{1}              = xlsread(xlsname, sheetname) ;
sheetname                = 'Fig3b_Pos_partner' ;
data.pos{2}              = xlsread(xlsname, sheetname) ;
sheetname                = 'Fig3c_pos-pre_self' ;
data.prepos{1}           = xlsread(xlsname, sheetname) ;
sheetname                = 'Fig3c_pos-pre_partner' ;
data.prepos{2}           = xlsread(xlsname, sheetname) ;
time                     = data.prepos{1}(2:end,1);
frequency                = data.prepos{1}(1,2:end);
data.pre{1}(:,1)      = [] ; data.pre{2}(:,1)      = [] ;
data.pre{1}(1,:)      = [] ; data.pre{2}(1,:)      = [] ;
data.pos{1}(:,1)      = [] ; data.pos{2}(:,1)      = [] ;
data.pos{1}(1,:)      = [] ; data.pos{2}(1,:)      = [] ;
data.prepos{1}(:,1)   = [] ; data.prepos{2}(:,1)   = [] ;
data.prepos{1}(1,:)   = [] ; data.prepos{2}(1,:)   = [] ;
%% Self-variable block
blockstrs = {'Self-variable block', 'Partner-variable block'}  ;
cmin = -.3 ; cmax =  .3 ;
lvl  = 5 ;
figure ('position', [100 100 900 600]);

h(1) = subplot(2,2,1) ;
contourf(1:numel(time), 1:numel(frequency), data.pre{1}' , lvl,  'linecolor', 'none', 'LevelStep', 0.05, 'LevelList', [ -0.0505 -0.05 0 0.05 0.10 0.15 0.20 0.25 0.30]) ;
caxis( [cmin, cmax]) ;
hold on;
plot([500 500], [1 numel(frequency)], 'k') ;
f = ylabel('Frequency (Hz)') ; f.FontSize= 16;
f = title( sprintf('%s (pre DCZ)', blockstrs{1}) ); f.FontSize= 16;

h(2) = subplot(2,2,2) ;
contourf(1:numel(time), 1:numel(frequency), data.pos{1}' , lvl, 'linecolor', 'none', 'LevelStep', 0.05, 'LevelList', [-0.0814 -0.05  0 0.05 0.10  0.15  0.2000  0.25]) ;
caxis( [cmin, cmax]) ;
hold on;
plot([500 500], [1 numel(frequency)], 'k') ;
c = colorbar('position', [.92 .11+(1-1)*.475 .02 .34]) ;  c.FontSize = 10 ;   c.Ticks = [-.3 0 .3] ;
f = title( sprintf('%s (post DCZ)', blockstrs{1}) ); f.FontSize= 16;
f = ylabel('Frequency (Hz)') ; f.FontSize= 16;

h(3) = subplot(2,2,3) ;
contourf(1:numel(time), 1:numel(frequency), data.pre{2}' , lvl, 'linecolor', 'none', 'LevelStep', 0.05, 'LevelList', [-0.0491 0 0.0500 0.1000 0.1500 0.2000]) ;
caxis( [cmin, cmax]) ;
hold on;
plot([500 500], [1 numel(frequency)], 'k') ;
f = title( sprintf('%s (pre DCZ)', blockstrs{2}) ); f.FontSize= 16;
f = xlabel('Time from stimulus onset (ms)')  ; f.FontSize = 16 ;
f = ylabel('Frequency (Hz)') ; f.FontSize= 16;

h(4) = subplot(2,2,4) ;
% dat  = [];  dat  = data.pos{2}';  dat(dat< -0.0491) = -0.0491 ;
contourf(1:numel(time), 1:numel(frequency), data.pos{2}' , lvl, 'linecolor', 'none', 'LevelStep', 0.05, 'LevelList', [-0.0843 -0.0500 0 0.0500 0.1000 0.1500]) ;
hold on ;
caxis( [cmin, cmax]) ;

plot([500 500], [1 numel(frequency)], 'k') ;
c = colorbar('position', [.92 .11+(2-1)*.475 .02 .34]) ;  c.FontSize = 10 ;  c.Ticks = [-.3 0 .3] ;
f = title( sprintf('%s (post DCZ)', blockstrs{2}) ); f.FontSize= 16;
f = xlabel('Time from stimulus onset (ms)') ; f.FontSize = 16 ;
f = ylabel('Frequency (Hz)') ; f.FontSize= 16;

xstr = [-500 0 500 1000 1500];
set(h, 'ytick', [1:5:24,24], 'yticklabel', round(frequency([1:5:24, 24])), ...
    'xtick', [1, 500: 500:1500], 'xticklabel', xstr, ...
    'TickDir', 'out') ;
drawnow ;


%% Post - Pre
blockstrs = {'Self-variable block (post - pre)', 'Partner-variable block (post - pre)'}  ;
cmin = -.1 ; cmax =  .1 ;
figure ('position', [100 100 600 600]);
lsts = [  -0.1168   -0.1000   -0.0800   -0.0600   -0.0400   -0.0200         0    0.0200];

for ps = 1:2
    subplot(2,1,ps) ;
    contourf(1:numel(time), 1:numel(frequency), data.prepos{ps}' , 40, 'linecolor', 'none') ;
    hold on;
    caxis( [cmin, cmax]) ;
    plot([500 500], [1 numel(frequency)], 'k') ;
    f = title( sprintf('%s', blockstrs{ps}) ); f.FontSize= 16;
    f = ylabel('Frequency (Hz)') ; f.FontSize= 16;
    xstr = [-500 0 500 1000 1500];
    set(gca, 'ytick', [1:5:24,24],  'yticklabel', round(frequency([1:5:24, 24])),'xtick', [1, 500: 500:1500], 'xticklabel', xstr, 'tickdir', 'out') ;
    c = colorbar('position', [.92 .11+(ps-1)*.475 .02 .34]) ;c.FontSize = 10 ; c.Ticks = [-.1 0 .1] ;
    drawnow ;
end
f = xlabel('Time from stimulus onset (ms)') ; f.FontSize = 16 ;
