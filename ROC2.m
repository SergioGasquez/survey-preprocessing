clear all
close all
% LBP
fileLBP = fopen('Results/LBPResult.txt','r');
formatSpec = '%d %f';
LBP = fscanf(fileLBP,formatSpec);
% ASSR
fileASSR = fopen('Results/ASSRResult.txt','r');
formatSpec = '%d %f';
ASSR = fscanf(fileASSR,formatSpec);
% DoG
fileDoG = fopen('Results/DoGResult.txt','r');
formatSpec = '%d %f';
DoG = fscanf(fileDoG,formatSpec);
% HE
fileHE = fopen('Results/HEResult.txt','r');
formatSpec = '%d %f';
HE = fscanf(fileHE,formatSpec);
% HOMO
fileHOMO = fopen('Results/HOMOResult.txt','r');
formatSpec = '%d %f';
HOMO = fscanf(fileHOMO,formatSpec);
% IS
fileIS = fopen('Results/ISResult.txt','r');
formatSpec = '%d %f';
IS = fscanf(fileIS,formatSpec);
% LoG
fileLoG = fopen('Results/LoG1Result.txt','r');
formatSpec = '%d %f';
LoG = fscanf(fileLoG,formatSpec);
% SSQI
fileSSQI = fopen('Results/SSQIResult.txt','r');
formatSpec = '%d %f';
SSQI = fscanf(fileSSQI,formatSpec);
% WF
fileWF = fopen('Results/WFResult.txt','r');
formatSpec = '%d %f';
WF = fscanf(fileWF,formatSpec);


a=1;
b=1;
for i=1:2000
    if (mod(i,2)==0)
        ScoresLBP(a)=LBP(i);
        ScoresASSR(a)=ASSR(i);
        ScoresDoG(a)=DoG(i);
        ScoresHE(a)=HE(i);
        ScoresHOMO(a)=HOMO(i);
        ScoresIS(a)=IS(i);
        ScoresLoG(a)=LoG(i);
        ScoresSSQI(a)=SSQI(i);
        ScoresWF(a)=WF(i);

        a=a+1;
    else
        LabelsLBP(b)=LBP(i);
        LabelsASSR(b)=ASSR(i);
        LabelsDoG(b)=DoG(i);
        LabelsHE(b)=HE(i);
        LabelsHOMO(b)=HOMO(i);
        LabelsIS(b)=IS(i);
        LabelsLoG(b)=LoG(i);
        LabelsSSQI(b)=SSQI(i);
        LabelsWF(b)=WF(i);

        b=b+1;
    end
end
eerX=linspace(0,1,100);
eerY=linspace(1,0,100);

[XLBP,YLBP,T,AUC_LBP]=perfcurve(LabelsLBP,-ScoresLBP,'1');
[XASSR,YASSR,T,AUC_ASSR]=perfcurve(LabelsASSR,-ScoresASSR,'1');
[XDoG,YDoG,T,AUC_DoG]=perfcurve(LabelsDoG,ScoresDoG,'1');
[XHE,YHE,T,AUC_HE]=perfcurve(LabelsHE,-ScoresHE,'1');
[XHOMO,YHOMO,T,AUC_HOMO]=perfcurve(LabelsHOMO,ScoresHOMO,'1');
[XIS,YIS,T,AUC_IS]=perfcurve(LabelsIS,-ScoresIS,'1');
[XLoG,YLoG,T,AUC_LoG]=perfcurve(LabelsLoG,ScoresLoG,'1');
[XSSQI,YSSQI,T,AUC_SSQI]=perfcurve(LabelsSSQI,-ScoresSSQI,'1');
[XWF,YWF,T,AUC_WF]=perfcurve(LabelsWF,-ScoresWF,'1');

%%    
plot(XLBP,YLBP)
xlabel('False Positive Rate')
ylabel('True Positive Rate')
grid on
hold on
plot(XASSR,YASSR,'--','LineWidth',2)
hold on
 plot(XDoG,YDoG,'LineWidth',2)
hold on
plot(XHE,YHE,'LineWidth',2)
hold on
plot(XHOMO,YHOMO,'--','LineWidth',2)
hold on
plot(XIS,YIS,'--','LineWidth',2)
hold on
plot(XLoG,YLoG,'LineWidth',2)
hold on
plot(XSSQI,YSSQI,'--','LineWidth',2)
hold on
plot(XWF,YWF,'--','LineWidth',2)
legend('LBP','ASSR','DoG','HE','HOMO','IS','LoG','SSQI','WF')
hold on
%plot(eerX,eerY)


%%
minHE=100;
for i=1:length(XLBP)
    auxHE=abs((1-YHE(i))-XHE(i));
    if(auxHE<minHE)
        minHE=auxHE;
        posHE=i;
    end
end
EER_HE=XHE(posHE);

minDoG=100;
for i=1:length(XLBP)
    auxDoG=abs((1-YDoG(i))-XDoG(i));
    if(auxDoG<minDoG)
        minDoG=auxDoG;
        posDoG=i;
    end
end
EER_DoG=XDoG(posDoG);

minSSQI=100;
for i=1:length(XLBP)
    auxSSQI=abs((1-YSSQI(i))-XSSQI(i));
    if(auxSSQI<minSSQI)
        minSSQI=auxSSQI;
        posSSQI=i;
    end
end
EER_SSQI=XSSQI(posSSQI);

minLBP=100;
for i=1:length(XLBP)
    auxLBP=abs((1-YLBP(i))-XLBP(i));
    if(auxLBP<minLBP)
        minLBP=auxLBP;
        posLBP=i;
    end
end
EER_LBP=XLBP(posLBP);

minASSR=100;
for i=1:length(XLBP)
    auxASSR=abs((1-YASSR(i))-XASSR(i));
    if(auxASSR<minASSR)
        minASSR=auxASSR;
        posASSR=i;
    end
end
EER_ASSR=XASSR(posASSR);

minLoG=100;
for i=1:length(XLBP)
    auxLoG=abs((1-YLoG(i))-XLoG(i));
    if(auxLoG<minLoG)
        minLoG=auxLoG;
        posLoG=i;
    end
end
EER_LoG=XLoG(posLoG);

minIS=100;
for i=1:length(XLBP)
    auxIS=abs((1-YIS(i))-XIS(i));
    if(auxIS<minIS)
        minIS=auxIS;
        posIS=i;
    end
end
EER_IS=XIS(posIS);

minHOMO=100;
for i=1:length(XLBP)
    auxHOMO=abs((1-YHOMO(i))-XHOMO(i));
    if(auxHOMO<minHOMO)
        minHOMO=auxHOMO;
        posHOMO=i;
    end
end
EER_HOMO=XHOMO(posHOMO);

minWF=100;
for i=1:length(XLBP)
    auxWF=abs((1-YWF(i))-XWF(i));
    if(auxWF<minWF)
        minWF=auxWF;
        posWF=i;
    end
end
EER_WF=XWF(posWF);
%%
t_ASSR = 25.9794;
t_SSQI=7.5330;
t_IS=37.6993;
t_WF=3.4942;
t_HOMO=2.2562;
t_LBP=57.452486753463745;
t_HE=0.0691835880279541;
t_LoG=0.16619038581848145;
t_DoG=0.05213594436645508;
figure(2)
scatter(EER_LBP,t_LBP)
xlabel('EER')
ylabel('Time(s)')
grid on
hold on
scatter(EER_ASSR,t_ASSR)
hold on
scatter(EER_DoG,t_DoG)
hold on
scatter(EER_HE,t_HE)
hold on
scatter(EER_HOMO,t_HOMO,'filled')
hold on
scatter(EER_IS,t_IS,'filled')
hold on
scatter(EER_LoG,t_LoG,'filled')
hold on
scatter(EER_SSQI,t_SSQI,'filled')
hold on
scatter(EER_WF,t_WF,'filled')
legend('LBP','ASSR','DoG','HE','HOMO','IS','LoG','SSQI','WF')


