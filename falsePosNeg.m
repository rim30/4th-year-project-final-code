function [falseneg falsepos]=falsePosNeg(avgpred,stest,class,thereshold,noclasses)
%compute false positives and false negatives

falseneg=sum(avgpred(stest(class-1)+1:stest(class))<thereshold);
falseneg=falseneg/(stest(class)-stest(class-1));

% falsepos=sum(avgpred(stest(class)+1:stest(20))<thereshold);
% falsepos=falsepos+sum(avgpred(1:stest(class-1))<thereshold);
% falsepos=1-falsepos/((stest(20)-stest(class))+(stest(class-1)));

falsepos=sum(avgpred(stest(class)+1:stest(noclasses))>thereshold);
falsepos=falsepos+sum(avgpred(1:stest(class-1))>thereshold);
falsepos=falsepos/((stest(noclasses)-stest(class))+(stest(class-1)));

% 
% falseneg=0;
% falsepos=0;
% for k=stest(class-1)+1:stest(class)
%     if (avgpred(k)==0)    
%         falseneg=falseneg+1;
%     end
% end
% falseneg=falseneg/(stest(class)-stest(class-1)-1);
% for k=stest(class)+1:stest(20)
%     if (avgpred(k)==1)    
%         falsepos=falsepos+1;
%     end
% end
% for k=1:stest(class-1)
%     if (avgpred(k)==1)    
%         falsepos=falsepos+1;
%     end
% end
% falsepos=falsepos/((stest(20)-stest(class)-1)+(stest(class-1)));
end