%build mean and std dev matrix for n features for reduced space matrix mA
%classsamples is matrix with no windows per class used for training
%classes is no people used
function [mu,stddev,normSTD]=MAndSTD(nofeatures,classes,mA,classWindows)
mu=zeros(classes,nofeatures);%matrix with means for all class, for each feature
stddev=zeros(classes,nofeatures);%matrix with std dev for all class, for each feature
genStdDev=zeros(classes,1); %vector with overall standard deviation over all features for each class
% for i=1:classes
%     mu(i,:)=mean(mA((i-1)*classWindows+1:i*classWindows,:));%compute mean for class i, feature j
%     stddev(i,:)=std(mA((i-1)*classWindows+1:i*classWindows,:));%compute std dev for class i, feature j
%     normSTD(i)=std(myNorm(mA((i-1)*classWindows+1:i*classWindows,:)-mu(i,:)));%compute overall std dev for class i
% end
w=classWindows;
ww=zeros(size(w));
ww(1)=w(1);
for i=2:classes
    ww(i)=ww(i-1)+w(i);
end
mu(1,:)=mean(mA(1:ww(1),:));
stddev(1,:)=std(mA(1:ww(1),:));
normSTD(1)=std(myNorm(mA(1:ww(1),:)-mu(1,:)));
for i=2:classes
    mu(i,:)=mean(mA(ww(i-1):ww(i),:));%compute mean for class i, feature j
    stddev(i,:)=std(mA(ww(i-1):ww(i),:));%compute std dev for class i, feature j
    normSTD(i)=std(myNorm(mA(ww(i-1):ww(i),:)-mu(i,:)));%compute overall std dev for class i
end


end
