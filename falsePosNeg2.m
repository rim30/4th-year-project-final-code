function [falseneg falsepos]=falsePosNeg2(avgpred,stest,class,thereshold)
%compute false positives and false negatives

falseneg=sum(avgpred(stest(class-1)+1:stest(class))<thereshold);
falseneg=falseneg/(stest(class)-stest(class-1)-1);

falsepos=sum(avgpred(stest(class)+1:stest(19))<thereshold);
falsepos=falsepos+sum(avgpred(1:stest(class-1))<thereshold);
falsepos=1-falsepos/((stest(19)-stest(class)-1)+(stest(class-1)));
end