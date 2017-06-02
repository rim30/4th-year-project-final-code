function [label,correct]=kNNNew(Y,Mdl)
%noclasses= number of classes to classify
%Y is the test matrix which has the rows as windows and columns as samples
%from those windows
%Mdl is the kNN matrix
%class i our actual label
label=zeros(size(Y,1),1);
for i=1:size(Y,1)
    label(i) = predict(Mdl,Y(i));
end
sumC=0;
sumF=0;

for i=1:size(Y,1)
    if label(i)==1
        sumC=sumC+1;%correct classification number
    else
        sumF=sumF+1;%wrongly classified number of windows
    end
end
correct=100*sumC/(sumC+sumF);%percentage of times the class was labelled correctly
totalTestWindows=sumC+sumF;
end