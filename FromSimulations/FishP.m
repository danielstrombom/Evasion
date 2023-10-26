function U = FishP(M,s)
%Function for simulating the predator evasion models in Strömbom & Futterman. 
%An alignment-free explanation of predator evasion in moving animal groups.
%and Animate the simulation as it runs.

%To run one simulation specify model type M (0: Attr+Rep only. 
% 1: Attr+Rep+Alignment), speed difference s.

%The output U contains the simulation and the simulation can be rewatch
%using the matlab command implay(U).

% Examples
% The command Fish(0,2,3) will run the Attr+Rep only model (M=0) with speed
% difference 2 (s=2).

% The command Fish(1,3,2) will run the Attr+Rep+Alignment model (M=1) with
% speed difference 3 (s=3).

F=2; 

%EXPERIMENT RELATED PARAMETERS
%t=simulation time
t=200;
%N=number of particles
N=51;
%Radius of outer wall
RA=22;   
%Radius of inner wall
RB=10;

%PREDATOR COORDINATES
xP=17; %x-ccorinate of predator
yP=-7; %y-coordinate of predator

%BEHAVIORAL PARAMETERS 
%c=relative strength of local attraction
c=2;
%d=relative tendency to proceed in previous direction
d=.5;
%a=relative strength of alignment
a=0.5;
%ba=blind angle
ba=3.2;
%rr=relative strength of local repulsion
rr=1.5;
%R=interaction radius for local attraction
R=10;
%Rr=radius of repulsion
Rr=2;
%delta=av speed per time step
delta=.2;

%NOISE & UPDATE RELATED PARAMETERS
%e=magnitude of angular noise
e=1/14;



%INITIATE THE POPULATION
P=expOK(N); % Positions and headings for N particles from perturbed pre-configuration OK.mat 

kk=1;
PHI=[];
PI=[];

%Cell array for fish positions through time
X=cell(N,1);


P(:,5)=ones(N,1);

for k=1:t %For every timestep
       
        PP=[zeros(N,4),P(:,5)];

        
        for i=1:N % For every particle
            
            %Do not use prediction for particle i itself
            G(i,1)=P(i,1);
            G(i,2)=P(i,2);
            
            % FIND NEIGHBORS AND CALCULATE DIRECTION OF ATTRACTION (CM) & REPULSION (REP)
            
            if M==0 % If Attraction & Repulsion only model
                CMAL=nh2DGR(i,P,R,Rr,ba); %Neighborhood & Force function for Attr+Rep only
                CM=CMAL(1,:); %Local attractive force
                REP=CMAL(2,:); %Local repulsive force
            elseif M==1 % Iff Attraction & Repulsion & Alignment model
                CMAL=nh2DGRA(i,P,R,Rr,ba); %Neighborhood & Force function for Attr+Rep+Alignment
                CM=CMAL(1,:); %Local attractive force
                REP=CMAL(2,:); %Local repulsive force
                AL=CMAL(3,:); %Local alignment force
            end
                
            
            % APPLY PREDATOR RESPONSE
            if k>35 && k<100 %Between the 35th and 100th timestep apply predator
                IP=[P(i,1)-xP,P(i,2)-(yP)]; %Vector from fish i to predator %USED P(i,1)-15,P(i,2)-(-7)
                if sqrt(IP(1,1)^2+IP(1,2)^2)<8 %If distance between fish i and predator closer than 8 (detect range)
                    PREP=(1/sqrt(IP(1,1)^2+IP(1,2)^2))*IP; %Fish i will experience anti predator force
                    if s==1 %no speed difference
                        P(i,5)=10; %this value is used to set speed difference=1 in position update function below.
                    elseif s>1 %speed difference
                        P(i,5)=s; % Set speed difference to s
                    end
                else
                    if P(i,5)>=2 %If detected predator
                        PREP=(1/sqrt(IP(1,1)^2+IP(1,2)^2))*IP; %Move directly away from the predator
                    else
                        PREP=[0,0]; %If not detected the predator no predator force
                    end
                end
            elseif k<170 
                if P(i,5)>=2 %If detected predator
                    PREP=(1/sqrt(IP(1,1)^2+IP(1,2)^2))*IP; %Directly away from predato
                else
                    PREP=[0,0]; %If did not detect predator no impact
                end
            else %Reset evasion response in detector fish 
                P(i,5)=1; 
                PREP=[0,0]; 
            end

            %CALULATE NOISE AND CURRENT HEADING
            ERR=[randn,randn]; %Directional error vector
            err=(1/sqrt(ERR(1,1)^2+ERR(1,2)^2))*ERR; %Normalized directional error vector
            D=[P(i,3),P(i,4)]; %Previous heading
          
            %CALCULATE NEW HEADING
            if P(i,5)>=2 %If detected predator move directly away from it with some noise in heading
                if M==0 %If Attraction & Repulsion only model
                    Dir=5*PREP+d*D+c*CM+rr*REP+e*err;
                elseif M==1 %If Attraction & Repulsion & Alignment model
                    Dir=5*PREP+d*D+c*CM+rr*REP+a*AL+e*err;
                end
            elseif M==0 %If Attraction & Repulsion only model 
                Dir=d*D+c*CM+rr*REP+e*err; 
            elseif M==1 %If Attraction & Repulsion & Alignment model
                Dir=d*D+c*CM+rr*REP+a*AL+e*err;
            end
                
            PP(i,5)=P(i,5); % Store speed difference
                     
            %NORMALIZE NEW HEADING
            NormDir=(1/sqrt(Dir(1,1)^2+Dir(1,2)^2))*Dir; %Normalized direction of particle i                       
            
            %X & Y COMPONENTS OF NORMALIZED NEW HEADING
            PP(i,3)=NormDir(1,1);
            PP(i,4)=NormDir(1,2);
           
            %CACULATE NEW POSITION 
            if P(i,5)~=10 %If speed difference 
                PP(i,1)=P(i,1)+P(i,5)*delta*NormDir(1,1); %New x-coordinate
                PP(i,2)=P(i,2)+P(i,5)*delta*NormDir(1,2); %New y-coordinate 
            elseif P(i,5)==10 %If no speed difference
                PP(i,1)=P(i,1)+delta*NormDir(1,1); %New x-coordinate
                PP(i,2)=P(i,2)+delta*NormDir(1,2); %New y-coordinate 
            end
            
            %BOUNDARY CONDITIONS TO KEEP PARTICLES IN THE ARENA. IF CALCULATED 'NEW POSITION' IS OUTSIDE
            %THE ARENA PARTICLE WILL ADOPT A HEADING THAT DEVIATES AS
            %LITTLE AS POSSIBLE FROM 'NEW HEADING' BUT KEEPS IT IN THE
            %ARENA (SLIP-BOUNDARY CONDITIONS).
            
            %Outer wall
            if sqrt(PP(i,1)^2+PP(i,2)^2)>RA-1.5*delta
                tt=atan2(NormDir(1,2),NormDir(1,1));
                ttt=tt;
                w=1;
                while sqrt(PP(i,1)^2+PP(i,2)^2)>RA-1.5*delta
                    if mod(w,2)==1
                        PP(i,1)=P(i,1)+delta*cos(tt); %New x-coordinate
                        PP(i,2)=P(i,2)+delta*sin(tt); %New y-coordinate
                        tt=tt+0.001;
                        w=w+1;
                        PP(i,3)=cos(tt);
                        PP(i,4)=sin(tt);
                    else
                        PP(i,1)=P(i,1)+delta*cos(ttt); %New x-coordinate
                        PP(i,2)=P(i,2)+delta*sin(ttt); %New y-coordinate
                        ttt=ttt-0.001;
                        w=w+1;
                        PP(i,3)=cos(ttt);
                        PP(i,4)=sin(ttt);
                    end 
                end
            end
            
            %Inner wall
            if sqrt(PP(i,1)^2+PP(i,2)^2)<RB+1.5*delta
                tt=atan2(NormDir(1,2),NormDir(1,1));
                ttt=tt;
                w=1;
                while sqrt(PP(i,1)^2+PP(i,2)^2)<RB+1.5*delta
                    if mod(w,2)==1
                        PP(i,1)=P(i,1)+delta*cos(tt); %New x-coordinate
                        PP(i,2)=P(i,2)+delta*sin(tt); %New y-coordinate
                        tt=tt+0.001;
                        w=w+1;
                        PP(i,3)=cos(tt);
                        PP(i,4)=sin(tt);
                    else
                        PP(i,1)=P(i,1)+delta*cos(ttt); %New x-coordinate
                        PP(i,2)=P(i,2)+delta*sin(ttt); %New y-coordinate
                        ttt=ttt-0.001;
                        w=w+1;
                        PP(i,3)=cos(ttt);
                        PP(i,4)=sin(ttt);
                    end 
                end
            end
            
%             if F==2 %If simulation for Figure 2 store fish i coordinates
%                 XT=X{i,1};
%                 X{i,1}=[XT;PP(i,:)];
%             end
 
        end
% 
%         if F==3 %If for Figure 3 calcuate the instantaneous alignment \phi
%             theta=atan2(P(:,2),P(:,1));
%             alpha=atan2(P(:,4),P(:,3));
%             chi=asin(sin(theta-alpha));
%             phi=(2/(N*pi))*sum(chi);
%             PHI=[PHI,phi];
%         end
        
      

        
      %-----------Plotting-------------------      
      if mod(k,10)==0  
      hold off
        plot(P(:,1),P(:,2),'k.','markersize',10);
        hold on
        for r=1:N
            plot([P(r,1),P(r,1)+P(r,3)],[P(r,2),P(r,2)+P(r,4)],'r-');
        end    
        hold on
        plot(RA*cos(0:0.1:2*pi),RA*sin(0:0.1:2*pi),'-r');
        plot(RB*cos(0:0.1:2*pi),RB*sin(0:0.1:2*pi),'-r');
        
           if k>35 && k<100
               plot(xP,yP,'*r');
               for i=1:N 
                   IP=[P(i,1)-xP,P(i,2)-(yP)];
                   if sqrt(IP(1,1)^2+IP(1,2)^2)<8
                       plot(P(i,1),P(i,2),'.g');
                       hold on
                   end
               end
           end

        xlabel('X position')
        ylabel('Y position')
        axis manual
        axis([-RA RA -RA RA]);    
        U(kk)=getframe;
        kk=kk+1;
      end
        
        P=PP; %Update Population matrix P
end

% Return X if sim for Figure 2, return PHI if sim for Figure 3
% if F==2
%     Y=X;
% elseif F==3
%     Y=PHI;
% end

    

    
    
    
  








    
   