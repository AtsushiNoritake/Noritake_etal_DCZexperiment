%% This code produces Figures 3d and 3e (Granger predictability).
clc ; clear ; close all ; 
COLS.post           = [ 232 82 152] / 255 ;
COLS.pre            = [ 201 202 203] /255 ;
COLS.diff           = [ 201 202 203] /255 ;

xlsname             = 'Noritake_etal_NatCommun_DCZ_datasummary_forFigs.xlsx' ; 
sheetname           = 'Fig3d_GC(Post)_Partner';
data.post.partner   = xlsread(xlsname, sheetname) ; 
sheetname           = 'Fig3d_GC(Pre)_Partner';
data.pre.partner    = xlsread(xlsname, sheetname) ; 
sheetname           = 'Fig3d_GC(Post)_Self';
data.post.self      = xlsread(xlsname, sheetname) ; 
sheetname           = 'Fig3d_GC(Pre)_Self';
data.pre.self       = xlsread(xlsname, sheetname) ; 
sheetname           = 'Fig3e_GC(post-pre)_Partner';
data.prepos.partner = xlsread(xlsname, sheetname) ; 
sheetname           = 'Fig3e_GC(post-pre)_Self';
data.prepos.self    = xlsread(xlsname, sheetname) ; 


%% MEAN and SEM
vers  = ver ;
Hz    = data.pre.self(:,1) ; 
if any(arrayfun(@(x)strcmpi(x.Name, 'Deep Learning Toolbox') , vers, 'UniformOutput', true))
    data  = structfun(@(x)structfun(@(x)removerows(x', 'ind', 1), x, 'UniformOutput', false), data, 'UniformOutput', false) ;
else
    for fld1 = fieldnames(data)'
        for fld2 = fieldnames(data.(fld1{1}))'
            data.(fld1{1}).(fld2{1})(:,1) =[] ; 
            data.(fld1{1}).(fld2{1}) = data.(fld1{1}).(fld2{1})' ; 
        end
    end     
end
means = structfun(@(x)structfun(@(x)nanmean(x',2), x, 'UniformOutput', false), data, 'UniformOutput', false) ; 
sems  = structfun(@(x)structfun(@(x)nanstd(x',[],2)./sqrt(size(x,1)-1), x, 'UniformOutput', false), data, 'UniformOutput', false) ; 
n     = size(data.pre.self,2) ; 

%% Figure 3d
clear  l ;
fontsize= 14; 
figure('position', [100 100 800 400]);

hdl(1) = subplot(1,2,1) ; 
l(1)   = errorbar(1:n, means.pre.self, sems.pre.self, sems.pre.self, '.-', 'MarkerSize', 30, 'Color', COLS.pre) ; 
hold on ;
l(2)   = errorbar(1:n, means.post.self, sems.post.self, sems.post.self, '.-', 'MarkerSize', 30, 'Color', COLS.post) ; 
f      = title('Self-variable block') ; f.FontSize = fontsize; 
f      = ylabel('Proportion of significant GC pairs') ; f.FontSize = fontsize; 
f      = xlabel('Frequency (Hz)') ; f.FontSize = fontsize; 
lgd = legend({'Pre-DCZ', 'Post-DCZ'}) ; lgd.Box = 'off' ; lgd.Location = 'southwest' ; 
set(gca, 'XScale', 'log')


hdl(2) = subplot(1,2,2) ; 
l(3)   =errorbar(1:n, means.pre.partner, sems.pre.partner, sems.pre.partner, '.-', 'MarkerSize', 30, 'Color', COLS.pre) ; 
hold on ;
l(4)   = errorbar(1:n, means.post.partner, sems.post.partner, sems.post.partner, '.-', 'MarkerSize', 30, 'Color', COLS.post) ; 
f      = title('Partner-variable block') ; f.FontSize = fontsize; 
f      = ylabel('Proportion of significant GC pairs') ; f.FontSize = fontsize; 
f      = xlabel('Frequency (Hz)') ; f.FontSize = fontsize; 
lgd = legend({'Pre-DCZ', 'Post-DCZ'}) ; lgd.Box = 'off' ; lgd.Location = 'southwest' ; 
set(gca, 'XScale', 'log')

ticks =  knnsearch(Hz, [3; 8;24;68;128]);
set(hdl, 'tickdir', 'out', 'Box', 'off', 'xlim', [0 78], 'ytick', 0:.1:1, 'Ylim', [0 .5], 'FontName', 'Arial');
set(hdl, 'xminortick', 'off', 'xtick',ticks, 'xticklabel', [3; 8;24;68;128]) ; 


%% Figure 3d
clear l hdl ; 
[stats.self ,stats.selfP ]     = ttest(data.prepos.self, 0, 'Tail', 'Left'); 
[stats.partner, stats.partnerP] = ttest(data.prepos.partner, 0, 'Tail', 'Left'); 

figure('position', [100 100 800 400]);
fontsize =12;

 subplot(1,2,1) ; 
l(1)   = errorbar(1:n, means.prepos.self, sems.prepos.self, sems.prepos.self, '.-', 'MarkerSize', 30, 'Color', COLS.pre) ; 
set(gca, 'XScale', 'log') ;
f      = title({'Self-variable block', 'post DCZ - pre DCZ'}) ; f.FontSize = fontsize; 
f      = ylabel('Difference in MPFC-to-LH GC') ; f.FontSize = fontsize; 
f      = xlabel('Frequency (Hz)') ; f.FontSize = fontsize; 
hold on ;
a = get(gca, 'xlim') ; 
plot([a(1); a(2)+1], [0; 0], '--', 'color', 'k') ;
plot(find(stats.self), means.prepos.self(find(stats.self)), '.', 'markersize', 28, 'color', 'r') ; 
ticks =  knnsearch(Hz, [3; 8;24;68;128]);
set(gca, 'tickdir', 'out', 'Box', 'off', 'xlim', [0 78], 'ytick', -1:0.025:1, 'Ylim', [-0.05 0.05], 'FontName', 'Arial');
set(gca, 'xminortick', 'off', 'xtick',ticks, 'xticklabel', [3; 8;24;68;128]) ; 
hold on ;
a = get(gca, 'xlim') ; 
plot([a(1); a(2)+1], [0; 0], '--', 'color', 'k') ;

subplot(1,2,2) ; 
l(2)   = errorbar(1:n, means.prepos.partner, sems.prepos.self, sems.prepos.partner, '.-', 'MarkerSize', 30, 'Color', COLS.pre) ; 
set(gca, 'XScale', 'log') ;
f      = title({'Self-variable block', 'post DCZ - pre DCZ'}) ; f.FontSize = fontsize; 
f      = ylabel('Difference in MPFC-to-LH GC') ; f.FontSize = fontsize; 
f      = xlabel('Frequency (Hz)') ; f.FontSize = fontsize; 
hold on ;
plot(find(stats.partner), means.prepos.partner(find(stats.partner)), '.', 'markersize', 28, 'color', 'r') ; 
a = get(gca, 'xlim') ; 
plot([a(1); a(2)+1], [0; 0], '--', 'color', 'k') ;
ticks =  knnsearch(Hz, [3; 8;24;68;128]);
set(gca, 'tickdir', 'out', 'Box', 'off', 'xlim', [0 78], 'ytick', -1:0.025:1, 'Ylim', [-0.075 0.05], 'FontName', 'Arial');
set(gca, 'xminortick', 'off', 'xtick',ticks, 'xticklabel', [3; 8;24;68;128]) ; 

