function [label,score,cost]=runkNN(noclasses,Y,Mdl,class)
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
for i=1:size(Y,1)
    if label(i)-class=0
        sumC=sumC+1;
    end
end
end
