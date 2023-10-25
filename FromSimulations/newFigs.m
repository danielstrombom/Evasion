function X=newFigs
%Function to create new versions of Figures 2 and 3 from new simulations
%using the function Fish.m. See description in Fish.m for more information 
%about this main simulator function.

%First the code below runs one simulation each for the Attr+Rep model with speed 
%differences 1 and 4, and the Attr+Rep+Alignment model with speed differences 
%1 and 4. Each simulation returns the trajectories of all particles through the
%simulation and these are then plotted to create a new Figure 2 using the
%mkFig2 function.

%Then it runs run T=1500 simulations for each of the eight cases, Attr+Rep 
%for speed differences 1,2,3,4 and then Attr+Rep+Alignment for speed
%differences 1,2,3,4. Each simulation returns the Instantaneous alignment
%over time, and this data is then used to create new Figure 3 and Figure S1
%using the mkFig3 function.


% FIGURE 2 (F=2)

%ATTRACTION REPULSION (M=0)

Xs1=Fish(0,1,2); %No speed difference (s=1)

Xs4=Fish(0,4,2); %No speed difference (s=1)

%ATTRACTION REPULSION ALIGNMENT (M=1)

XAs1=Fish(1,1,2); %No speed difference (s=1)

XAs4=Fish(1,4,2); %No speed difference (s=1)

save Xs1 Xs1
save Xs4 Xs4
save XAs1 XAs1
save XAs4 XAs4

mkFig2

% FIGURE 3 (F=3)

T=1500; %Number of simulations
t=170; %Time steps of simulation

%ATTRACTION REPULSION (M=0)

PHI=zeros(T,t);
tic
parfor i=1:T
    C=Fish(0,1,3); %No speed difference (s=1)
    PHI(i,:)=C(1,:);
end
toc
AR1=PHI;

PHI=zeros(T,t);

parfor i=1:T
    C=Fish(0,2,3); %Speed difference s=2
    PHI(i,:)=C(1,:);
end

AR2=PHI;

PHI=zeros(T,t);

parfor i=1:T
    C=Fish(0,3,3); %Speed difference s=3
    PHI(i,:)=C(1,:);
end

AR3=PHI;

PHI=zeros(T,t);

parfor i=1:T
    C=Fish(0,4,3); %Speed difference s=4
    PHI(i,:)=C(1,:);
end

AR4=PHI;


ARC={AR1,AR2,AR3,AR4};

save ARC ARC



%ALIGNMENT (M=1)
PHI=zeros(T,t);

parfor i=1:T
    C=Fish(1,1,3); %No speed difference (s=1)
    PHI(i,:)=C(1,:);
end

A1=PHI;

PHI=zeros(T,t); 

parfor i=1:T
    C=Fish(1,2,3); %Speed difference s=2
    PHI(i,:)=C(1,:);
end

A2=PHI;

PHI=zeros(T,t); 

parfor i=1:T
    C=Fish(1,3,3); %Speed difference s=3
    PHI(i,:)=C(1,:);
end

A3=PHI;

PHI=zeros(T,t); 

parfor i=1:T
    C=Fish(1,4,3); %Speed difference s=4
    PHI(i,:)=C(1,:);
end

A4=PHI;

AC={A1,A2,A3,A4};

save AC AC

mkFig3
