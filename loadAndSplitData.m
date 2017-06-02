%load rawsignals and split into beats

nobeats=5;%no beats per window
windowlength=500;%no samples per window
% [rawsignal1,beats1]=loadDat('C:\Users\Roxana\OneDrive\ECG collected\Person 1\',nobeats,windowlength);
% [rawsignal2,beats2]=loadDat('C:\Users\Roxana\OneDrive\ECG collected\Person 2\',nobeats,windowlength);
% [rawsignal3,beats3]=loadDat('C:\Users\Roxana\OneDrive\ECG collected\Person 3\',nobeats,windowlength);
% [rawsignal4,beats4]=loadDat('C:\Users\Roxana\OneDrive\ECG collected\Person 4\',nobeats,windowlength);
% [rawsignal5,beats5]=loadDat('C:\Users\Roxana\OneDrive\ECG collected\Person 5\',nobeats,windowlength);
% [rawsignal6,beats6]=loadDat('C:\Users\Roxana\OneDrive\ECG collected\Person 6\',nobeats,windowlength);
% [rawsignal7,beats7]=loadDat('C:\Users\Roxana\OneDrive\ECG collected\Person 7\',nobeats,windowlength);

%load train data
[rawsignal1,beats1]=loadDat('C:\Users\Roxana\OneDrive\ECG collected\P1 train\',nobeats,windowlength);
[rawsignal2,beats2]=loadDat('C:\Users\Roxana\OneDrive\ECG collected\P2 train\',nobeats,windowlength);
[rawsignal3,beats3]=loadDat('C:\Users\Roxana\OneDrive\ECG collected\P3 train\',nobeats,windowlength);
[rawsignal4,beats4]=loadDat('C:\Users\Roxana\OneDrive\ECG collected\P4 train\',nobeats,windowlength);
[rawsignal5,beats5]=loadDat('C:\Users\Roxana\OneDrive\ECG collected\P5 train\',nobeats,windowlength);
[rawsignal6,beats6]=loadDat('C:\Users\Roxana\OneDrive\ECG collected\P6 train\',nobeats,windowlength);
[rawsignal7,beats7]=loadDat('C:\Users\Roxana\OneDrive\ECG collected\P7 train\',nobeats,windowlength);
[rawsignal8,beats8]=loadDat('C:\Users\Roxana\OneDrive\ECG collected\P8 train\',nobeats,windowlength);
%load test data
[rawtest1,btest1]=loadDat('C:\Users\Roxana\OneDrive\ECG collected\P1 test\',nobeats,windowlength);
[rawtest2,btest2]=loadDat('C:\Users\Roxana\OneDrive\ECG collected\P2 test\',nobeats,windowlength);
[rawtest3,btest3]=loadDat('C:\Users\Roxana\OneDrive\ECG collected\P3 test\',nobeats,windowlength);
[rawtest4,btest4]=loadDat('C:\Users\Roxana\OneDrive\ECG collected\P4 test\',nobeats,windowlength);
[rawtest5,btest5]=loadDat('C:\Users\Roxana\OneDrive\ECG collected\P5 test\',nobeats,windowlength);
[rawtest6,btest6]=loadDat('C:\Users\Roxana\OneDrive\ECG collected\P6 test\',nobeats,windowlength);
[rawtest7,btest7]=loadDat('C:\Users\Roxana\OneDrive\ECG collected\P7 test\',nobeats,windowlength);
[rawtest8,btest8]=loadDat('C:\Users\Roxana\OneDrive\ECG collected\P8 test\',nobeats,windowlength);

%compute autocorrelation for training
r1=my_autocorr(beats1);
r2=my_autocorr(beats2);
r3=my_autocorr(beats3);
r4=my_autocorr(beats4);
r5=my_autocorr(beats5);
r6=my_autocorr(beats6);
r7=my_autocorr(beats7);
r8=my_autocorr(beats8);

t1=my_autocorr(btest1);
t2=my_autocorr(btest2);
t3=my_autocorr(btest3);
t4=my_autocorr(btest4);
t5=my_autocorr(btest5);
t6=my_autocorr(btest6);
t7=my_autocorr(btest7);
t8=my_autocorr(btest8);

%define matrix for lda input
noclasses=8; %no people
trainingWindows=400; %no windows for each class
% A=zeros(noclasses*trainingWindows,windowlength+1);
% %set labels
% for i=1:1:trainingWindows
%     A(i,1)=1; %person1
%     A(i+trainingWindows,1)=2; %person 2
%     A(i+2*trainingWindows,1)=3; %person 3
%     A(i+3*trainingWindows,1)=4; %person 4
%     A(i+4*trainingWindows,1)=5; %person 5
%     A(i+5*trainingWindows,1)=6; %person 6
%     
% end

noTwindows=size(r1,2)+size(r2,2)+size(r3,2)+size(r4,2)+size(r5,2)+size(r6,2)+size(r7,2)+size(r8,2);%total no of windows
s1=size(r1,2);
s2=size(r1,2)+size(r2,2);
s3=size(r1,2)+size(r2,2)+size(r3,2);
s4=size(r1,2)+size(r2,2)+size(r3,2)+size(r4,2);
s5=size(r1,2)+size(r2,2)+size(r3,2)+size(r4,2)+size(r5,2);
s6=size(r1,2)+size(r2,2)+size(r3,2)+size(r4,2)+size(r5,2)+size(r6,2);
s7=size(r1,2)+size(r2,2)+size(r3,2)+size(r4,2)+size(r5,2)+size(r6,2)+size(r7,2);
s8=size(r1,2)+size(r2,2)+size(r3,2)+size(r4,2)+size(r5,2)+size(r6,2)+size(r7,2)+size(r8,2);
%build matrix for training
A1=zeros(noTwindows,windowlength+1);
%set labels
A1(1:s1,1)=1;
A1(s1+1:s2,1)=2;
A1(s2+1:s3,1)=3;
A1(s3+1:s4,1)=4;
A1(s4+1:s5,1)=5;
A1(s5+1:s6,1)=6;
A1(s6+1:s7,1)=7;
A1(s7+1:s8,1)=8;
%input windows into matrix from different people
A1(1:s1,2:(windowlength+1))=r1(1:windowlength,:)';
A1(s1+1:s2,2:(windowlength+1))=r2(1:windowlength,:)';
A1(s2+1:s3,2:(windowlength+1))=r3(1:windowlength,:)';
A1(s3+1:s4,2:(windowlength+1))=r4(1:windowlength,:)';
A1(s4+1:s5,2:(windowlength+1))=r5(1:windowlength,:)';
A1(s5+1:s6,2:(windowlength+1))=r6(1:windowlength,:)';
A1(s6+1:s7,2:(windowlength+1))=r7(1:windowlength,:)';
A1(s7+1:s8,2:(windowlength+1))=r8(1:windowlength,:)';


% 
% %input windows into matrix from different people
% for i=1:1:trainingWindows
%     A(i,2:(windowlength+1))=r1(1:windowlength,i);
%     A(i+trainingWindows,2:(windowlength+1))=r2(1:windowlength,i);
%     A(i+2*trainingWindows,2:(windowlength+1))=r3(1:windowlength,i);
%     A(i+3*trainingWindows,2:(windowlength+1))=r4(1:windowlength,i);
%     A(i+4*trainingWindows,2:(windowlength+1))=r5(1:windowlength,i);
%     A(i+5*trainingWindows,2:(windowlength+1))=r6(1:windowlength,i);
% end
nofeatures=3;
% [mA,mp] = compute_mapping(A,'LDA',nofeatures); %do dim red
% Mdl = fitcknn(mA,A(:,1),'NumNeighbors',5,'Standardize',1); %perform classification
% mA=filter(1/5*ones(1,5),1,mA); %smooth output by taking 3 samples for the moving average

[mA1,mp] = compute_mapping(A1,'LDA',nofeatures); %do dim red
Mdl = fitcknn(mA1,A1(:,1),'NumNeighbors',5,'Standardize',1); %perform classification
mA1=filter(1/5*ones(1,5),1,mA1); %smooth output by taking 3 samples for the moving average


figure(1)
scatter3(mA1(1:s1,1),mA1(1:s1,2),mA1(1:s1,3),'MarkerEdgeColor','red')
hold on
scatter3(mA1(s1+1:s2,1),mA1(s1+1:s2,2),mA1(s1+1:s2,3),'MarkerEdgeColor','blue')
scatter3(mA1(s2+1:s3,1),mA1(s2+1:s3,2),mA1(s2+1:s3,3),'MarkerEdgeColor','green')
scatter3(mA1(s3+1:s4,1),mA1(s3+1:s4,2),mA1(s3+1:s4,3),'MarkerEdgeColor','magenta')
scatter3(mA1(s4+1:s5,1),mA1(s4+1:s5,2),mA1(s4+1:s5,3),'MarkerEdgeColor','black')
scatter3(mA1(s5+1:s6,1),mA1(s5+1:s6,2),mA1(s5+1:s6,3),'MarkerEdgeColor','cyan')
scatter3(mA1(s6+1:s7,1),mA1(s6+1:s7,2),mA1(s6+1:s7,3),'MarkerEdgeColor','yellow')
scatter3(mA1(s7+1:s8,1),mA1(s7+1:s8,2),mA1(s7+1:s8,3),'s','MarkerEdgeColor','magenta')

legend('class1','class2','class3','class4','class5','class6','class7','class8')
%plot scatter plot
ns=trainingWindows;%no windows per person
% f1=1; %feature 1
% f2=2; %feature 2
% scatter(mA(1:ns,1),mA(1:ns,2),'MarkerEdgeColor','red')
% hold on
% scatter(mA(ns+1:2*ns,f1),mA(ns+1:2*ns,f2),'MarkerEdgeColor','blue')
% scatter(mA(2*ns+1:3*ns,f1),mA(2*ns+1:3*ns,f2),'MarkerEdgeColor','green')
% scatter(mA(3*ns+1:4*ns,f1),mA(3*ns+1:4*ns,f2),'MarkerEdgeColor','magenta')
%scatter plot in 3D for keeping only 3 features
% figure(1)
% scatter3(mA(1:ns,1),mA(1:ns,2),mA(1:ns,3),'MarkerEdgeColor','red')
% hold on
% scatter3(mA(ns+1:2*ns,1),mA(ns+1:2*ns,2),mA(ns+1:2*ns,3),'MarkerEdgeColor','blue')
% scatter3(mA(2*ns+1:3*ns,1),mA(2*ns+1:3*ns,2),mA(2*ns+1:3*ns,3),'MarkerEdgeColor','green')
% scatter3(mA(3*ns+1:4*ns,1),mA(3*ns+1:4*ns,2),mA(3*ns+1:4*ns,3),'MarkerEdgeColor','magenta')
% scatter3(mA(4*ns+1:5*ns,1),mA(4*ns+1:5*ns,2),mA(4*ns+1:5*ns,3),'MarkerEdgeColor','black')
% scatter3(mA(5*ns+1:6*ns,1),mA(5*ns+1:6*ns,2),mA(5*ns+1:6*ns,3),'MarkerEdgeColor','cyan')
% legend('class1','class2','class3','class4','class5','class6')

%build matrix for testing
noclasses=8;
%[mu,stddev,normSTD]=computeMeanandSTD(nofeatures,noclasses,mA,trainingWindows); %compute matrix with mean and std dev of each class for each feature
[mu,stddev,normSTD]=computeMeanandSTD(nofeatures,noclasses,mA1,trainingWindows);
testWindows=100; %no windows per person to test
class=1; %class tested
rr=r1; %ACF for class tested
% [X1,Y1]=buildTestMatrix(r1,windowlength,trainingWindows+1,testWindows,mp); %Y is the reduced space matrix
% [X2,Y2]=buildTestMatrix(r2,windowlength,trainingWindows+1,testWindows,mp); %Y is the reduced space matrix
% [X3,Y3]=buildTestMatrix(r3,windowlength,trainingWindows+1,testWindows,mp); %Y is the reduced space matrix
% [X4,Y4]=buildTestMatrix(r4,windowlength,trainingWindows+1,testWindows,mp); %Y is the reduced space matrix
% [X5,Y5]=buildTestMatrix(r5,windowlength,trainingWindows+1,testWindows,mp); %Y is the reduced space matrix
% [X6,Y6]=buildTestMatrix(r6,windowlength,trainingWindows+1,testWindows,mp); %Y is the reduced space matrix


[X1,Y1]=buildTestMatrix(t1,windowlength,1,5,mp); %Y is the reduced space matrix
[X2,Y2]=buildTestMatrix(t2,windowlength,1,5,mp); %Y is the reduced space matrix
[X3,Y3]=buildTestMatrix(t3,windowlength,1,5,mp); %Y is the reduced space matrix
[X4,Y4]=buildTestMatrix(t4,windowlength,1,5,mp); %Y is the reduced space matrix
[X5,Y5]=buildTestMatrix(t5,windowlength,1,5,mp); %Y is the reduced space matrix
[X6,Y6]=buildTestMatrix(t6,windowlength,1,5,mp); %Y is the reduced space matrix
[X7,Y7]=buildTestMatrix(t7,windowlength,1,5,mp); %Y is the reduced space matrix
[X8,Y8]=buildTestMatrix(t8,windowlength,1,5,mp); %Y is the reduced space matrix
%plot testing windows
% figure(2)
% scatter3(Y1(:,1),Y1(:,2),Y1(:,3),'MarkerEdgeColor','red')
% hold on
% scatter3(Y2(:,1),Y2(:,2),Y2(:,3),'MarkerEdgeColor','blue')
% scatter3(Y3(:,1),Y3(:,2),Y3(:,3),'MarkerEdgeColor','green')
% scatter3(Y4(:,1),Y4(:,2),Y4(:,3),'MarkerEdgeColor','magenta')
% scatter3(Y5(:,1),Y5(:,2),Y5(:,3),'MarkerEdgeColor','black')
% scatter3(Y6(:,1),Y6(:,2),Y6(:,3),'MarkerEdgeColor','cyan')
% legend('class1','class2','class3','class4','class5','class6')
%[label,score,cost,correct,correct2,newY,sumyes,yesLabel]=runkNNNew(noclasses,Y,Mdl,class,mu,stddev,4); %compute classification for training data class 1
%[label,score,cost,correct,sumyes]=runkNNNew(noclasses,Y,Mdl,1,mu,stddev);
