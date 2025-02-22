%% figure 1 stimulus-responsive Neurons
load Figure1

ch={'AM','EC','HI','PIC'};
for d=1:4
 figure
 subplot(2,1,1)
 plot_raster(spikes{d},-500:2500,[0 0.4470 0.7410]);
 xlim([-200,2000])
 title(ch(d))
 
 [ys,x]=convolve_spikes(spikes{d});
subplot(4,1,3)
y=mean(ys);
SEM = std(ys)/sqrt(size(ys,1));
plot_instantaneousFR(x,y,SEM,'b');
xlim([-0.2,2])

subplot(4,2,7)
density_plot(spk{d});
end