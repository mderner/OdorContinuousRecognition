function plot_instantaneousFR(x,m,SEM,color)
 %% plot instantaneous firing rate 
 % x= timeline in ms 
 % m=mean of data 
 % SEM=standard error of the mean of data
 % color= 'b' (blue, default) or 'g' (green)

 switch color
     case 'g'
         c=[0 0.7470 0.4410]; % green
     case 'b'
         c=[0 0.4470 0.7410]; % blue
     otherwise
         c=[0 0.4470 0.7410]; % default color blue
 end
 
 %plot mean instantaneous firing rate +- s.e.m.
curve1 = m + SEM;
curve2 = m - SEM;
x2 = [x, fliplr(x)];
inBetween = [curve1, fliplr(curve2)];
fill(x2, inBetween, c, 'LineStyle','none');
alpha(.5)
hold on;
plot(x, m, 'Color', c, 'LineWidth', 2);
box off

% add line for stimulus onset
y1=ylim;
plot([0,0],[-0.1,y1(2)+5],'--','Color',[0.4660 0.6740 0.1880]);
ylim(y1);
xlabel('ms')
ylabel('Hz (mean +/- s.e.m.')
hold off
end