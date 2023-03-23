%% This code produces Figure 1c (anticipatory licking behavior).

% clear ; clc ; close all ; 
% set(0, 'DefaultFigurePosition', [100 100 800 600]);
COLS.partner         = [ 0.0902    0.2902    0.6157] ;
COLS.self            = [ 0.9059    0.1294    0.1020] ;

xlsname              = 'Noritake_etal_NatCommun_DCZ_datasummary_forFigs.xlsx' ; 
sheetname            = 'Fig1c' ; 
data.all             = xlsread(xlsname, sheetname) ; 

data.MkP.veh_partner = data.all(:,  1: 3) ; 
data.MkP.dcz_partner = data.all(:,  4: 6) ; 
data.MkP.veh_self    = data.all(:,  7: 9) ; 
data.MkP.dcz_self    = data.all(:, 10:12) ; 
data.MkA.veh_partner = data.all(:, 13:15) ; 
data.MkA.dcz_partner = data.all(:, 16:18) ; 
data.MkA.veh_self    = data.all(:, 19:21) ; 
data.MkA.dcz_self    = data.all(:, 22:24) ; 

%% Mean & SEM

clear meansize sems means; 
means.MkP = structfun(@nanmean, data.MkP, 'UniformOutput', false); 
means.MkA = structfun(@nanmean, data.MkA, 'UniformOutput', false); 
for monkey ={'MkP', 'MkA'}
    for ii = 1:3
        meansize.(monkey{1}).veh_partner(ii) = size(data.(monkey{1}).veh_partner,1) - sum(isnan(data.(monkey{1}).veh_partner(:,ii)))  ;
        meansize.(monkey{1}).dcz_partner(ii) = size(data.(monkey{1}).dcz_partner,1) - sum(isnan(data.(monkey{1}).dcz_partner(:,ii)))  ;
        meansize.(monkey{1}).veh_self(ii)    = size(data.(monkey{1}).veh_self,1)    - sum(isnan(data.(monkey{1}).veh_self(:,ii)))  ;
        meansize.(monkey{1}).dcz_self(ii)    = size(data.(monkey{1}).dcz_self,1)    - sum(isnan(data.(monkey{1}).dcz_self(:,ii)))  ;
    end
    sems.(monkey{1}).veh_partner = nanstd(data.(monkey{1}).veh_partner,[],1)./ sqrt(meansize.(monkey{1}).veh_partner-1) ;
    sems.(monkey{1}).dcz_partner = nanstd(data.(monkey{1}).dcz_partner,[],1)./ sqrt(meansize.(monkey{1}).dcz_partner-1) ;
    sems.(monkey{1}).veh_self    = nanstd(data.(monkey{1}).veh_self,[],1)   ./ sqrt(meansize.(monkey{1}).veh_self-1) ;
    sems.(monkey{1}).dcz_self    = nanstd(data.(monkey{1}).dcz_self,[],1)   ./ sqrt(meansize.(monkey{1}).dcz_self-1) ;

end
%% Figure 1c

ylblstr = {'Licking frequency', '(z-score)'} ;
for monkey ={'MkP', 'MkA'}
    figure('position', [100 100 600 600]);
    
    % Self(M1)-variable block
    hdls.(monkey{1})(1)   = subplot(2,2,1); hold on ;
    a = errorbar(1:3, means.(monkey{1}).veh_self, sems.(monkey{1}).veh_self, 'Marker', 'o', 'MarkerSize', 8, 'MarkerFaceColor', 'w',  'color', COLS.self) ;
    xlabel('\itP \rm(self-reward)', 'FontSize', 12) ;
    ylabel(ylblstr, 'FontSize', 12) ;
    if strcmpi(monkey{1}, 'mkp')
        text(0.7, .555, 'Vehicle', 'FontSize', 12, 'BackGroundColor',[220 211 211]/255) ;
    else
        text(0.7, 1.25, 'Vehicle', 'FontSize', 12, 'BackGroundColor',[220 211 211]/255) ;
    end
    hdls.(monkey{1})(2)   = subplot(2,2,2) ;
    errorbar(1:3, means.(monkey{1}).dcz_self, sems.(monkey{1}).dcz_self, 'marker', '.', 'markersize', 30, 'color', COLS.self) ;
    xlabel('\itP \rm(self-reward)', 'FontSize', 12) ;
    if strcmpi(monkey{1}, 'mkp')
        text(0.7, .55, 'DCZ', 'FontSize', 12, 'BackGroundColor',[246 191 215]/255 ) ;
        set(hdls.(monkey{1})([1,2]), 'box', 'off', 'tickdir', 'out', 'xlim', [.5 3.5], 'ylim', [0 .6], 'Xtick', 1:3, 'Ytick', [0 .6], 'Xticklabel', {'0.25', '0.5', '0.75'}) ;
    else
        text(0.7, 1.25, 'DCZ', 'FontSize', 12, 'BackGroundColor',[246 191 215]/255 ) ;
        set(hdls.(monkey{1})([1,2]), 'box', 'off', 'tickdir', 'out', 'xlim', [.5 3.5], 'ylim', [.6 1.3], 'xtick', 1:3, 'ytick', [0.6 1.2], 'xticklabel', {'0.25', '0.5', '0.75'}) ;
    end
    f = suplabel(sprintf('Partner-variable block [%s]', monkey{1})) ; f.FontSize = 12; f.Position(2) = .55;
    
    % Partner(M2)-variable block
    hdls.(monkey{1})(3)   = subplot(2,2,3); hold on ;
    errorbar(1:3, means.(monkey{1}).veh_partner, sems.(monkey{1}).veh_partner, 'Marker', 'o', 'Markersize', 8, 'MarkerFaceColor', 'w',   'Color', COLS.partner) ;
    xlabel('\itP \rm(partner-reward)', 'FontSize', 12) ;
    ylabel(ylblstr, 'FontSize', 12) ;
    if strcmpi(monkey{1}, 'mkp')
        text(0.7, -.13, 'Vehicle', 'FontSize', 12, 'BackGroundColor',[220 211 211]/255) ;
    else
        text(0.7, 0.655, 'Vehicle', 'FontSize', 12, 'BackGroundColor',[220 211 211]/255) ;
    end
    hdls.(monkey{1})(4)   = subplot(2,2,4) ;
    errorbar(1:3, means.(monkey{1}).dcz_partner, sems.(monkey{1}).dcz_partner, 'marker', '.', 'markersize', 30, 'color', COLS.partner) ;
    xlabel('\itP \rm(partner-reward)', 'FontSize', 12) ;
    if strcmpi(monkey{1}, 'mkp')
        text(0.7, -.13, 'DCZ', 'FontSize', 12, 'BackGroundColor',[246 191 215]/255 ) ;
        set(hdls.(monkey{1})([3,4]), 'box', 'off', 'tickdir', 'out', 'xlim', [.5 3.5], 'ylim', [-.2 .4], 'xtick', 1:3, 'ytick', [-.2,.4], 'xticklabel', {'0.25', '0.5', '0.75'}) ;
    else
        text(0.7, 0.655, 'DCZ', 'FontSize', 12, 'BackGroundColor',[246 191 215]/255) ;
        set(hdls.(monkey{1})([3,4]), 'box', 'off', 'tickdir', 'out', 'xlim', [.5 3.5], 'ylim', [.2 .7], 'xtick', 1:3, 'ytick', [0.2, 0.7], 'xticklabel', {'0.25', '0.5', '0.75'}) ;
    end
    f = suplabel(sprintf('Self-variable block [%s]', monkey{1}), 't') ; f.FontSize = 12;
end

