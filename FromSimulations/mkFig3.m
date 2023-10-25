function W=mkFig3

%Function to create Figure 3, Figure S1, Figure S2, and Table 1 from data
%in ARC (cell array containing all simulations from the Att+Rep simulations) 
%and AC (cell array containing all simulations from the Att+Rep-Align simulations)
%Table 1 is the output printed in the command window.

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

% MAKE TABLE 1

AR1=AR{1,1};
AR2=AR{1,2};
AR3=AR{1,3};
AR4=AR{1,4};

A1=A{1,1};
A2=A{1,2};
A3=A{1,3};
A4=A{1,4};

     th=-0.75;
    
    X=AR1;
    size(X)
    n1=sum(min(X')'<th);
    X=AR2;
    n2=sum(min(X')'<th);
    X=AR3;
    n3=sum(min(X')'<th);
    X=AR4;
    n4=sum(min(X')'<th);
    
    X=A1;
    n5=sum(min(X')'<th);
    X=A2;
    n6=sum(min(X')'<th);
    X=A3;
    n7=sum(min(X')'<th);
    X=A4;
    n8=sum(min(X')'<th);
    
    W=(1/size(X,1))*[n1,n2,n3,n4;n5,n6,n7,n8];
    
    
%MAKE FIGURE S2
figure;
t=170;
ne=size(X,1);

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
