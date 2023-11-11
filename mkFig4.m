function T=mkFig4

%Function to create Figure 4 and Table 1 from data
%in ARsC (cell array containing all simulations from the Att+Rep simulations) 
%and AsC (cell array containing all simulations from the Att+Rep-Align simulations)

load AsC
load ARsC

%TABLE 1
T=[mean(ARsC(:,1)),mean(ARsC(:,11)),mean(ARsC(:,21)),mean(ARsC(:,31));mean(AsC(:,1)),mean(AsC(:,11)),mean(AsC(:,21)),mean(AsC(:,31))];


%FIGURE 4
%Confidence interval calculations
X=AsC; %Att+Rep+Align
ci95=bootci(2000,@mean,X);  
Y=[ci95(1,:);mean(X);ci95(2,:)];
AsX=Y;

X=ARsC; %Att+Rep only
ci95=bootci(2000,@mean,X);  
Y=[ci95(1,:);mean(X);ci95(2,:)];
ARsX=Y;


t=1:31;
sF=5;
plot(t,smooth(ARsX(1,:),sF),'-k')
hold on
plot(t,smooth(ARsX(2,:),sF),'-g','LineWidth',2)
hold on
plot(t,smooth(ARsX(3,:),sF),'-k')
hold on
plot(t,smooth(AsX(1,:),sF),'-k')
hold on
plot(t,smooth(AsX(2,:),sF),'-r','LineWidth',2)
hold on
plot(t,smooth(AsX(3,:),sF),'-k')
hold on
ylim([0.6 1])
xlim([1 31])
xticks([1 6 11 16 21 26 31])
xticklabels({'1','1.5','2','2.5','3','3.5','4'})
xlabel('Speed difference (\Delta)')
ylabel('Proportion success')


