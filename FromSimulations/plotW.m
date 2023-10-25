function D=plotW(X)
%Function to calculate the angular distance from the predator to each individual
%fish over time in each simulation (fog Figure 2). Input X is a cell array of all 
%fish positions through time (from Fish.m). Output D is an angular distance matrix 
%containing the angular distance of all fish over time in the simulation.

sX=size(X,1); %number of fish

u=[17,-7,0]; %Predator location
D=[]; %collect distances
for i=1:sX %For each fish i
    Y=X{i,1}; %Fish i coordinates over time
    dI=[]; %initiate angular distance matrix to store angular distance over time for each fish. (Time will be rows, Fish id be columns)
    for k=1:size(Y,1) %For each time step
        v=[Y(k,1:2),0]; %Used to calc angle/length of unit circle segment from predator location (u) and fish i location in this time step (v) via cross product
        r=sqrt(Y(k,1)^2+Y(k,2)^2); %Distance fish i to origin (radius fish i is moving at)
        csl=atan2(norm(cross(u,v)),dot(u,v)); %angle/length of unit circle segment from predator location (u) and fish i location in this time step (v) 
        dI=[dI;r*csl]; %store angular distance (d=r*csl) for fish i in this timestep in fish i's angular distances vector
    end
    D=[D,dI]; %store fish i's angular distance vector as column i in angular distance matrix for all fish.
end
