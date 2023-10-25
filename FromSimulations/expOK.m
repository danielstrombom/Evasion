function OK2=expOK(N)
% Function to create unique initial conditions OK2 for a population
% of N particles by inserting an perturbing positions and headings of a 
% pre-simulated school of 50 particles moving clockwise in the arena
% (OK.mat)

load OK

%Radius of outer wall
RA=22;   
%Radius of inner wall
RB=10;

Q=zeros(N,4);
P=OK;
Q(1:50,:)=P;

for i=1:(N-50)
j=1+round(rand*49);
Q(50+i,:)=[P(j,1)+3*(0.5-rand),P(j,2)+3*(0.5-rand),min(P(:,3))+rand*(max(P(:,3))-min(P(:,3))),min(P(:,4))+rand*(max(P(:,4))-min(P(:,4)))];
end

OK2=Q;
