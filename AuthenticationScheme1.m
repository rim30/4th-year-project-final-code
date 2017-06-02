nobeats=5;%no beats per window
windowlength=500;%no samples per window
[rawsignal1,beats1]=loadDat('C:\Users\Roxana\OneDrive\ECG collected\Person 1\',nobeats,windowlength);
[rawsignal2,beats2]=loadDat('C:\Users\Roxana\OneDrive\ECG collected\Person 2\',nobeats,windowlength);
[rawsignal3,beats3]=loadDat('C:\Users\Roxana\OneDrive\ECG collected\Person 3\',nobeats,windowlength);
[rawsignal4,beats4]=loadDat('C:\Users\Roxana\OneDrive\ECG collected\Person 4\',nobeats,windowlength);
[rawsignal5,beats5]=loadDat('C:\Users\Roxana\OneDrive\ECG collected\Person 5\',nobeats,windowlength);
[rawsignal6,beats6]=loadDat('C:\Users\Roxana\OneDrive\ECG collected\Person 6\',nobeats,windowlength);
[rawsignal7,beats7]=loadDat('C:\Users\Roxana\OneDrive\ECG collected\Person 7\',nobeats,windowlength);
[rawsignal8,beats8]=loadDat('C:\Users\Roxana\OneDrive\ECG collected\Person 8\',nobeats,windowlength);

%compute autocorrelation
r1=my_autocorr(beats1);
r2=my_autocorr(beats2);
r3=my_autocorr(beats3);
r4=my_autocorr(beats4);
r5=my_autocorr(beats5);
r6=my_autocorr(beats6);
r7=my_autocorr(beats7);
r8=my_autocorr(beats8);


%define matrix for lda input
noclasses=7; %no people
trainingWindows=400; %no windows for each class
A=zeros(noclasses*trainingWindows,windowlength+1);
%set labels
for i=1:1:trainingWindows
    A(i,1)=1; %person1
    A(i+trainingWindows,1)=2; %person 2
    A(i+2*trainingWindows,1)=3; %person 3
    A(i+3*trainingWindows,1)=4; %person 4
    A(i+4*trainingWindows,1)=5; %person 5
    A(i+5*trainingWindows,1)=6; %person 6
    A(i+6*trainingWindows,1)=7; %person 7
    A(i+7*trainingWindows,1)=8; %person 8
    
end

%input windows into matrix from different people
for i=1:1:trainingWindows
    A(i,2:(windowlength+1))=r1(1:windowlength,i);
    A(i+trainingWindows,2:(windowlength+1))=r2(1:windowlength,i);
    A(i+2*trainingWindows,2:(windowlength+1))=r3(1:windowlength,i);
    A(i+3*trainingWindows,2:(windowlength+1))=r4(1:windowlength,i);
    A(i+4*trainingWindows,2:(windowlength+1))=r5(1:windowlength,i);
    A(i+5*trainingWindows,2:(windowlength+1))=r6(1:windowlength,i);
    A(i+6*trainingWindows,2:(windowlength+1))=r7(1:windowlength,i);
    A(i+7*trainingWindows,2:(windowlength+1))=r8(1:windowlength,i);
end

nofeatures=3;
[mA,mp] = compute_mapping(A,'LDA',nofeatures); %do dim red
Mdl = fitcknn(mA,A(:,1),'NumNeighbors',5,'Standardize',1); %perform classification
mA=filter(1/5*ones(1,5),1,mA); %smooth output by taking 3 samples for the moving average

ns=trainingWindows;%no windows per person
%scatter plot in 3D for keeping only 3 features
figure(1)
scatter3(mA(1:ns,1),mA(1:ns,2),mA(1:ns,3),'MarkerEdgeColor','red')
hold on
scatter3(mA(ns+1:2*ns,1),mA(ns+1:2*ns,2),mA(ns+1:2*ns,3),'MarkerEdgeColor','blue')
scatter3(mA(2*ns+1:3*ns,1),mA(2*ns+1:3*ns,2),mA(2*ns+1:3*ns,3),'MarkerEdgeColor','green')
scatter3(mA(3*ns+1:4*ns,1),mA(3*ns+1:4*ns,2),mA(3*ns+1:4*ns,3),'MarkerEdgeColor','magenta')
scatter3(mA(4*ns+1:5*ns,1),mA(4*ns+1:5*ns,2),mA(4*ns+1:5*ns,3),'MarkerEdgeColor','black')
scatter3(mA(5*ns+1:6*ns,1),mA(5*ns+1:6*ns,2),mA(5*ns+1:6*ns,3),'MarkerEdgeColor','cyan')
scatter3(mA(6*ns+1:7*ns,1),mA(6*ns+1:7*ns,2),mA(6*ns+1:7*ns,3),'MarkerEdgeColor','yellow')
scatter3(mA(7*ns+1:8*ns,1),mA(7*ns+1:8*ns,2),mA(7*ns+1:8*ns,3),'x','MarkerEdgeColor','magenta')
legend('class1','class2','class3','class4','class5','class6','class7','class8')

%build matrix for testing
noclasses=8;
[mu,stddev,normSTD]=computeMeanandSTD(nofeatures,noclasses,mA,trainingWindows); %compute matrix with mean and std dev of each class for each feature
testWindows=100; %no windows per person to test
[X1,Y1]=buildTestMatrix(r1,windowlength,trainingWindows+1,testWindows,mp); %Y is the reduced space matrix
[X2,Y2]=buildTestMatrix(r2,windowlength,trainingWindows+1,testWindows,mp); %Y is the reduced space matrix
[X3,Y3]=buildTestMatrix(r3,windowlength,trainingWindows+1,testWindows,mp); %Y is the reduced space matrix
[X4,Y4]=buildTestMatrix(r4,windowlength,trainingWindows+1,testWindows,mp); %Y is the reduced space matrix
[X5,Y5]=buildTestMatrix(r5,windowlength,trainingWindows+1,testWindows,mp); %Y is the reduced space matrix
[X6,Y6]=buildTestMatrix(r6,windowlength,trainingWindows+1,testWindows,mp); %Y is the reduced space matrix
[X7,Y7]=buildTestMatrix(r7,windowlength,trainingWindows+1,testWindows,mp); %Y is the reduced space matrix
[X8,Y8]=buildTestMatrix(r8,windowlength,trainingWindows+1,testWindows,mp); %Y is the reduced space matrix

[label,score,cost,correct,correct2,newY,sumyes,yesLabel]=runkNNNew(noclasses,Y1,Mdl,1,mu,stddev,4);
correct