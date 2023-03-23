# Noritake_etal_DCZexperiment
This repository contains the visualization codes of figures in our paper, "**Chemogenetic dissection of a prefrontal-hypothalamic circuit for socially subjective reward valuation in macaques**".

We used [MATLAB][def0] with the following toolboxes and libraries:  
 	- Statistics and machine learning toolbox (version 12.0)  
	- (Deep learning toolbox [version 14.1])  
	- [suplabel (version 1.5.0.0)][def1]   
	- [Violin Plot (version 1.7.0.0)][def2]


## - Installation guide -
Please  
1. download the following data and code files from the [github page][def3] and the libraries from [MATLAB Central File Exchange][def4]. 
2. place them in the same folder/directory. 
3. append the folder/directory to your MATLAB environment's paths
	or move to the folder/directory.
4. run these codes.  

Typical instllation time is less than 10 minutes.  
 
*Data*  
* Noritake_etal_NatCommun_DCZ_datasummary_forFigs.xlsx  

*Codes*  
* Noritake_etal_NatCommun_DCZ_Fig1c_Licking.m  
* Noritake_etal_NatCommun_DCZ_Fig2bd_EyeROI.m  
* Noritake_etal_NatCommun_DCZ_Fig3bc_Coherence.m  
* Noritake_etal_NatCommun_DCZ_Fig3de_Granger.m*  
	*If Deep Learning Toolbox is installed on your MATLAB, this code uses the 'removerows' function.

*Libraries*  
* suplabel.m  
* violin.m  


## - Expected output - 
* Noritake_etal_NatCommun_DCZ_Fig1c_Licking.m reproduces Fig. 1c (anticipatory licking behavior).  
* Noritake_etal_NatCommun_DCZ_Fig2bd_EyeROI.m reproduces Fig. 2b and 2d (gaze behavior).  
* Noritake_etal_NatCommun_DCZ_Fig3bc_Coherence.m reproduces Fig. 3b and 3c (field-field coherence).  
* Noritake_etal_NatCommun_DCZ_Fig3de_Granger.m reproduces Fig. 3d and 3e (Granger predictability).  

Running each code will take less than 10 seconds under the below environments.  

## - Tested environment -
The codes do not require non-standard hardware and have been tested on the following environments.  
- MATLAB version: 9.9.0.1857802 (R2020b) Update 7  
- Deep Learning Toolbox version: 14.1 
- Statistics and Machine Learning Toolbox: 12.0  
- Java version: Java 1.8.0_202-b08 with Oracle Corporation Java HotSpot(TM) 64-Bit Server VM mixed mode  
- OS version: Microsoft Windows 11 Pro Version 10.0 (Build 22621)  

and  
- MATLAB  version: 9.9.0.1495850 (R2020b) Update 1  
- Deep Learning Toolbox version: 14.1 
- Statistics and Machine Learning Toolbox: 12.0  
- Java version: Java 1.8.0_202-b08 with Oracle Corporation Java HotSpot(TM) 64-Bit Server VM mixed mode  
- OS version: Microsoft Windows 10 Pro Version 10.0 (Build 19045)  

 ---
 Please contact [us][<isodam@nips.ac.jp>] if you have questions.

[def0]: https://mathworks.com/products/matlab.html   
[def1]: https://mathworks.com/matlabcentral/fileexchange/7772-suplabel   
[def2]: https://mathworks.com/matlabcentral/fileexchange/45134-violin-plot
[def3]: https://github.com/AtsushiNoritake/Noritake_etal_DCZexperiment/blob/main/README.md
[def4]: https://mathworks.com/matlabcentral/fileexchange/
