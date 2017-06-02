function [label,score,cost,correct,correct2,newY,sumyes,yesLabel,totalTestWindows]=runkNNNew(noclasses,Y,Mdl,class,mu,stddev,threshold)
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
correct=100*sumC/(sumC+sumF)%percentage of times the class was labelled correctly
totalTestWindows=sumC+sumF
%c is a feature
j=1;
for i=1:size(Y,1)
    c1=sqrt((mu(class,1)-Y(i,1))^2)<threshold*stddev(class,1);
    c2=sqrt((mu(class,2)-Y(i,2))^2)<threshold*stddev(class,2);
    c3=sqrt((mu(class,3)-Y(i,3))^2)<threshold*stddev(class,3);
% c4=sqrt((mu(class,4)-Y(i,4))^2)<threshold*stddev(class,4);
%     c5=sqrt((mu(class,5)-Y(i,5))^2)<threshold*stddev(class,5);
%     c6=sqrt((mu(class,6)-Y(i,6))^2)<threshold*stddev(class,6);
    if c1*c2*c3==1
        newY(j,:)=Y(i,:);%accept sample
        sumyes=sumyes+1;%increment counter for accepted samples
        yesLabel(j)=label(i);
    end
    j=j+1;%increment counter for new matrix row size
end
newY( ~any(newY,2), : ) = [];%get rid of 0 rows
yesLabel( ~any(yesLabel,2), : ) = [];%get rid of 0 rows
sumC2=0;
sumF2=0;
for i=1:size(newY,1)
    if (yesLabel(i)-class)==0
        sumC2=sumC2+1;%correct classification number
    else
        sumF2=sumF2+1;%wrongly classified number of windows
    end
end
correct2=100*sumC2/(sumC2+sumF2)%percentage of times the class was labelled correctly

sumC2+sumF2
end
