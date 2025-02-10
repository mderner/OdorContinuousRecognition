%% pos und neg unterscheiden
load Fig2_ensemble
odor=odor(:,301:2500);
nonOdor=nonOdor(:,301:2500);
[~,p,~,s]=ttest(odor,nonOdor);
sigs=find(p<=0.05); % 530ms-655ms;1239ms-1483ms; (p=0.0092 (t=618.3664))
idx=find(diff(sigs)~=1);
idx=[0,idx,length(sigs)];
c=zeros(length(idx)-1,2);
cluster_ensemble=zeros(length(idx)-1,1);
pos=[];
neg=[];
for clust=1:length(idx)-1
    c(clust,:)=[sigs(idx(clust)+1),sigs(idx(clust+1))];
    check=sum(s.tstat(c(clust,1):c(clust,2))>0);
    if check==length(c(clust,1):c(clust,2))
        pos(end+1)=abs(sum(s.tstat(c(clust,1):c(clust,2))));
    elseif check==0
        neg(end+1)=abs(sum(s.tstat(c(clust,1):c(clust,2))));
    else
        dat=s.tstat(c(clust,1):c(clust,2));
        for l=1:length(dat)
            try
            ipos=find(dat>0,1);
            ineg=find(dat<0,1);
            if ipos==1
                if ineg>1
                pos(end+1)=abs(sum(dat(1:ineg-1)));
                dat=dat(ineg:end);
                else
                 pos(end+1)=abs(sum(dat));   
                 dat=[];
                 break
                end
            else
                if ipos>1
                neg(end+1)=abs(sum(dat(1:ipos-1)));
                dat=dat(ipos:end);
                else
                    neg(end+1)=abs(sum(dat));
                    dat=[];
                    break
                end
            end
            catch
                break
            end
        end
        
    end
end
postrue=pos;
negtrue=neg; %p=0.0419 (t=259.2474) %p=0.0092 (t=618.3664)

all(1,:,:)=odor;
all(2,:,:)=nonOdor;
p_clust=zeros(1,1000);
posperm=[];
negperm=[];
for permutation=1:10000
r=round(rand(1,size(odor,1)))+1;
clear odor1 nonOdor1
for ra=1:57
    odor1(ra,:)=squeeze(all(r(ra),ra,:));
    nonOdor1(ra,:)=squeeze(all(-r(ra)+3,ra,:));
end
    clear c_t
[~,p,~,s]=ttest(odor1,nonOdor1);
sigs=find(p<=0.05);
idx=find(diff(sigs)~=1);
try
idx=[0,idx,length(sigs)];
c=zeros(length(idx)-1,2);
pos=[];
neg=[];
for clust=1:length(idx)-1
    c(clust,:)=[sigs(idx(clust)+1),sigs(idx(clust+1))];
    check=sum(s.tstat(c(clust,1):c(clust,2))>0);
    if check==length(c(clust,1):c(clust,2))
        pos(end+1)=abs(sum(s.tstat(c(clust,1):c(clust,2))));
    elseif check==0
        neg(end+1)=abs(sum(s.tstat(c(clust,1):c(clust,2))));
    else
        dat=s.tstat(c(clust,1):c(clust,2));
        for l=1:length(dat)
            try
            ipos=find(dat>0,1);
            ineg=find(dat<0,1);
            if ipos==1
                if ineg>1
                pos(end+1)=abs(sum(dat(1:ineg-1)));
                dat=dat(ineg:end);
                else
                 pos(end+1)=abs(sum(dat));   
                 dat=[];
                 break
                end
            else
                if ipos>1
                neg(end+1)=abs(sum(dat(1:ipos-1)));
                dat=dat(ipos:end);
                else
                    neg(end+1)=abs(sum(dat));
                    dat=[];
                    break
                end
            end
            catch
                break
            end
        end
        
    end
end
posperm(permutation)=max(pos);
negperm(permutation)=max(neg);

%p_clust(permutation)=max(c_t);
catch
end
end

s=sort(posperm);
s(9500) %620.4019
s(9750) %791.3294
s=sort(negperm);
s(9500) %200.4301
s(9750) %381.9181