%% figure2 odor-associated units
load figure2

for d=1:3
    
    spikes1=spikes{d}.spikesOdor;
    spikes2=spikes{d}.spikesNonOdor;
    spk=spikes{d}.spk;
    
    figure
    subplot(2,1,1)
    plot_raster(spikes1,-500:2000,[0 0.4470 0.7410]); %NonOdor
    hold on
    plot_raster(spikes2,-500:2000,[0 0.7410 0.4470]); %Odor
    hold off
    xlim([-200,2000])
    title('AM')
    
    [ys,x]=convolve_spikes(spikes1(1:100));
    subplot(4,1,3)
    y=mean(ys);
    SEM = std(ys)/sqrt(size(ys,1));
    plot_instantaneousFR(x,y,SEM,0);
    hold on
    [ys,x]=convolve_spikes(spikes2(101:200));
    y=mean(ys);
    SEM = std(ys)/sqrt(size(ys,1));
    plot_instantaneousFRgreen(x,y,SEM,0);
    hold off
    xlim([-0.2,2])
    ylim([0,6])
    legend('Control','','','Odor')
    
    subplot(4,2,7)
    density_plot_paper(spk);
end