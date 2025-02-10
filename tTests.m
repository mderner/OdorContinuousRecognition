%%t-tests
load zScores

testPre=ones(195,4);
testOdor=ones(195,4);
meanPre=zeros(195,4);
meanOdor=zeros(195,4);
meanNonOdor=zeros(195,4);

for unit=1:195
    meanPre(unit,:)=mean(scores{unit}(:,2:5));
    for w=1:4 %loop over four time windows
        try 
        [~,testPre(unit,w)]=ttest(scores{unit}(:,1),scores{unit}(:,w+1)); %paired t-tests prestimulus vs. poststimulus
        catch
        end
        try
        [~,testOdor(unit,w)]=ttest2(scores{unit}(1:100,w+1),scores{unit}(101:200,w+1)); %unpaired t-tests odor vs non-odor
         meanOdor(unit,w)=mean([scores{unit}(1:100,w+1)]);
         meanNonOdor(unit,w)=mean([scores{unit}(101:200,w+1)]);
        catch
        end
    end 
end
results.testPre=testPre;
results.testOdor=testOdor;
results.location=location;

channel={'A','HI','PHC','PIC','EC'};
for ch=1:5
    idx=strcmp(channel(ch),results.location);
    nPre(ch)=sum(sum(testPre(idx,:)<=0.0125,2)>0);sum(sum(testPre<=0.0125,2)>0);
    nOdor(ch)=sum(sum(testOdor(idx,:)<=0.0125,2)>0);
    binoPre(ch)=binocdf(sum(idx)-nPre(ch),sum(idx),0.95);
    binoOdor(ch)=binocdf(sum(idx)-nOdor(ch),sum(idx),0.95);
end