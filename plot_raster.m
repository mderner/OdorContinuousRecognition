function plot_raster(spikes, x, plot_colors)
%% function plot_raster(spikes, x, plot_colors)
% does a raster plot of spike-times
% spikes: cell array of vectors of spike-times
% per trial (e.g. spikes{trialnr} = [-199, 20, 25, 46...]
% x denotes the x-axis in time in milliseconds
% plot_colors: 1 by 3 array of rgb-color values

ntrials = length(spikes);

linewidth = 2.5;

disp_between = 1/ntrials;
line_height = (3/5)*disp_between;
hold on
a = 1;
for t=1:ntrials
    if ~isempty(spikes{t})
        %% plot the spikes
        for j=1:length(spikes{t})
            line([spikes{t}(j) spikes{t}(j)],[a a-line_height], 'color', plot_colors, 'LineWidth',linewidth);
        end   
    end
    a = a - disp_between;
end

xlim([x(1) x(end)]);
plot([0 0], [0 1], ':k');

box off
axis off

hold on;
