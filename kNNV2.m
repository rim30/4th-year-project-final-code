function [label,score,cost,correct,correct2,totalAccepted,percentageAccepted,correctBatch,totalBatch]=kNNV2(noclasses,Y,Mdl,class,mu,stddev,threshold,normSTD)
%noclasses= number of classes to classify
%Y is the test matrix which has the rows as windows and columns as samples
%from those windows
%Mdl is the kNN matrix
%class i our actual label
label=zeros(size(Y,1),1);
score=zeros(size(Y,1),noclasses);
cost=zeros(size(Y,1),noclasses);
for i=1:size(Y,1)
    [label(i),score(i,:),cost(i,:)] = predict(Mdl,Y(i,:));
end
sumC=0;
sumF=0;
yesLabel=zeros(size(label,1),1);%define vector with labels of accepted test samples
sumyes=0;%total number of accepted test samples
newY=zeros(size(Y,1),size(Y,2));%define matrix with test samples that satisfy constraints
for i=1:size(Y,1)
    if (label(i)-class)==0
        sumC=sumC+1;%correct classification number
    else
        sumF=sumF+1;%wrongly classified number of windows
    end
end
correct=100*sumC/(sumC+sumF);%percentage of times the class was labelled correctly
totalTestWindows=sumC+sumF;
sumCC=0;
sumFF=0;
for i=1:size(Y,1)-3
    Ma=[(label(i)-class)==0;(label(i+1)-class)==0;(label(i+2)-class)==0];
%     Ma=[(label(i)-class)==0;(label(i+1)-class)==0;(label(i+2)-class)==0;(label(i+3)-class)==0; (label(i+4)-class)==0];
    if all(Ma)
        sumCC=sumCC+1;
    else
        sumFF=sumFF+1;
    end
end
correctBatch=100*sumCC/(sumCC+sumFF);
totalBatch=sumCC+sumFF;

%keep only windows which are close to the mean
for i=1:size(Y,1)
    if myNorm(Y(i,:)-mu(class,:))<=threshold*normSTD(class)
        newY(i,:)=Y(i,:);%accept sample
        sumyes=sumyes+1;%increment counter for accepted samples
        yesLabel(i)=label(i);
    end
end
%get rid of 0 rows
newY( ~any(newY,2), : ) = [];%get rid of 0 rows
yesLabel( ~any(yesLabel,2), : ) = [];%get rid of 0 rows
sumC2=0;
sumF2=0;
%compute how many times person was correctly classified
for i=1:size(newY,1)
    if yesLabel(i)==class
        sumC2=sumC2+1;%correct classification number of windows
    else
        sumF2=sumF2+1;%wrongly classified number of windows
    end
end
correct2=100*sumC2/(sumC2+sumF2);%percentage of times the class was labelled correctly
totalAccepted=sumC2+sumF2;
percentageAccepted=totalAccepted/totalTestWindows;
end