function X=mkFig2
%Function to create Figure 2 from angular distance data from simulations
% with Att+Rep & Delta=1 (Xs1), Att+Rep & Delta=4 (Xs4), Att+Rep+Align &
% Delta=1 (XAs1), Att+Rep+Align & Delta=4 (XAs4).

load Xs1
load Xs4
load XAs1
load XAs4

sX=size(Xs1,1); %number fish

%FIGURE 1 (Distance from predator with time)
DXs1=plotW(Xs1);
DXs4=plotW(Xs4);

DXAs1=plotW(XAs1);
DXAs4=plotW(XAs4);


figure;
subplot(2,2,1)
D=DXs1;
for i=1:sX
plot(D(:,i),1:size(D,1))
hold on 
end
plot(8*ones(1,201),0:1:200,'-k')
plot(0:1:50,35*ones(1,51),'-k')
hold off
ylabel('Time (t)')
set(gca, 'YDir','reverse')
xlim([0 50])
ylim([0 175])

subplot(2,2,2)
D=DXs4;
for i=1:sX
plot(D(:,i),1:size(D,1))
hold on 
end
plot(8*ones(1,201),0:1:200,'-k')
plot(0:1:50,35*ones(1,51),'-k')
hold off
set(gca, 'YDir','reverse')
xlim([0 50])
ylim([0 175])


subplot(2,2,3)
D=DXAs1;
for i=1:sX
plot(D(:,i),1:size(D,1))
hold on 
end
plot(8*ones(1,201),0:1:200,'-k')
plot(0:1:50,35*ones(1,51),'-k')
hold off
ylabel('Time (t)')
xlabel('Distance from predator')
set(gca, 'YDir','reverse')
xlim([0 50])
ylim([0 175])

subplot(2,2,4)
D=DXAs4;
for i=1:sX
plot(D(:,i),1:size(D,1))
hold on
end
plot(8*ones(1,201),0:1:200,'-k')
plot(0:1:50,35*ones(1,51),'-k')
hold off
xlabel('Distance from predator')
set(gca, 'YDir','reverse')
xlim([0 50])
ylim([0 175])