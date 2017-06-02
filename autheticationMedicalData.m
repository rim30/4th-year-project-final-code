% clear all
% clc
%load ecg from medical records
clear all
nobeats=1;%no beats per window
sampleskept=60000;%no samples kept from original signal
windowlength=500;%window length
noclasses=18; %no people
neighbours=5;
wlen=300;
ACF_on=1;
load_data_medData
for trial=1:5 
testno=trial;
nofeatures=trial*3;%features kept after lda
details={'nobeats',nobeats;'window length',windowlength;'no features',nofeatures;'neighbours',neighbours};


% ACF_on=0;%set 1 for using autocorrelation function, 0 not to use
% [rawsignal1,beats1]=loadmedicalECG('16265m',nobeats,sampleskept,windowlength,1);
% [rawsignal2,beats2]=loadmedicalECG('16272m',nobeats,90000,windowlength,1);
% [rawsignal3,beats3]=loadmedicalECG('16273m',nobeats,sampleskept,windowlength,1);
% [rawsignal4,beats4]=loadmedicalECG('16420m',nobeats,90000,windowlength,1);
% [rawsignal5,beats5]=loadmedicalECG('16483m',nobeats,sampleskept,windowlength,1);
% [rawsignal6,beats6]=loadmedicalECG('16539m',nobeats,80000,windowlength,1);
% [rawsignal7,beats7]=loadmedicalECG('16773m',nobeats,80000,windowlength,1);
% [rawsignal8,beats8]=loadmedicalECG('16786m',nobeats,sampleskept,windowlength,1);
% [rawsignal9,beats9]=loadmedicalECG('16795m',nobeats,80000,windowlength,1);
% [rawsignal10,beats10]=loadmedicalECG('17052m',nobeats,80000,windowlength,1);
% [rawsignal11,beats11]=loadmedicalECG('17453m',nobeats,sampleskept,windowlength,1);
% [rawsignal12,beats12]=loadmedicalECG('18177m',nobeats,sampleskept,windowlength,1);
% [rawsignal13,beats13]=loadmedicalECG('18184m',nobeats,90000,windowlength,1);
% [rawsignal14,beats14]=loadmedicalECG('19088m',nobeats,sampleskept,windowlength,10000);
% [rawsignal15,beats15]=loadmedicalECG('19090m',nobeats,sampleskept,windowlength,10000);
% [rawsignal16,beats16]=loadmedicalECG('19093m',nobeats,sampleskept,windowlength,10000);
% [rawsignal17,beats17]=loadmedicalECG('19140m',nobeats,sampleskept,windowlength,10000);
% [rawsignal18,beats18]=loadmedicalECG('19830m',nobeats,sampleskept,windowlength,2000000);
% if ACF_on==1
%     %split rawsignals into fixed-length-windows
%     wsig1=window_function(rawsignal1,wlen);
%     wsig2=window_function(rawsignal2,wlen);
%     wsig3=window_function(rawsignal3,wlen);
%     wsig4=window_function(rawsignal4,wlen);
%     wsig5=window_function(rawsignal5,wlen);
%     wsig6=window_function(rawsignal6,wlen);
%     wsig7=window_function(rawsignal7,wlen);
%     wsig8=window_function(rawsignal8,wlen);
%     wsig9=window_function(rawsignal9,wlen);
%     wsig10=window_function(rawsignal10,wlen);
%     wsig11=window_function(rawsignal11,wlen);
%     wsig12=window_function(rawsignal12,wlen);
%     wsig13=window_function(rawsignal13,wlen);
%     wsig14=window_function(rawsignal14,wlen);
%     wsig15=window_function(rawsignal15,wlen);
%     wsig16=window_function(rawsignal16,wlen);
%     wsig17=window_function(rawsignal17,wlen);
%     wsig18=window_function(rawsignal18,wlen);
% end
% if ACF_on==0
%     % use raw data
%     r1=beats1';
%     r2=beats2';
%     r3=beats3';
%     r4=beats4';
%     r5=beats5';
%     r6=beats6';
%     r7=beats7';
%     r8=beats8';
%     r9=beats9';
%     r10=beats10';
%     r11=beats11';
%     r12=beats12';
%     r13=beats13';
%     r14=beats14';
%     r15=beats15';
%     r16=beats16';
%     r17=beats17';
%     r18=beats18';
% else
%     %compute autocorrelation
%     r1=my_autocorr(wsig1);
%     r2=my_autocorr(wsig2);
%     r3=my_autocorr(wsig3);
%     r4=my_autocorr(wsig4);
%     r5=my_autocorr(wsig5);
%     r6=my_autocorr(wsig6);
%     r7=my_autocorr(wsig7);
%     r8=my_autocorr(wsig8);
%     r9=my_autocorr(wsig9);
%     r10=my_autocorr(wsig10);
%     r11=my_autocorr(wsig11);
%     r12=my_autocorr(wsig12);
%     r13=my_autocorr(wsig13);
%     r14=my_autocorr(wsig14);
%     r15=my_autocorr(wsig15);
%     r16=my_autocorr(wsig16);
%     r17=my_autocorr(wsig17);
%     r18=my_autocorr(wsig18);
% end
% 
% %define matrix for lda input
% 
% %define size for matrix
% s1train=ceil(2/3*size(r1,2)); s1test=size(r1,2)-s1train;
% s2train=ceil(2/3*size(r2,2)); s2test=size(r2,2)-s2train;
% s3train=ceil(2/3*size(r3,2)); s3test=size(r3,2)-s3train;
% s4train=ceil(2/3*size(r4,2)); s4test=size(r4,2)-s4train;
% s5train=ceil(2/3*size(r5,2)); s5test=size(r5,2)-s5train;
% s6train=ceil(2/3*size(r6,2)); s6test=size(r6,2)-s6train;
% s7train=ceil(2/3*size(r7,2)); s7test=size(r7,2)-s7train;
% s8train=ceil(2/3*size(r8,2)); s8test=size(r8,2)-s8train;
% s9train=ceil(2/3*size(r9,2)); s9test=size(r9,2)-s9train;
% s10train=ceil(2/3*size(r10,2)); s10test=size(r10,2)-s10train;
% s11train=ceil(2/3*size(r11,2)); s11test=size(r11,2)-s11train;
% s12train=ceil(2/3*size(r12,2)); s12test=size(r12,2)-s12train;
% s13train=ceil(2/3*size(r13,2)); s13test=size(r13,2)-s13train;
% s14train=ceil(2/3*size(r14,2)); s14test=size(r14,2)-s14train;
% s15train=ceil(2/3*size(r15,2)); s15test=size(r15,2)-s15train;
% s16train=ceil(2/3*size(r16,2)); s16test=size(r16,2)-s16train;
% s17train=ceil(2/3*size(r17,2)); s17test=size(r17,2)-s17train;
% s18train=ceil(2/3*size(r18,2)); s18test=size(r18,2)-s18train;
% noTwindows=s1train+s2train+s3train+s4train+s5train+s6train+s7train+s8train+s9train;%total no of windows
% noTwindows=noTwindows+s10train+s11train+s12train+s13train+s14train+s15train+s16train+s17train+s18train;
% s1=s1train;
% s2=s1+s2train;
% s3=s2+s3train;
% s4=s3+s4train;
% s5=s4+s5train;
% s6=s5+s6train;
% s7=s6+s7train;
% s8=s7+s8train;
% s9=s8+s9train;
% s10=s9+s10train;
% s11=s10+s11train;
% s12=s11+s12train;
% s13=s12+s13train;
% s14=s13+s14train;
% s15=s14+s15train;
% s16=s15+s16train;
% s17=s16+s17train;
% s18=s17+s18train;
% 
% %build matrix for training
% A=zeros(noTwindows,windowlength+1);
% %set labels
% A(1:s1,1)=1;
% A(s1+1:s2,1)=2;
% A(s2+1:s3,1)=3;
% A(s3+1:s4,1)=4;
% A(s4+1:s5,1)=5;
% A(s5+1:s6,1)=6;
% A(s6+1:s7,1)=7;
% A(s7+1:s8,1)=8;
% A(s8+1:s9,1)=9;
% A(s9+1:s10,1)=10;
% A(s10+1:s11,1)=11;
% A(s11+1:s12,1)=12;
% A(s12+1:s13,1)=13;
% A(s13+1:s14,1)=14;
% A(s14+1:s15,1)=15;
% A(s15+1:s16,1)=16;
% A(s16+1:s17,1)=17;
% A(s17+1:s18,1)=18;
% %input windows into matrix from different people
% A(1:s1,2:(windowlength+1))=r1(1:windowlength,1:s1train)';
% A(s1+1:s2,2:(windowlength+1))=r2(1:windowlength,1:s2train)';
% A(s2+1:s3,2:(windowlength+1))=r3(1:windowlength,1:s3train)';
% A(s3+1:s4,2:(windowlength+1))=r4(1:windowlength,1:s4train)';
% A(s4+1:s5,2:(windowlength+1))=r5(1:windowlength,1:s5train)';
% A(s5+1:s6,2:(windowlength+1))=r6(1:windowlength,1:s6train)';
% A(s6+1:s7,2:(windowlength+1))=r7(1:windowlength,1:s7train)';
% A(s7+1:s8,2:(windowlength+1))=r8(1:windowlength,1:s8train)';
% A(s8+1:s9,2:(windowlength+1))=r9(1:windowlength,1:s9train)';
% A(s9+1:s10,2:(windowlength+1))=r10(1:windowlength,1:s10train)';
% A(s10+1:s11,2:(windowlength+1))=r11(1:windowlength,1:s11train)';
% A(s11+1:s12,2:(windowlength+1))=r12(1:windowlength,1:s12train)';
% A(s12+1:s13,2:(windowlength+1))=r13(1:windowlength,1:s13train)';
% A(s13+1:s14,2:(windowlength+1))=r14(1:windowlength,1:s14train)';
% A(s14+1:s15,2:(windowlength+1))=r15(1:windowlength,1:s15train)';
% A(s15+1:s16,2:(windowlength+1))=r16(1:windowlength,1:s16train)';
% A(s16+1:s17,2:(windowlength+1))=r17(1:windowlength,1:s17train)';
% A(s17+1:s18,2:(windowlength+1))=r18(1:windowlength,1:s18train)';

[mA,mp] = compute_mapping(A,'LDA',nofeatures); %do dim red down to 5 dimensions
Mdl = fitcknn(mA,A(:,1),'NumNeighbors',5,'Standardize',1); %perform classification

%plot 3D figure after lda
figure(1)
scatter3(mA(1:s1,1),mA(1:s1,2),mA(1:s1,3),'MarkerEdgeColor','red')
hold on
scatter3(mA(s1+1:s2,1),mA(s1+1:s2,2),mA(s1+1:s2,3),'MarkerEdgeColor','blue')
scatter3(mA(s2+1:s3,1),mA(s2+1:s3,2),mA(s2+1:s3,3),'MarkerEdgeColor','green')
scatter3(mA(s3+1:s4,1),mA(s3+1:s4,2),mA(s3+1:s4,3),'MarkerEdgeColor','magenta')
scatter3(mA(s4+1:s5,1),mA(s4+1:s5,2),mA(s4+1:s5,3),'MarkerEdgeColor','black')
scatter3(mA(s5+1:s6,1),mA(s5+1:s6,2),mA(s5+1:s6,3),'MarkerEdgeColor','cyan')
scatter3(mA(s6+1:s7,1),mA(s6+1:s7,2),mA(s6+1:s7,3),'MarkerEdgeColor','yellow')
scatter3(mA(s7+1:s8,1),mA(s7+1:s8,2),mA(s7+1:s8,3),'MarkerEdgeColor','black','Marker','+')
scatter3(mA(s8+1:s9,1),mA(s8+1:s9,2),mA(s8+1:s9,3),'MarkerEdgeColor','red','Marker','+')
scatter3(mA(s9+1:s10,1),mA(s9+1:s10,2),mA(s9+1:s10,3),'MarkerEdgeColor','blue','Marker','+')
scatter3(mA(s10+1:s11,1),mA(s10+1:s11,2),mA(s10+1:s11,3),'MarkerEdgeColor','green','Marker','+')
scatter3(mA(s11+1:s12,1),mA(s11+1:s12,2),mA(s11+1:s12,3),'MarkerEdgeColor','magenta','Marker','+')
scatter3(mA(s12+1:s13,1),mA(s12+1:s13,2),mA(s12+1:s13,3),'MarkerEdgeColor','magenta','Marker','v')
scatter3(mA(s13+1:s14,1),mA(s13+1:s14,2),mA(s13+1:s14,3),'MarkerEdgeColor','red','Marker','v')
scatter3(mA(s14+1:s15,1),mA(s14+1:s15,2),mA(s14+1:s15,3),'MarkerEdgeColor','blue','Marker','v')
scatter3(mA(s15+1:s16,1),mA(s15+1:s16,2),mA(s15+1:s16,3),'MarkerEdgeColor','green','Marker','v')
scatter3(mA(s16+1:s17,1),mA(s16+1:s17,2),mA(s16+1:s17,3),'MarkerEdgeColor','black','Marker','v')
scatter3(mA(s17+1:s18,1),mA(s17+1:s18,2),mA(s17+1:s18,3),'MarkerEdgeColor','yellow','Marker','v')
legend('class1','class2','class3','class4','class5','class6','class7','class8','class9','class10','class11','class12','class13','class14','class15','class16','class17','class18')
savefig(strcat('C:\Engineering part IIB\4th year project\Excel data\medical data\nymi\',num2str(nobeats),' beats\fig',num2str(testno)))

%compute mean and standard deviation for each class
%mu is for each class, stddev is for each class for each feature(matrix)
%and normSTD is the std dev for each class(second norm)
classWindows=[s1train;s2train;s3train;s4train;s5train;s6train;s7train;s8train;s9train;s10train];
classWindows=[classWindows;s11train;s12train;s13train;s14train;s15train;s16train;s17train;s18train];
%classWindows=[size(r1,2);size(r2,2);size(r3,2);size(r4,2);size(r5,2);size(r6,2);size(r7,2);size(r8,2);size(r9,2);size(r10,2)];%matrix with number of windows per class
%classWindows=[classWindows; size(r11,2);size(r12,2);size(r13,2);size(r14,2);size(r15,2);size(r16,2);size(r17,2);size(r18,2)];
[mu,stddev,normSTD]=MAndSTD(nofeatures,noclasses,mA,classWindows);

%define matrix for testing
t1=r1(:,s1train:size(r1,2));
t2=r2(:,s2train:size(r2,2));
t3=r3(:,s3train:size(r3,2));
t4=r4(:,s4train:size(r4,2));
t5=r5(:,s5train:size(r5,2));
t6=r6(:,s6train:size(r6,2));
t7=r7(:,s7train:size(r7,2));
t8=r8(:,s8train:size(r8,2));
t9=r9(:,s9train:size(r9,2));
t10=r10(:,s10train:size(r10,2));
t11=r11(:,s11train:size(r11,2));
t12=r12(:,s12train:size(r12,2));
t13=r13(:,s13train:size(r13,2));
t14=r14(:,s14train:size(r14,2));
t15=r15(:,s15train:size(r15,2));
t16=r16(:,s16train:size(r16,2));
t17=r17(:,s17train:size(r17,2));
t18=r18(:,s18train:size(r18,2));
%build matrix for testing Y(in the reduced space), X normal space
[X1,Y1]=buildTestMatrix(t1,windowlength,1,size(t1,2),mp); 
[X2,Y2]=buildTestMatrix(t2,windowlength,1,size(t2,2),mp); 
[X3,Y3]=buildTestMatrix(t3,windowlength,1,size(t3,2),mp); 
[X4,Y4]=buildTestMatrix(t4,windowlength,1,size(t4,2),mp); 
[X5,Y5]=buildTestMatrix(t5,windowlength,1,size(t5,2),mp); 
[X6,Y6]=buildTestMatrix(t6,windowlength,1,size(t6,2),mp); 
[X7,Y7]=buildTestMatrix(t7,windowlength,1,size(t7,2),mp); 
[X8,Y8]=buildTestMatrix(t8,windowlength,1,size(t8,2),mp); 
[X9,Y9]=buildTestMatrix(t9,windowlength,1,size(t9,2),mp); 
[X10,Y10]=buildTestMatrix(t10,windowlength,1,size(t10,2),mp);
[X11,Y11]=buildTestMatrix(t11,windowlength,1,size(t11,2),mp);
[X12,Y12]=buildTestMatrix(t12,windowlength,1,size(t12,2),mp);
[X13,Y13]=buildTestMatrix(t13,windowlength,1,size(t13,2),mp);
[X14,Y14]=buildTestMatrix(t14,windowlength,1,size(t14,2),mp);
[X15,Y15]=buildTestMatrix(t15,windowlength,1,size(t15,2),mp);
[X16,Y16]=buildTestMatrix(t16,windowlength,1,size(t16,2),mp);
[X17,Y17]=buildTestMatrix(t17,windowlength,1,size(t17,2),mp);
[X18,Y18]=buildTestMatrix(t18,windowlength,1,size(t18,2),mp);

%compute classification for training data where correct is no of times
%person was correctly identified 

correctMatrix=zeros(noclasses,noclasses);
correct2Mat=zeros(noclasses,noclasses);
totalAccepted=zeros(noclasses,noclasses);
percAcc=zeros(noclasses,noclasses);
correctBatch=zeros(noclasses,noclasses);
totalBatch=zeros(noclasses,noclasses);
for j=1:noclasses
    if j==1
        Y=Y1;
    end
    if j==2
        Y=Y2;
    end
    if j==3
        Y=Y3;
    end
    if j==4
        Y=Y4;
    end
    if j==5
        Y=Y5;
    end
    if j==6
        Y=Y6;
    end
     if j==7
        Y=Y7;
    end
    if j==8
        Y=Y8;
    end
     if j==9
        Y=Y9;
     end
     if j==10
        Y=Y10;
     end
     if j==11
        Y=Y11;
     end
     if j==12
        Y=Y12;
     end
     if j==13
        Y=Y13;
     end
     if j==14
        Y=Y14;
     end
     if j==15
        Y=Y15;
     end
     if j==16
        Y=Y16;
     end
     if j==15
        Y=Y17;
     end
     if j==18
        Y=Y18;
    end
   
    for i=1:noclasses
        [label,score,cost,correctMatrix(j,i),correct2Mat(j,i),totalAccepted(j,i),percAcc(j,i),correctBatch(j,i),totalBatch(j,i)]=kNNV2(noclasses,Y,Mdl,i,mu,stddev,3,normSTD);
    end
end
% figure
% imagesc(correctBatch)
% colorbar
% xlswrite('C:\Users\Roxana\Desktop\MEDcorrectMatrix.xlsx',correctMatrix)
% xlswrite('C:\Users\Roxana\Desktop\MEDcorrectBatch.xlsx',correctBatch)
% xlswrite('C:\Users\Roxana\Desktop\MEDtotalBatch.xlsx',totalBatch)

%compute falseneg and falsepos
falsepos=zeros(1,noclasses);
falseneg=zeros(1,noclasses)';
for i=1:noclasses
    falsepos(i)=sum(correctBatch(:,i))-correctBatch(i,i);
    falseneg(i)=100-correctBatch(i,i);
end


rowheader={'P1','P2','P3','P4','P5','P6','P7','P8','P9','P10','P11','P12','P13','P14','P15','P16','P17','P18','False negatives','','Total batches'};
columnheader={'P1';'P2';'P3';'P4';'P5';'P6';'P7';'P8';'P9';'P10';'P11';'P12';'P13';'P14';'P15';'P16';'P17';'P18';'False positives'};
sfilename=strcat('C:\Engineering part IIB\4th year project\Excel data\medical data\nymi\',num2str(nobeats),' beats\test');
stest=num2str(testno);
sextension='.xlsx';
s=strcat(sfilename,stest,sextension);
xlswrite(s,details,1,'A1')
xlswrite(s,rowheader,1,'B6')
xlswrite(s,columnheader,1,'A7')
xlswrite(s,correctBatch,1,'B7')
xlswrite(s,totalBatch(:,1),1,'V7')
xlswrite(s,correctMatrix,2,'B2')
xlswrite(s,falsepos,1,'B25')
xlswrite(s,falseneg,1,'T7')
figure; imagesc(correctBatch)
colorbar
savefig(strcat('C:\Engineering part IIB\4th year project\Excel data\medical data\nymi\',num2str(nobeats),' beats\colorbar',num2str(testno)))
end
