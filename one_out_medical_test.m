clear all
%load ecg from medical records

nobeats=1;%no beats per window
sampleskept=60000;%no samples kept from original signal
windowlength=300;%window length
noclasses=17; %no people
neighbours=5;
nofeatures=7;%features kept after lda
wlen=300;
%load data
ACF_on=0;%set 1 for using autocorrelation function, 0 not to use
[rawsignal1,beats1]=loadmedicalECG('16265m',nobeats,sampleskept,windowlength,1);
[rawsignal2,beats2]=loadmedicalECG('16272m',nobeats,90000,windowlength,1);
[rawsignal3,beats3]=loadmedicalECG('16273m',nobeats,sampleskept,windowlength,1);
[rawsignal4,beats4]=loadmedicalECG('16420m',nobeats,90000,windowlength,1);
[rawsignal5,beats5]=loadmedicalECG('16483m',nobeats,sampleskept,windowlength,1);
[rawsignal6,beats6]=loadmedicalECG('16539m',nobeats,80000,windowlength,1);
[rawsignal7,beats7]=loadmedicalECG('16773m',nobeats,80000,windowlength,1);
[rawsignal8,beats8]=loadmedicalECG('16786m',nobeats,sampleskept,windowlength,1);
[rawsignal9,beats9]=loadmedicalECG('16795m',nobeats,80000,windowlength,1);
[rawsignal10,beats10]=loadmedicalECG('17052m',nobeats,80000,windowlength,1);
[rawsignal11,beats11]=loadmedicalECG('17453m',nobeats,sampleskept,windowlength,1);
[rawsignal12,beats12]=loadmedicalECG('18177m',nobeats,sampleskept,windowlength,1);
[rawsignal13,beats13]=loadmedicalECG('18184m',nobeats,90000,windowlength,1);
[rawsignal14,beats14]=loadmedicalECG('19088m',nobeats,sampleskept,windowlength,10000);
[rawsignal15,beats15]=loadmedicalECG('19090m',nobeats,sampleskept,windowlength,10000);
[rawsignal16,beats16]=loadmedicalECG('19093m',nobeats,sampleskept,windowlength,10000);
[rawsignal17,beats17]=loadmedicalECG('19140m',nobeats,sampleskept,windowlength,10000);
[rawsignal18,beats18]=loadmedicalECG('19830m',nobeats,sampleskept,windowlength,2000000);
if ACF_on==1
    %split rawsignals into fixed-length-windows
    wsig1=window_function(rawsignal1,wlen);
    wsig2=window_function(rawsignal2,wlen);
    wsig3=window_function(rawsignal3,wlen);
    wsig4=window_function(rawsignal4,wlen);
    wsig5=window_function(rawsignal5,wlen);
    wsig6=window_function(rawsignal6,wlen);
    wsig7=window_function(rawsignal7,wlen);
    wsig8=window_function(rawsignal8,wlen);
    wsig9=window_function(rawsignal9,wlen);
    wsig10=window_function(rawsignal10,wlen);
    wsig11=window_function(rawsignal11,wlen);
    wsig12=window_function(rawsignal12,wlen);
    wsig13=window_function(rawsignal13,wlen);
    wsig14=window_function(rawsignal14,wlen);
    wsig15=window_function(rawsignal15,wlen);
    wsig16=window_function(rawsignal16,wlen);
    wsig17=window_function(rawsignal17,wlen);
    wsig18=window_function(rawsignal18,wlen);
end
if ACF_on==0
    % use raw data
    r1=beats1';
    r2=beats2';
    r3=beats3';
    r4=beats4';
    r5=beats5';
    r6=beats6';
    r7=beats7';
    r8=beats8';
    r9=beats9';
    r10=beats10';
    r11=beats11';
    r12=beats12';
    r13=beats13';
    r14=beats14';
    r15=beats15';
    r16=beats16';
    r17=beats17';
    r18=beats18';
else
    %compute autocorrelation
    r1=my_autocorr(wsig1);
    r2=my_autocorr(wsig2);
    r3=my_autocorr(wsig3);
    r4=my_autocorr(wsig4);
    r5=my_autocorr(wsig5);
    r6=my_autocorr(wsig6);
    r7=my_autocorr(wsig7);
    r8=my_autocorr(wsig8);
    r9=my_autocorr(wsig9);
    r10=my_autocorr(wsig10);
    r11=my_autocorr(wsig11);
    r12=my_autocorr(wsig12);
    r13=my_autocorr(wsig13);
    r14=my_autocorr(wsig14);
    r15=my_autocorr(wsig15);
    r16=my_autocorr(wsig16);
    r17=my_autocorr(wsig17);
    r18=my_autocorr(wsig18);
end

% final_matrix=zeros(18,17);
% for k=1:18
    k=2
    outchoice=2;%the person we want to test for
    if k==1;
        rout=r1;
    end
     if k==2
        rout=r2;
     end
     if k==3
        rout=r3;
     end
     if k==4
        rout=r4;
     end
     if k==5
        rout=r5; 
     end
     if k==6
        rout=r6;
     end
     if k==7
        rout=r7;
     end
     if k==8
        rout=r8;
     end
     if k==9
        rout=r9;
     end
     if k==10
        rout=r10;
     end
     if k==11
        rout=r11;
     end
     if k==12
        rout=r12;
     end
     if k==13
        rout=r13;
     end
     if k==14
        rout=r14;
     end
     if k==15
        rout=r15;
     end
     if k==16
        rout=r16;
     end
     if k==17
        rout=r17;
     end
     if k==18
        rout=r18;
    end

%costruct matrix for lda
[A, classWindows]=define_lda(r1,r2,r3,r4,r5,r6,r7,r8,r9,r10,r11,r12,r13,r14,r15,r16,r17,r18,outchoice,windowlength);

[mA,mp] = compute_mapping(A,'LDA',nofeatures); %do dim reduction
mA=real(mA);
mp.M=real(mp.M);
Mdl = fitcknn(mA,A(:,1),'NumNeighbors',5); %perform classification
%compute mean and standard dev
[mu,stddev,normSTD]=MAndSTD(nofeatures,noclasses,mA,classWindows);

%build matrix for testing Y(in the reduced space), X normal space
[X,Y]=buildTestMatrix(rout,windowlength,1,size(rout,2),mp); 

%compute classification for training data where correct is no of times
%person was correctly identified 

correctMatrix=zeros(1,noclasses);
correct2Mat=zeros(1,noclasses);
totalAccepted=zeros(1,noclasses);
percAcc=zeros(1,noclasses);
correctBatch=zeros(1,noclasses);
totalBatch=zeros(1,noclasses);
for i=1:noclasses
    [label,score,cost,correctMatrix(1,i),correct2Mat(1,i),totalAccepted(1,i),percAcc(1,i),correctBatch(1,i),totalBatch(1,i)]=kNNV2(noclasses,Y,Mdl,i,mu,stddev,3,normSTD);
end

% final_matrix(k,:)=correctBatch;

% %compute falseneg and falsepos
% falsepos=zeros(1,noclasses);
% falseneg=zeros(1,noclasses)';
% for i=1:noclasses
%     falsepos(i)=sum(correctBatch(:,i))-correctBatch(i,i);
%     falseneg(i)=100-correctBatch(i,i);
% end
% end

