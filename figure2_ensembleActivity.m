%% figure1 Ensemble Activity A zScores
load Fig2_ensemble
addpath('D:\OdorContinuousRecognition\func')
x=-0.5:0.001:2.5;
figure
plot_instantaneousFR(x,mean(odor,1),std(odor)/sqrt(size(odor,1)),0);
hold on
plot_instantaneousFRgreen(x,mean(nonOdor,1),std(nonOdor)/sqrt(size(nonOdor,1)),0);
hold off
title('AM')
xlim([-0.2,2])
ylim([-0.1,0.2])
legend('Control','','','Odor')
ylabel('zScores')