function CMAL=nh2DGR(i,P,R,Rr,b)
%Function for calculating the neighbourhood of particle i, the direction of
%the local center of mass and repulsive force.

ba=b/2; %Half the blind angle
N=size(P,1); %Number of particles
NN=zeros(N,2); %To collect nearest neighbors within the attraction radius
NR=zeros(N,2); %To collect nearest neighbours within repulsion radius
count=0;
count2=0;
v=[-P(i,3),-P(i,4)]; %opposite to particle i:s direction of travel


for j=1:size(P,1) %For every
    if j~=i %non-self particle
        if (P(i,1)-P(j,1))^2+(P(i,2)-P(j,2))^2<R^2 %If particle j within distance R from particle i
            u=[P(j,1)-P(i,1),P(j,2)-P(i,2)];
            theta=acos((v(1)*u(1)+v(2)*u(2))/(sqrt(u(1)^2+u(2)^2))); %Angle between opposite i-direction and direction from i toward j.
            if abs(theta)>ba %If particle j not in i:s blind angle add as neighbor
                count=count+1;
                NN(count,:)=[P(j,1),P(j,2)];
            end
            if (P(i,1)-P(j,1))^2+(P(i,2)-P(j,2))^2<Rr^2
                count2=count2+1;
                NR(count2,:)=[P(j,1),P(j,2)];
            end
        end
    end
end

NN=NN(1:count,:);
NR=NR(1:count2,:);

sNN=size(NN,1);
sNR=size(NR,1);


if sNR>0 %If have neighbours within repulsion radius
    VV=[0,0];
    for j=1:sNR %For each neighbour
        V=[P(i,1)-NR(j,1),P(i,2)-NR(j,2)];
        d=sqrt(V(1,1)^2+V(1,2)^2);
        VN=(1/d^3)*V; %Relative strength is inversly proportional to distance.
        VV=VV+VN; %Add upp all repulsion vectors
    end
    REPn=VV;
    %REPn=(1/sqrt(VV(1,1)^2+VV(1,2)^2))*VV;
else
    REPn=[0,0]; %if no neighbour no new direction.
end

if sNN>0    
 
    CMx=mean(NN(:,1));
    CMy=mean(NN(:,2));
    
    CM=[CMx-P(i,1),CMy-P(i,2)]; %Direction toward center of mass of neighbors
    CM=(1/((CM(1,1)^2+CM(1,2)^2)^(1/2)))*CM; %Normalizes direction toward center of mass   
else
    CM=[0,0];
end

    CMAL=[CM;REPn];
