function [falsepos,falseneg] = evl(xtrain,ytrain,xtest,ytest)
SVMModel = fitcsvm(xtrain,ytrain,'Standardize',true,'KernelFunction','RBF','KernelScale','auto');
predictions=predict(SVMModel,xtest);
%robustpred=predictions.*circshift(predictions,-1).*circshift(predictions,-2).*circshift(predictions,-3).*circshift(predictions,-4);
robustpred=filter(ones(1,1),1,predictions);
robustpred=heaviside(robustpred-0.99);
falsepos=sum(robustpred-ytest>0)/length(ytest);
falseneg=sum(robustpred-ytest<0)/length(ytest);
[falseneg,falsepos]
end