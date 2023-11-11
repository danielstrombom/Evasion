function W=mkFig3

%Function to create Figure 3, Figure S1 and Figure S2 from data
%in ARC (cell array containing all simulations from the Att+Rep simulations) 
%and AC (cell array containing all simulations from the Att+Rep-Align simulations)

load ARC
load AC

AR=ARC;
A=AC;

AR1=AR{1,1};
AR2=AR{1,2};
AR3=AR{1,3};
AR4=AR{1,4};

A1=A{1,1};
A2=A{1,2};
A3=A{1,3};
A4=A{1,4};

%MAKE FIGURE S2
figure;
t=170;
ne=1450;

subplot(2,4,1)
X=AR1(1:ne,:);
plot(1:t,X)
hold on
plot(1:t,median(X),'-r','LineWidth',3)
    ylim([-1 1])
    xlim([0 170])
    title('Att+Rep with \Delta=1')
     ylabel('Instantaneous alignment (\phi)')
    xlabel('Time (t)')
    
subplot(2,4,2)
X=AR2(1:ne,:);
plot(1:t,X)
hold on
plot(1:t,median(X),'-g','LineWidth',3)
    ylim([-1 1])
    xlim([0 170])
title('Att+Rep with \Delta=2')
% ylabel('Instantaneous alignment (\phi)')
    xlabel('Time (t)')

subplot(2,4,3)
X=AR3(1:ne,:);
plot(1:t,X)
hold on
plot(1:t,median(X),'-b','LineWidth',3)
    ylim([-1 1])
    xlim([0 170])
title('Att+Rep with \Delta=3')
% ylabel('Instantaneous alignment (\phi)')
    xlabel('Time (t)')

subplot(2,4,4)
X=AR4(1:ne,:);
plot(1:t,X)
hold on
plot(1:t,median(X),'-k','LineWidth',3)
    ylim([-1 1])
    xlim([0 170])
title('Att+Rep with \Delta=4')
% ylabel('Instantaneous alignment (\phi)')
    xlabel('Time (t)')


subplot(2,4,5)
X=A1(1:ne,:);
plot(1:t,X)
hold on
plot(1:t,median(X),'-.r','LineWidth',3)
    ylim([-1 1])
    xlim([0 170])
    title('Att+Rep+Align with \Delta=1')
    ylabel('Instantaneous alignment (\phi)')
    xlabel('Time (t)')
    
subplot(2,4,6)
X=A2(1:ne,:);
plot(1:t,X)
hold on
plot(1:t,median(X),'-.g','LineWidth',3)
    ylim([-1 1])
    xlim([0 170])
title('Att+Rep+Align with \Delta=2')
% ylabel('Instantaneous alignment (\phi)')
    xlabel('Time (t)')

subplot(2,4,7)
X=A3(1:ne,:);
plot(1:t,X)
hold on
plot(1:t,median(X),'-.b','LineWidth',3)
    ylim([-1 1])
    xlim([0 170])
title('Att+Rep+Align with \Delta=3')
% ylabel('Instantaneous alignment (\phi)')
    xlabel('Time (t)')

subplot(2,4,8)
X=A4(1:ne,:);
plot(1:t,X)
hold on
plot(1:t,median(X),'-.k','LineWidth',3)
    ylim([-1 1])
    xlim([0 170])
title('Att+Rep+Align with \Delta=4')
% ylabel('Instantaneous alignment (\phi)')
    xlabel('Time (t)')

sF=4;

%MAKE FIGURE S1
X=AR1;
ci95=bootci(2000,@mean,X);  
Y=[ci95(1,:);mean(X);ci95(2,:)];
AR1C=Y;

X=AR2;
ci95=bootci(2000,@mean,X);  
Y=[ci95(1,:);mean(X);ci95(2,:)];
AR2C=Y;

X=AR3;
ci95=bootci(2000,@mean,X);  
Y=[ci95(1,:);mean(X);ci95(2,:)];
AR3C=Y;

X=AR4;
ci95=bootci(2000,@mean,X);  
Y=[ci95(1,:);mean(X);ci95(2,:)];
AR4C=Y;

X=A1;
ci95=bootci(2000,@mean,X);  
Y=[ci95(1,:);mean(X);ci95(2,:)];
A1C=Y;

X=A2;
ci95=bootci(2000,@mean,X);  
Y=[ci95(1,:);mean(X);ci95(2,:)];
A2C=Y;

X=A3;
ci95=bootci(2000,@mean,X);  
Y=[ci95(1,:);mean(X);ci95(2,:)];
A3C=Y;

X=A4;
ci95=bootci(2000,@mean,X);  
Y=[ci95(1,:);mean(X);ci95(2,:)];
A4C=Y;

figure;
plot(1:170,smooth(AR1C(2,:),sF),'-r','LineWidth',2)
hold on
plot(1:170,smooth(AR1C(1,:),sF),'-k')
hold on
plot(1:170,smooth(AR1C(3,:),sF),'-k')
hold on
plot(1:170,smooth(AR2C(1,:),sF),'-k')
hold on
plot(1:170,smooth(AR2C(2,:),sF),'-g','LineWidth',2)
hold on
plot(1:170,smooth(AR2C(3,:),sF),'-k')
hold on
plot(1:170,smooth(AR3C(1,:),sF),'-k')
hold on
plot(1:170,smooth(AR3C(2,:),sF),'-b','LineWidth',2)
hold on
plot(1:170,smooth(AR3C(3,:),sF),'-k')
hold on
plot(1:170,smooth(AR4C(1,:),sF),'-k')
hold on
plot(1:170,smooth(AR4C(2,:),sF),'-k','LineWidth',2)
hold on
plot(1:170,smooth(AR4C(3,:),sF),'-k')
hold on
plot(1:170,smooth(A1C(1,:),sF),'-k')
hold on
plot(1:170,smooth(A1C(2,:),sF),'-.r','LineWidth',2)
hold on
plot(1:170,smooth(A1C(3,:),sF),'-k')
hold on
plot(1:170,smooth(A2C(1,:),sF),'-k')
hold on
plot(1:170,smooth(A2C(2,:),sF),'-.g','LineWidth',2)
hold on
plot(1:170,smooth(A2C(3,:),sF),'-k')
hold on
plot(1:170,smooth(A3C(1,:),sF),'-k')
hold on
plot(1:170,smooth(A3C(2,:),sF),'-.b','LineWidth',2)
hold on
plot(1:170,smooth(A3C(3,:),sF),'-k')
hold on
plot(1:170,smooth(A4C(1,:),sF),'-k')
hold on
plot(1:170,smooth(A4C(2,:),sF),'-.k','LineWidth',2)
hold on
plot(1:170,smooth(A4C(3,:),sF),'-k')
xlim([0 170])

%MAKE FIGURE 3

sX1=size(AR1,2);

figure;
plot(1:sX1,smooth(median(AR1),sF),'-r','LineWidth',2);
hold on
plot(1:sX1,smooth(median(AR2),sF),'-g','LineWidth',2);
hold on
plot(1:sX1,smooth(median(AR3),sF),'-b','LineWidth',2);
hold on
plot(1:sX1,smooth(median(AR4),sF),'-k','LineWidth',2);
hold on
plot(1:sX1,smooth(median(A1),sF),'-.r','LineWidth',2);
hold on
plot(1:sX1,smooth(median(A2),sF),'-.g','LineWidth',2);
hold on
plot(1:sX1,smooth(median(A3),sF),'-.b','LineWidth',2);
hold on
plot(1:sX1,smooth(median(A4),sF),'-.k','LineWidth',2);
ylabel('Alignment (\phi)')
ylim([-1 1])
xlim([0 170])
xlabel('Time (t)')
plot(35*ones(1,21),-1:0.1:1)


