function density_plot(spikes)
%%function density_plot(spikes)

lbound=floor(min(min(spikes)));  %Lowest point of the figure
ubound=ceil(max(max(spikes)));   %Highest point of the figure
numXbins=64;                     %Number of bins in horizontal direction (values per spike)

%Make the 2D histogram
ybins=linspace(lbound,ubound,150);  %Vector of bins in vertical direction
n=zeros(numXbins,length(ybins));    %Preallocate 2D histogram

%Bin count
for j=1:numXbins
    n(j,:)=hist(spikes(:,j),ybins);
end

% remove extreme outliers in order to keep color resolution
cutoff = 5*std(reshape(n,numel(n),1)); %magic cutoff for too high bin values
n(n>cutoff) = cutoff; %replace n with n without too high bin values
n=n/length(spikes)*100; %transform counts to percental values

%plot density
xvals = [-19:44]*1000/(2^15); %timestamps for spike

pcolor(xvals, ybins, n'); 
shading interp
xlabel('ms'); 
ylabel('\muV');
colorbar