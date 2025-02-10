%% figure 2 preTests
load Figure1

for d=1:4
 figure
 subplot(2,1,1)
 plot_raster(spikes{d},-500:2500,[0 0.4470 0.7410]);
 xlim([-200,2000])
 title('AM')
 
 [ys,x]=convolve_spikes(spikes{d});
subplot(4,1,3)
y=mean(ys);
SEM = std(ys)/sqrt(size(ys,1));
plot_instantaneousFR(x,y,SEM,0);
xlim([-0.2,2])

subplot(4,2,7)
density_plot_paper(spk{d});
end