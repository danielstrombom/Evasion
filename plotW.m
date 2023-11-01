function D=plotW(X)

%load XA

%X=XA;
sX=size(X,1); %number fish

u=[17,-7,0]; %Predator location
D=[]; %collect distances
for i=1:sX
    Y=X{i,1};
    aI=[];
    dI=[];
    for k=1:size(Y,1)
        v=[Y(k,1:2),0];
        r=sqrt(Y(k,1)^2+Y(k,2)^2);
        
      %  aI=[aI;atan2(norm(cross(u,v)),dot(u,v))];
        dI=[dI;r*atan2(norm(cross(u,v)),dot(u,v))];
    end
    D=[D,dI];
    X{i,1}=[Y,aI,dI];
end
% for i=1:sX
% plot(1:size(D,1),D(:,i))
% hold on
% end