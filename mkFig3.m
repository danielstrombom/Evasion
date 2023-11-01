function W=mkFig3

%Function to create Figure 3, Figure S1, Figure S2, and Figure S3 from data
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


%MAKE FIGURE S1
figure;
subplot(2,1,1)
X=AR1;
sX1=size(X,2);
Y=median(X);
Y1=Y;
E=mad(X,1).*ones(1,size(X,2));
errorbar(1:size(X,2),Y,E,'-r');
hold on
plot(1:size(X,2),Y,'-r','LineWidth',2);
hold on
X=AR2;
sX1=size(X,2);
Y=median(X);
Y2=Y;
E=mad(X,1).*ones(1,size(X,2));
errorbar(1:size(X,2),Y,E,'-g');
hold on
plot(1:size(X,2),Y,'-g','LineWidth',2);
hold on
X=AR3;
sX1=size(X,2);
Y=median(X);
Y3=Y;
E=mad(X,1).*ones(1,size(X,2));
errorbar(1:size(X,2),Y,E,'-b');
hold on
plot(1:size(X,2),Y,'-b','LineWidth',2);
hold on
X=AR4;
sX1=size(X,2);
Y=median(X);
Y4=Y;
E=mad(X,1).*ones(1,size(X,2));
errorbar(1:size(X,2),Y,E,'-k');
hold on
plot(1:size(X,2),Y,'-k','LineWidth',2);
ylabel('Alignment (\phi)')
%xlabel('Time (t)')
%title('(II)')
ylim([-1 1])
xlim([0 170])
plot(35*ones(1,21),-1:0.1:1)


subplot(2,1,2)
X=A1;
sX1=size(X,2);
Y=median(X);
Y5=Y;
E=mad(X,1).*ones(1,size(X,2));
errorbar(1:size(X,2),Y,E,'-r');
hold on
plot(1:size(X,2),Y,'-r','LineWidth',2);
hold on
X=A2;
sX1=size(X,2);
Y=median(X);
Y6=Y;
E=mad(X,1).*ones(1,size(X,2));
errorbar(1:size(X,2),Y,E,'-g');
hold on
plot(1:size(X,2),Y,'-g','LineWidth',2);
hold on
X=A3;
sX1=size(X,2);
Y=median(X);
Y7=Y;
E=mad(X,1).*ones(1,size(X,2));
errorbar(1:size(X,2),Y,E,'-b');
hold on
plot(1:size(X,2),Y,'-b','LineWidth',2);
hold on
X=A4;
sX1=size(X,2);
Y=median(X);
Y8=Y;
E=mad(X,1).*ones(1,size(X,2));
errorbar(1:size(X,2),Y,E,'-k');
hold on
plot(1:size(X,2),Y,'-k','LineWidth',2);
ylabel('Alignment (\phi)')
xlabel('Time (t)')
%title('(II)')
ylim([-1 1])
xlim([0 170])
plot(35*ones(1,21),-1:0.1:1)


%MAKE FIGURE 3

sF=4;

figure;
plot(1:sX1,smooth(Y1,sF),'-r','LineWidth',2);
hold on
plot(1:sX1,smooth(Y2,sF),'-g','LineWidth',2);
hold on
plot(1:sX1,smooth(Y3,sF),'-b','LineWidth',2);
hold on
plot(1:sX1,smooth(Y4,sF),'-k','LineWidth',2);
hold on
plot(1:sX1,smooth(Y5,sF),'-.r','LineWidth',2);
hold on
plot(1:sX1,smooth(Y6,sF),'-.g','LineWidth',2);
hold on
plot(1:sX1,smooth(Y7,sF),'-.b','LineWidth',2);
hold on
plot(1:sX1,smooth(Y8,sF),'-.k','LineWidth',2);
ylabel('Alignment (\phi)')
ylim([-1 1])
xlim([0 170])
xlabel('Time (t)')
plot(35*ones(1,21),-1:0.1:1)
    
    
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

%MAKE FIGURE S3
X=AR1;
Y=[]; %
for t=1:170
    pd=fitdist(X(:,t),'Normal');
    ci95=paramci(pd);
    Y=[Y,[ci95(1,1);mean(X(:,t));ci95(2,1)]];
end
AR1C=Y;

X=AR2;
Y=[]; %
for t=1:170
    pd=fitdist(X(:,t),'Normal');
    ci95=paramci(pd);
    Y=[Y,[ci95(1,1);mean(X(:,t));ci95(2,1)]];
end
AR2C=Y;

X=AR3;
Y=[]; %
for t=1:170
    pd=fitdist(X(:,t),'Normal');
    ci95=paramci(pd);
    Y=[Y,[ci95(1,1);mean(X(:,t));ci95(2,1)]];
end
AR3C=Y;

X=AR4;
Y=[]; %
for t=1:170
    pd=fitdist(X(:,t),'Normal');
    ci95=paramci(pd);
    Y=[Y,[ci95(1,1);mean(X(:,t));ci95(2,1)]];
end
AR4C=Y;

X=A1;
Y=[]; %
for t=1:170
    pd=fitdist(X(:,t),'Normal');
    ci95=paramci(pd);
    Y=[Y,[ci95(1,1);mean(X(:,t));ci95(2,1)]];
end
A1C=Y;

X=A2;
Y=[]; %
for t=1:170
    pd=fitdist(X(:,t),'Normal');
    ci95=paramci(pd);
    Y=[Y,[ci95(1,1);mean(X(:,t));ci95(2,1)]];
end
A2C=Y;

X=A3;
Y=[]; %
for t=1:170
    pd=fitdist(X(:,t),'Normal');
    ci95=paramci(pd);
    Y=[Y,[ci95(1,1);mean(X(:,t));ci95(2,1)]];
end
A3C=Y;

X=A4;
Y=[]; %
for t=1:170
    pd=fitdist(X(:,t),'Normal');
    ci95=paramci(pd);
    Y=[Y,[ci95(1,1);mean(X(:,t));ci95(2,1)]];
end
A4C=Y;

figure;
plot(1:170,AR1C(1,:),'-k')
hold on
plot(1:170,smooth(AR1C(2,:),4),'-r','LineWidth',2)
hold on
plot(1:170,AR1C(3,:),'-k')
hold on
plot(1:170,AR2C(1,:),'-k')
hold on
plot(1:170,AR2C(2,:),'-g','LineWidth',2)
hold on
plot(1:170,AR2C(3,:),'-k')
hold on
plot(1:170,AR3C(1,:),'-k')
hold on
plot(1:170,AR3C(2,:),'-b','LineWidth',2)
hold on
plot(1:170,AR3C(3,:),'-k')
hold on
plot(1:170,AR4C(1,:),'-k')
hold on
plot(1:170,AR4C(2,:),'-k','LineWidth',2)
hold on
plot(1:170,AR4C(3,:),'-k')
hold on
plot(1:170,A1C(1,:),'-k')
hold on
plot(1:170,A1C(2,:),'-.r','LineWidth',2)
hold on
plot(1:170,A1C(3,:),'-k')
hold on
plot(1:170,A2C(1,:),'-k')
hold on
plot(1:170,A2C(2,:),'-.g','LineWidth',2)
hold on
plot(1:170,A2C(3,:),'-k')
hold on
plot(1:170,A3C(1,:),'-k')
hold on
plot(1:170,A3C(2,:),'-.b','LineWidth',2)
hold on
plot(1:170,A3C(3,:),'-k')
hold on
plot(1:170,A4C(1,:),'-k')
hold on
plot(1:170,A4C(2,:),'-.k','LineWidth',2)
hold on
plot(1:170,A4C(3,:),'-k')
xlim([0 170])


