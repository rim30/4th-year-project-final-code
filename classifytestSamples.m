function [C,FN,label]=classifytestSamples(Y,normSTD,mu,class,threshold)
%Y is the input matrix in the reduuced space with rows as window samples
%and columns as features kept
%generalSTD represents the standard deviation found for each class(person)
%over all features in the reduced space
%class is the current person being tested
C=0;%no times the person was correctly identified
FN=0;%no of false negatives(when the person was rejected despite being whom he said he is)
threshold=threshold*normSTD;%threshold for each class
label=zeros(size(Y,1),1);%label found for each window inputted
for i=1:size(Y,1)
   if myNorm((Y(i,:)-mu(class,:)))< threshold(class)
       C=C+1;
       label(i)=class;
   else FN=FN+1;
   end
end
%distances=myNorm(Y-mu(class,:));

end
