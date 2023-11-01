# Evasion
Instructions for how to run new simulations of the model and regenerate Figures 2, 3, 4, S1, S2, S3 and Table 1 from data for review purposes of Strömbom & Futterman. An Alignment-Free …. . Submitted to Dynamics. Download all files and then follow instructions below.

REGENERATE FIGURES 2,3,4,S1,S2,S3 AND TABLE 1
To regenerate Figure 2 run mkFig2.m, to regenerate Figure 4 and Table 1 run mkFig4.m, and to regenerate Figures 3, S1, S2 and S3 run mkFig3.m. 

RUN NEW SIMULATIONS TO SEE ANIMATION AND FIGURE 2 TYPE PLOT
Running the command FishP(M,s) with specified model type (M=0 Attr+Rep, M=1 Attr+Rep+Align) and speed difference (s=1,2,3,4) input parameters will show a real time animation of the simulation, and when finished plot a Figure 2 panel corresponding to the current simulation. For example, FishP(0,4) will show a simulation of the Attr+Rep model with speed difference 4, and FishP(1,3) will show a simulation of the Attr+Rep+Alignment model with speed difference 3. Figure 1 shows screenshots of such animations. Note that the Figure 2 panel will look different every time you generate it from new simulations, as will the animated simulation you see when running it, because each simulation is unique. 
