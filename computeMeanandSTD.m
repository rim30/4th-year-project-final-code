%build mean and std dev matrix for 5 features for reduced space matrix mA
%classsamples is no windows per class used for training
%classes is no people used
function [mu,stddev,normSTD]=computeMeanandSTD(nofeatures,classes,mA,classsamples)
% nofeatures=5; %no features kept after LDA
mu=zeros(classes,nofeatures);%matrix with means for all class, for each feature
stddev=zeros(classes,nofeatures);%matrix with std dev for all class, for each feature
genStdDev=zeros(classes,1); %vector with overall standard deviation over all features for each class
for i=1:classes
    mu(i,:)=mean(mA((i-1)*classsamples+1:i*classsamples,:));%compute mean for class i, feature j
    stddev(i,:)=std(mA((i-1)*classsamples+1:i*classsamples,:));%compute std dev for class i, feature j
    normSTD(i)=std(myNorm(mA((i-1)*classsamples+1:i*classsamples,:)-mu(i,:)));%compute overall std dev for class i
end
end


