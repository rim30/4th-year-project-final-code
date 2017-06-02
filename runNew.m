%load rawsignals and split into beats

nobeats=5;%no beats per window
windowlength=500;%no samples per window
smoothamount=4;
nofeatures=3;%features kept after lda

%load train data
[rawsignal1,beats1]=loadDat('C:\Users\Roxana\OneDrive\ECG collected\P1 train\',nobeats,windowlength,smoothamount);
[rawsignal2,beats2]=loadDat('C:\Users\Roxana\OneDrive\ECG collected\P2 train\',nobeats,windowlength,smoothamount);
[rawsignal3,beats3]=loadDat('C:\Users\Roxana\OneDrive\ECG collected\P3 train\',nobeats,windowlength,smoothamount);
[rawsignal4,beats4]=loadDat('C:\Users\Roxana\OneDrive\ECG collected\P4 train\',nobeats,windowlength,smoothamount);
[rawsignal5,beats5]=loadDat('C:\Users\Roxana\OneDrive\ECG collected\P5 train\',nobeats,windowlength,smoothamount);
[rawsignal6,beats6]=loadDat('C:\Users\Roxana\OneDrive\ECG collected\P6 train\',nobeats,windowlength,smoothamount);
[rawsignal7,beats7]=loadDat('C:\Users\Roxana\OneDrive\ECG collected\P7 train\',nobeats,windowlength,smoothamount);
[rawsignal8,beats8]=loadDat('C:\Users\Roxana\OneDrive\ECG collected\P8 train\',nobeats,windowlength,smoothamount);
%load test data
[rawtest1,btest1]=loadDat('C:\Users\Roxana\OneDrive\ECG collected\P1 test\',nobeats,windowlength,smoothamount);
[rawtest2,btest2]=loadDat('C:\Users\Roxana\OneDrive\ECG collected\P2 test\',nobeats,windowlength,smoothamount);
[rawtest3,btest3]=loadDat('C:\Users\Roxana\OneDrive\ECG collected\P3 test\',nobeats,windowlength,smoothamount);
[rawtest4,btest4]=loadDat('C:\Users\Roxana\OneDrive\ECG collected\P4 test\',nobeats,windowlength,smoothamount);
[rawtest5,btest5]=loadDat('C:\Users\Roxana\OneDrive\ECG collected\P5 test\',nobeats,windowlength,smoothamount);
[rawtest6,btest6]=loadDat('C:\Users\Roxana\OneDrive\ECG collected\P6 test\',nobeats,windowlength,smoothamount);
[rawtest7,btest7]=loadDat('C:\Users\Roxana\OneDrive\ECG collected\P7 test\',nobeats,windowlength,smoothamount);
[rawtest8,btest8]=loadDat('C:\Users\Roxana\OneDrive\ECG collected\P8 test\',nobeats,windowlength,smoothamount);
r1=beats1';
r2=beats2';
r3=beats3';
r4=beats4';
r5=beats5';
r6=beats6';
r7=beats7';
r8=beats8';

t1=btest1';
t2=btest2';
t3=btest3';
t4=btest4';
t5=btest5';
t6=btest6';
t7=btest7';
t8=btest8';

% %compute autocorrelation for training
% r1=my_autocorr(beats1);
% r2=my_autocorr(beats2);
% r3=my_autocorr(beats3);
% r4=my_autocorr(beats4);
% r5=my_autocorr(beats5);
% r6=my_autocorr(beats6);
% r7=my_autocorr(beats7);
% r8=my_autocorr(beats8);
% %compute autocorrelation for testing
% t1=my_autocorr(btest1);
% t2=my_autocorr(btest2);
% t3=my_autocorr(btest3);
% t4=my_autocorr(btest4);
% t5=my_autocorr(btest5);
% t6=my_autocorr(btest6);
% t7=my_autocorr(btest7);
% t8=my_autocorr(btest8);

%define matrix for lda input
noclasses=8; %no people
%define size for matrix
noTwindows=size(r1,2)+size(r2,2)+size(r3,2)+size(r4,2)+size(r5,2)+size(r6,2)+size(r7,2)+size(r8,2);%total no of windows
s1=size(r1,2);
s2=size(r1,2)+size(r2,2);
s3=size(r1,2)+size(r2,2)+size(r3,2);
s4=size(r1,2)+size(r2,2)+size(r3,2)+size(r4,2);
s5=size(r1,2)+size(r2,2)+size(r3,2)+size(r4,2)+size(r5,2);
s6=size(r1,2)+size(r2,2)+size(r3,2)+size(r4,2)+size(r5,2)+size(r6,2);
s7=size(r1,2)+size(r2,2)+size(r3,2)+size(r4,2)+size(r5,2)+size(r6,2)+size(r7,2);
s8=size(r1,2)+size(r2,2)+size(r3,2)+size(r4,2)+size(r5,2)+size(r6,2)+size(r7,2)+size(r8,2);
s=[s1;s2;s3;s4;s5;s6;s7;s8];%matrix with sizes
%build matrix for training and compute classification model
[A1,mA1,Mdl1,mp1]=createTrainingMatrix(1,s,noTwindows,windowlength,r1,r2,r3,r4,r5,r6,r7,r8);
[A2,mA2,Mdl2,mp2]=createTrainingMatrix(2,s,noTwindows,windowlength,r1,r2,r3,r4,r5,r6,r7,r8);
[A3,mA3,Mdl3,mp3]=createTrainingMatrix(3,s,noTwindows,windowlength,r1,r2,r3,r4,r5,r6,r7,r8);
[A4,mA4,Mdl4,mp4]=createTrainingMatrix(4,s,noTwindows,windowlength,r1,r2,r3,r4,r5,r6,r7,r8);
[A5,mA5,Mdl5,mp5]=createTrainingMatrix(5,s,noTwindows,windowlength,r1,r2,r3,r4,r5,r6,r7,r8);
[A6,mA6,Mdl6,mp6]=createTrainingMatrix(6,s,noTwindows,windowlength,r1,r2,r3,r4,r5,r6,r7,r8);
[A7,mA7,Mdl7,mp7]=createTrainingMatrix(7,s,noTwindows,windowlength,r1,r2,r3,r4,r5,r6,r7,r8);
[A8,mA8,Mdl8,mp8]=createTrainingMatrix(8,s,noTwindows,windowlength,r1,r2,r3,r4,r5,r6,r7,r8);

%mA1=filter(1/8*ones(1,8),1,mA1); %smooth output by taking 3 samples for the moving average

 noclasses=8;%number of classes analysed
%build matrix for testing Y(in the reduced space), X normal space
correctMatrix=zeros(noclasses,noclasses);
for j=1:8
    person=j;
    signal=selectSignal(person,t1,t2,t3,t4,t5,t6,t7,t8);
    for i=1:8
        persImp=i;%person we pretend to be
        [Mdlx,mpx]=getClassify(persImp,Mdl1,Mdl2,Mdl3,Mdl4,Mdl5,Mdl6,Mdl7,Mdl8,mp1,mp2,mp3,mp4,mp5,mp6,mp7,mp8);
        [X,Y]=buildTestMatrix(signal,windowlength,1,size(signal,2),mpx);
        [label,correctMatrix(j,i)]=kNNNew(Y,Mdlx);
    end
end

xlswrite('C:\Users\Roxana\Desktop\table1.xlsx',correctMatrix)