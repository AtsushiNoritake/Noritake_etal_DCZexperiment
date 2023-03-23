%% This code produces Figures 2b and 2d (Gaze behaviors).

clc ; clear ; close all ;
xlsname                  = 'Noritake_etal_NatCommun_DCZ_datasummary_forFigs.xlsx' ;
cols.vehicle = [89 87 87]/255 ;
cols.dcz     = [228 0 127]/255 ;
xtickstr     = {'Vehicle', 'DCZ'} ; 

sheetname               = 'Fig2b_Self' ;
data.cs.self            = xlsread(xlsname, sheetname) ;
sheetname               = 'Fig2b_Partner' ;
data.cs.partner         = xlsread(xlsname, sheetname) ;
sheetname               = 'Fig2d_Self' ;
data.us.self            = xlsread(xlsname, sheetname) ;
sheetname               = 'Fig2d_Partner' ;
data.us.partner         = xlsread(xlsname, sheetname) ;


%% Figure 2b

txtheight1 = 1.25; 
txtheight2 = 1.35; 
lgndstr    = 0 ; 

figure('position', [100 100 1200 500]);

hdls(1) = subplot(1,4,1) ; 
vhdl{1} = violin(data.cs.self(:,1:2), 'plotlegend', lgndstr , 'medc', []) ;
vhdl{1}(1).FaceColor =  cols.vehicle ; vhdl{1}(2).FaceColor =  cols.dcz ;
f    = ylabel('Proportion of gaze') ; f.FontSize = 12;
xtickangle(20); 
f = text(1.3, txtheight1, 'MkP') ;f.FontSize= 12;
hdls(1).Position(4) = hdls(1).Position(4) *.9 ; 

hdls(2) = subplot(1,4,2) ; 
vhdl{2} = violin(rmmissing(data.cs.self(:,3:4)), 'plotlegend', lgndstr , 'medc', [] ) ;
vhdl{2}(1).FaceColor =  cols.vehicle ; vhdl{2}(2).FaceColor =  cols.dcz ;
f    = ylabel('Proportion of gaze') ; f.FontSize = 12;
xtickangle(20); 
f = text(1.3, txtheight1, 'MkA') ;f.FontSize= 12;
hdls(2).Position(4) = hdls(2).Position(4) *.9 ;

hdls(3) = subplot(1,4,3) ; 
vhdl{3} = violin(rmmissing(data.cs.partner(:,1:2)), 'plotlegend', lgndstr , 'medc', [] ) ;
vhdl{3}(1).FaceColor =  cols.vehicle ; vhdl{3}(2).FaceColor =  cols.dcz ;
f    = ylabel('Proportion of gaze') ; f.FontSize = 12;
xtickangle(20); 
f = text(1.3, txtheight1, 'MkP') ;f.FontSize= 12;
hdls(3).Position(4) = hdls(3).Position(4) *.9 ;

hdls(4) = subplot(1,4,4) ; 
vhdl{4} = violin(rmmissing(data.cs.partner(:,3:4)), 'plotlegend', lgndstr  , 'medc', []) ;
vhdl{4}(1).FaceColor =  cols.vehicle ; vhdl{4}(2).FaceColor =  cols.dcz ;
f    = ylabel('Proportion of gaze') ; f.FontSize = 12;
xtickangle(20); 
f = text(1.3, txtheight1, 'MkA') ;f.FontSize= 12;
hdls(4).Position(4) = hdls(4).Position(4) *.9 ;

set(hdls, 'Box', 'off', 'Tickdir', 'out', ...
    'xtick', 1:2, 'xticklabel', {'Vehicle', 'DCZ'}, ...
    'ylim', [-.3 1.3], 'ytick',  [-.3 0  1 1.3], 'yticklabel', [-.3 0 1 1.3],...
    'FontName',  'Arial', 'ticklength', [1 1]*.02);
f = suplabel('Self-variable block', 't') ; f.Position(1)  = -.1 ; f.FontSize=  16;
f = suplabel('Partner-variable block', 't') ; f.Position(1)  = .31 ; f.FontSize=  16;

%% Figure 2d

txtheight1 = 1.7; 
txtheight2 = 1.5; 
lgndstr    = 0 ; 

figure('position', [100 100 1200 500]);

hdls(1) = subplot(1,4,1) ; 
vhdl{1} = violin(data.us.self(:,1:2), 'plotlegend', lgndstr  , 'medc', []) ;
vhdl{1}(1).FaceColor =  cols.vehicle ; vhdl{1}(2).FaceColor =  cols.dcz ;
f    = ylabel('Proportion of gaze') ; f.FontSize = 12;
xtickangle(20); 
f = text(1.4, txtheight1, 'MkP') ;f.FontSize= 12;
hdls(1).Position(4) = hdls(1).Position(4) *.9 ;

hdls(2) = subplot(1,4,2) ; 
vhdl{2} = violin(rmmissing(data.us.self(:,3:4)), 'plotlegend', lgndstr , 'medc', [] ) ;
vhdl{2}(1).FaceColor =  cols.vehicle ; vhdl{2}(2).FaceColor =  cols.dcz ;
f    = ylabel('Proportion of gaze') ; f.FontSize = 12;
xtickangle(20); 
f = text(1.4, txtheight1-0.575, 'MkA') ;f.FontSize= 12;
hdls(2).Position(4) = hdls(2).Position(4) *.9 ;

hdls(3) = subplot(1,4,3) ; 
vhdl{3} = violin(rmmissing(data.us.partner(:,1:2)), 'plotlegend', lgndstr  , 'medc', []) ;
vhdl{3}(1).FaceColor =  cols.vehicle ; vhdl{3}(2).FaceColor =  cols.dcz ;
f    = ylabel('Proportion of gaze') ; f.FontSize = 12;
xtickangle(20); 
f = text(1.4, txtheight1, 'MkP') ;f.FontSize= 12;
hdls(3).Position(4) = hdls(3).Position(4) *.9 ;

hdls(4) = subplot(1,4,4) ; 
vhdl{4} = violin(rmmissing(data.us.partner(:,3:4)), 'plotlegend', lgndstr  , 'medc', []) ;
vhdl{4}(1).FaceColor =  cols.vehicle ; vhdl{4}(2).FaceColor =  cols.dcz ;
f    = ylabel('Proportion of gaze') ; f.FontSize = 12;
xtickangle(20); 
f = text(1.4, txtheight1-0.575, 'MkA') ;f.FontSize= 12;
hdls(4).Position(4) = hdls(4).Position(4) *.9 ;

set(hdls([1,3]), 'Box', 'off', 'Tickdir', 'out', ...
    'xtick', 1:2, 'xticklabel', {'Vehicle', 'DCZ'}, ...
    'ylim', [-.8 1.8], 'ytick',  [-.8 0 1 1.8], ...
    'FontName',  'Arial', 'ticklength', [1 1]*.02);

set(hdls([2,4]), 'Box', 'off', 'Tickdir', 'out', ...
    'xtick', 1:2, 'xticklabel', {'Vehicle', 'DCZ'}, ...
    'ylim', [-.2 1.2], 'ytick',  [-.2 0  1 1.2], ...
    'FontName',  'Arial', 'ticklength', [1 1]*.02);
f = suplabel('Self-variable block', 't') ; f.Position(1)  = -.1 ; f.FontSize=  16;
f = suplabel('Partner-variable block', 't') ; f.Position(1)  = .31 ; f.FontSize=  16;



