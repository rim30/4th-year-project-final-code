clear all
nobeats=3;%no beats per window
windowlength=300;%no samples per window
smoothamount=4;
neighbours=5;%kNN neighbours
noclasses=20;%number of classes analysed
%load rawsignals and split into beats
load_data_before_lda
%reduce number of dimensions kept and save results
% for trial=9:9  
% testno=100;
% nofeatures=trial;%features kept after lda
nofeatures=9;
details={'noclasses',noclasses;'nobeats',nobeats;'window length',windowlength;'nofeatures',nofeatures};
% %load train data
% ACF_ON=0; %use autocorrelation function
% [rawsignal1,beats1]=loadDat('C:\Users\Roxana\OneDrive\ECG collected\Person 1\',nobeats,windowlength,smoothamount);
% [rawsignal2,beats2]=loadDat('C:\Users\Roxana\OneDrive\ECG collected\Person 2\',nobeats,windowlength,smoothamount);
% [rawsignal3,beats3]=loadDat('C:\Users\Roxana\OneDrive\ECG collected\Person 3\',nobeats,windowlength,smoothamount);
% [rawsignal4,beats4]=loadDat('C:\Users\Roxana\OneDrive\ECG collected\Person 4\',nobeats,windowlength,smoothamount);
% [rawsignal5,beats5]=loadDat('C:\Users\Roxana\OneDrive\ECG collected\Person 5\',nobeats,windowlength,smoothamount);
% [rawsignal6,beats6]=loadDat('C:\Users\Roxana\OneDrive\ECG collected\Person 6\',nobeats,windowlength,smoothamount);
% [rawsignal7,beats7]=loadDat('C:\Users\Roxana\OneDrive\ECG collected\Person 7\',nobeats,windowlength,smoothamount);
% [rawsignal8,beats8]=loadDat('C:\Users\Roxana\OneDrive\ECG collected\Person 8\',nobeats,windowlength,smoothamount);
% [rawsignal9,beats9]=loadDat('C:\Users\Roxana\OneDrive\ECG collected\Person 9\',nobeats,windowlength,smoothamount);
% [rawsignal10,beats10]=loadDat('C:\Users\Roxana\OneDrive\ECG collected\Person 10\',nobeats,windowlength,smoothamount);
% [rawsignal11,beats11]=loadDat('C:\Users\Roxana\OneDrive\ECG collected\Person 11\',nobeats,windowlength,smoothamount);
% [rawsignal12,beats12]=loadDat('C:\Users\Roxana\OneDrive\ECG collected\Person 12\',nobeats,windowlength,smoothamount);
% [rawsignal13,beats13]=loadDat('C:\Users\Roxana\OneDrive\ECG collected\Person 13\',nobeats,windowlength,smoothamount);
% [rawsignal14,beats14]=loadDat('C:\Users\Roxana\OneDrive\ECG collected\Person 14\',nobeats,windowlength,smoothamount);
% [rawsignal15,beats15]=loadDat('C:\Users\Roxana\OneDrive\ECG collected\Person 15\',nobeats,windowlength,smoothamount);
% [rawsignal16,beats16]=loadDat('C:\Users\Roxana\OneDrive\ECG collected\Person 16\',nobeats,windowlength,smoothamount);
% [rawsignal17,beats17]=loadDat('C:\Users\Roxana\OneDrive\ECG collected\Person 17\',nobeats,windowlength,smoothamount);
% [rawsignal18,beats18]=loadDat('C:\Users\Roxana\OneDrive\ECG collected\Person 18\',nobeats,windowlength,smoothamount);
% [rawsignal19,beats19]=loadDat('C:\Users\Roxana\OneDrive\ECG collected\Person 19\',nobeats,windowlength,smoothamount);
% [rawsignal20,beats20]=loadDat('C:\Users\Roxana\OneDrive\ECG collected\Person 20\',nobeats,windowlength,smoothamount);
% 
% if ACF_ON==0
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
%     r19=beats19';
%     r20=beats20';
%    
% else
%     %compute autocorrelation for training
%     r1=my_autocorr(beats1);
%     r2=my_autocorr(beats2);
%     r3=my_autocorr(beats3);
%     r4=my_autocorr(beats4);
%     r5=my_autocorr(beats5);
%     r6=my_autocorr(beats6);
%     r7=my_autocorr(beats7);
%     r8=my_autocorr(beats8);
%     r9=my_autocorr(beats9);
%     r10=my_autocorr(beats10);
%     r11=my_autocorr(beats11);
%     r12=my_autocorr(beats12);
%     r13=my_autocorr(beats13);
%     r14=my_autocorr(beats14);
%     r15=my_autocorr(beats15);
%     r16=my_autocorr(beats16);
%     r17=my_autocorr(beats17);
%     r18=my_autocorr(beats18);
%     r19=my_autocorr(beats19);
%     r20=my_autocorr(beats20);
% end
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
% s19train=ceil(2/3*size(r19,2)); s19test=size(r19,2)-s19train;
% s20train=ceil(2/3*size(r20,2)); s20test=size(r20,2)-s20train;
% noTwindows=s1train+s2train+s3train+s4train+s5train+s6train+s7train+s8train+s9train;%total no of windows
% noTwindows=noTwindows+s10train+s11train+s12train+s13train+s14train+s15train+s16train+s17train+s18train+s19train+s20train;
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
% s19=s18+s19train;
% s20=s19+s20train;
% 
% %build matrix for training
% A1=zeros(noTwindows,windowlength+1);
% %set labels
% A1(1:s1,1)=1;
% A1(s1+1:s2,1)=2;
% A1(s2+1:s3,1)=3;
% A1(s3+1:s4,1)=4;
% A1(s4+1:s5,1)=5;
% A1(s5+1:s6,1)=6;
% A1(s6+1:s7,1)=7;
% A1(s7+1:s8,1)=8;
% A1(s8+1:s9,1)=9;
% A1(s9+1:s10,1)=10;
% A1(s10+1:s11,1)=11;
% A1(s11+1:s12,1)=12;
% A1(s12+1:s13,1)=13;
% A1(s13+1:s14,1)=14;
% A1(s14+1:s15,1)=15;
% A1(s15+1:s16,1)=16;
% A1(s16+1:s17,1)=17;
% A1(s17+1:s18,1)=18;
% A1(s18+1:s19,1)=19;
% A1(s19+1:s20,1)=20;
% %input windows into matrix from different people
% A1(1:s1,2:(windowlength+1))=r1(1:windowlength,1:s1train)';
% A1(s1+1:s2,2:(windowlength+1))=r2(1:windowlength,1:s2train)';
% A1(s2+1:s3,2:(windowlength+1))=r3(1:windowlength,1:s3train)';
% A1(s3+1:s4,2:(windowlength+1))=r4(1:windowlength,1:s4train)';
% A1(s4+1:s5,2:(windowlength+1))=r5(1:windowlength,1:s5train)';
% A1(s5+1:s6,2:(windowlength+1))=r6(1:windowlength,1:s6train)';
% A1(s6+1:s7,2:(windowlength+1))=r7(1:windowlength,1:s7train)';
% A1(s7+1:s8,2:(windowlength+1))=r8(1:windowlength,1:s8train)';
% A1(s8+1:s9,2:(windowlength+1))=r9(1:windowlength,1:s9train)';
% A1(s9+1:s10,2:(windowlength+1))=r10(1:windowlength,1:s10train)';
% A1(s10+1:s11,2:(windowlength+1))=r11(1:windowlength,1:s11train)';
% A1(s11+1:s12,2:(windowlength+1))=r12(1:windowlength,1:s12train)';
% A1(s12+1:s13,2:(windowlength+1))=r13(1:windowlength,1:s13train)';
% A1(s13+1:s14,2:(windowlength+1))=r14(1:windowlength,1:s14train)';
% A1(s14+1:s15,2:(windowlength+1))=r15(1:windowlength,1:s15train)';
% A1(s15+1:s16,2:(windowlength+1))=r16(1:windowlength,1:s16train)';
% A1(s16+1:s17,2:(windowlength+1))=r17(1:windowlength,1:s17train)';
% A1(s17+1:s18,2:(windowlength+1))=r18(1:windowlength,1:s18train)';
% A1(s18+1:s19,2:(windowlength+1))=r19(1:windowlength,1:s19train)';
% A1(s19+1:s20,2:(windowlength+1))=r20(1:windowlength,1:s20train)';
% 

[mA1,mp] = compute_mapping(A1,'LDA',nofeatures); %do dim red
Mdl = fitcknn(mA1,A1(:,1),'NumNeighbors',neighbours); %perform classification
% Mdl = fitcknn(mA1,A1(:,1),'NumNeighbors',5,'Standardize',1); %perform classification

%mA1=filter(1/8*ones(1,8),1,mA1); %smooth output by taking 3 samples for the moving average

 %plot 3D figure after lda
% figure(1)
% scatter3(mA1(1:s1,1),mA1(1:s1,2),mA1(1:s1,3),'MarkerEdgeColor','red')
% hold on
% scatter3(mA1(s1+1:s2,1),mA1(s1+1:s2,2),mA1(s1+1:s2,3),'MarkerEdgeColor','blue')
% scatter3(mA1(s2+1:s3,1),mA1(s2+1:s3,2),mA1(s2+1:s3,3),'MarkerEdgeColor','green')
% scatter3(mA1(s3+1:s4,1),mA1(s3+1:s4,2),mA1(s3+1:s4,3),'MarkerEdgeColor','magenta')
% scatter3(mA1(s4+1:s5,1),mA1(s4+1:s5,2),mA1(s4+1:s5,3),'MarkerEdgeColor','black')
% scatter3(mA1(s5+1:s6,1),mA1(s5+1:s6,2),mA1(s5+1:s6,3),'MarkerEdgeColor','cyan')
% scatter3(mA1(s6+1:s7,1),mA1(s6+1:s7,2),mA1(s6+1:s7,3),'MarkerEdgeColor','yellow')
% scatter3(mA1(s7+1:s8,1),mA1(s7+1:s8,2),mA1(s7+1:s8,3),'s','MarkerEdgeColor','magenta')
% scatter3(mA1(s8+1:s9,1),mA1(s8+1:s9,2),mA1(s8+1:s9,3),'s','MarkerEdgeColor','cyan')
% scatter3(mA1(s9+1:s10,1),mA1(s9+1:s10,2),mA1(s9+1:s10,3),'s','MarkerEdgeColor','red')
% scatter3(mA1(s10+1:s11,1),mA1(s10+1:s11,2),mA1(s10+1:s11,3),'s','MarkerEdgeColor','blue')
% scatter3(mA1(s11+1:s12,1),mA1(s11+1:s12,2),mA1(s11+1:s12,3),'s','MarkerEdgeColor','green')
% scatter3(mA1(s12+1:s13,1),mA1(s12+1:s13,2),mA1(s12+1:s13,3),'s','MarkerEdgeColor','black')
% scatter3(mA1(s13+1:s14,1),mA1(s13+1:s14,2),mA1(s13+1:s14,3),'s','MarkerEdgeColor','yellow')
% scatter3(mA1(s14+1:s15,1),mA1(s14+1:s15,2),mA1(s14+1:s15,3),'*','MarkerEdgeColor','black')
% scatter3(mA1(s15+1:s16,1),mA1(s15+1:s16,2),mA1(s15+1:s16,3),'*','MarkerEdgeColor','red')
% scatter3(mA1(s16+1:s17,1),mA1(s16+1:s17,2),mA1(s16+1:s17,3),'*','MarkerEdgeColor','blue')
% scatter3(mA1(s17+1:s18,1),mA1(s17+1:s18,2),mA1(s17+1:s18,3),'*','MarkerEdgeColor','black')
% scatter3(mA1(s18+1:s19,1),mA1(s18+1:s19,2),mA1(s18+1:s19,3),'*','MarkerEdgeColor','cyan')
% scatter3(mA1(s19+1:s20,1),mA1(s19+1:s20,2),mA1(s19+1:s20,3),'*','MarkerEdgeColor','green')
% 
% legend('class1','class2','class3','class4','class5','class6','class7','class8','class9','class10','class11','class12','class13','class14','class15','class16','class17','class18','class19','class20')
% 
% savefig(strcat('C:\Engineering part IIB\4th year project\Excel data\nonstandardised\',num2str(nobeats),' beat\fig',num2str(testno)))

%compute mean and standard deviation for each class
%mu is for each class, stddev is for each class for each feature(matrix)
%and normSTD is the std dev for each class(second norm)
classWindows=[s1train;s2train;s3train;s4train;s5train;s6train;s7train;s8train;s9train;s10train];
classWindows=[classWindows;s11train;s12train;s13train;s14train;s15train;s16train;s17train;s18train;s19train;s20train];
%matrix with number of windows per class
[mu,stddev,normSTD]=MAndSTD(nofeatures,noclasses,mA1,classWindows);

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
t19=r19(:,s19train:size(r19,2));
t20=r20(:,s20train:size(r20,2));

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
[X19,Y19]=buildTestMatrix(t19,windowlength,1,size(t19,2),mp); 
[X20,Y20]=buildTestMatrix(t20,windowlength,1,size(t20,2),mp); 

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
     if j==17
        Y=Y17;
     end
    if j==18
        Y=Y18;
    end
    if j==19
        Y=Y19;
    end
    if j==20
        Y=Y20;
    end
   
    for i=1:noclasses
        [label,score,cost,correctMatrix(j,i),correct2Mat(j,i),totalAccepted(j,i),percAcc(j,i),correctBatch(j,i),totalBatch(j,i)]=kNNV2(noclasses,Y,Mdl,i,mu,stddev,3,normSTD);
    end
end
%compute falseneg and falsepos
falsepos=zeros(1,noclasses);
falseneg=zeros(1,noclasses)';
for i=1:noclasses
    falsepos(i)=sum(correctBatch(:,i))-correctBatch(i,i);
    falseneg(i)=100-correctBatch(i,i);
end
% xlswrite('C:\Engineering part IIB\4th year project\Excel data\test12RawData.xlsx',correctMatrix)
% xlswrite('C:\Engineering part IIB\4th year project\Excel data\test12CorrectBatch.xlsx',correctBatch)
% xlswrite('C:\Engineering part IIB\4th year project\Excel data\test12TotalBatch.xlsx',totalBatch)
rowheader={'P1','P2','P3','P4','P5','P6','P7','P8','P9','P10','P11','P12','P13','P14','P15','P16','P17','P18','P19','P20','False negatives','','Total batches'};
columnheader={'P1';'P2';'P3';'P4';'P5';'P6';'P7';'P8';'P9';'P10';'P11';'P12';'P13';'P14';'P15';'P16';'P17';'P18';'P19';'P20';'False positives'};
%sfilename=strcat('C:\Engineering part IIB\4th year project\Excel data\',num2str(nobeats),' beats new\test');
sfilename=strcat('C:\Engineering part IIB\4th year project\Excel data\M2_addingclasses');
% stest=num2str(testno);
% sextension='.xlsx';
% s=strcat(sfilename,stest,sextension);
% s=strcat(sfilename,stest,sextension);
s='C:\Engineering part IIB\4th year project\Excel data\M2_addingclasses\changing_classes';
xlswrite(s,details,8,'A1')
xlswrite(s,rowheader,8,'B6')
xlswrite(s,columnheader,8,'A7')
xlswrite(s,correctBatch,8,'B7')
xlswrite(s,totalBatch(:,1),8,'X7')
% xlswrite(s,correctMatrix,2,'B2')
% xlswrite(s,falsepos,3,'B27')
xlswrite(s,falseneg,8,'V7')
figure; imagesc(correctBatch)
colorbar
% savefig(strcat('C:\Engineering part IIB\4th year project\Excel data\',num2str(nobeats),' beats new\colorbar',num2str(testno)))
savefig(strcat(s,num2str(noclasses),'classes',num2str(nofeatures),'features'))
%end


