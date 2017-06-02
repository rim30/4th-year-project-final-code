%load rawsignals and split into beats

nobeats=1;%no beats per window
windowlength=200;%no samples per window
smoothamount=4;
nofeatures=3;%features kept after lda
noclasses=19;%number of classes analysed
%load train data
ACF_ON=0; %use autocorrelation function
[rawsignal1,beats1]=loadDat('C:\Users\Roxana\OneDrive\ECG collected\P1 train\',nobeats,windowlength,smoothamount);
[rawsignal2,beats2]=loadDat('C:\Users\Roxana\OneDrive\ECG collected\P2 train\',nobeats,windowlength,smoothamount);
[rawsignal3,beats3]=loadDat('C:\Users\Roxana\OneDrive\ECG collected\P3 train\',nobeats,windowlength,smoothamount);
[rawsignal4,beats4]=loadDat('C:\Users\Roxana\OneDrive\ECG collected\P4 train\',nobeats,windowlength,smoothamount);
[rawsignal5,beats5]=loadDat('C:\Users\Roxana\OneDrive\ECG collected\P5 train\',nobeats,windowlength,smoothamount);
[rawsignal6,beats6]=loadDat('C:\Users\Roxana\OneDrive\ECG collected\P6 train\',nobeats,windowlength,smoothamount);
[rawsignal7,beats7]=loadDat('C:\Users\Roxana\OneDrive\ECG collected\P7 train\',nobeats,windowlength,smoothamount);
[rawsignal8,beats8]=loadDat('C:\Users\Roxana\OneDrive\ECG collected\P8 train\',nobeats,windowlength,smoothamount);
[rawsignal9,beats9]=loadDat('C:\Users\Roxana\OneDrive\ECG collected\P9 train\',nobeats,windowlength,smoothamount);
[rawsignal10,beats10]=loadDat('C:\Users\Roxana\OneDrive\ECG collected\P10 train\',nobeats,windowlength,smoothamount);
[rawsignal11,beats11]=loadDat('C:\Users\Roxana\OneDrive\ECG collected\P11 train\',nobeats,windowlength,smoothamount);
[rawsignal12,beats12]=loadDat('C:\Users\Roxana\OneDrive\ECG collected\P12 train\',nobeats,windowlength,smoothamount);
[rawsignal13,beats13]=loadDat('C:\Users\Roxana\OneDrive\ECG collected\P13 train\',nobeats,windowlength,smoothamount);
[rawsignal14,beats14]=loadDat('C:\Users\Roxana\OneDrive\ECG collected\P14 train\',nobeats,windowlength,smoothamount);
[rawsignal15,beats15]=loadDat('C:\Users\Roxana\OneDrive\ECG collected\P15 train\',nobeats,windowlength,smoothamount);
[rawsignal16,beats16]=loadDat('C:\Users\Roxana\OneDrive\ECG collected\P16 train\',nobeats,windowlength,smoothamount);
[rawsignal17,beats17]=loadDat('C:\Users\Roxana\OneDrive\ECG collected\P17 train\',nobeats,windowlength,smoothamount);
[rawsignal18,beats18]=loadDat('C:\Users\Roxana\OneDrive\ECG collected\P18 train\',nobeats,windowlength,smoothamount);
[rawsignal19,beats19]=loadDat('C:\Users\Roxana\OneDrive\ECG collected\P19 train\',nobeats,windowlength,smoothamount);
%load test data
[rawtest1,btest1]=loadDat('C:\Users\Roxana\OneDrive\ECG collected\P1 test\',nobeats,windowlength,smoothamount);
[rawtest2,btest2]=loadDat('C:\Users\Roxana\OneDrive\ECG collected\P2 test\',nobeats,windowlength,smoothamount);
[rawtest3,btest3]=loadDat('C:\Users\Roxana\OneDrive\ECG collected\P3 test\',nobeats,windowlength,smoothamount);
[rawtest4,btest4]=loadDat('C:\Users\Roxana\OneDrive\ECG collected\P4 test\',nobeats,windowlength,smoothamount);
[rawtest5,btest5]=loadDat('C:\Users\Roxana\OneDrive\ECG collected\P5 test\',nobeats,windowlength,smoothamount);
[rawtest6,btest6]=loadDat('C:\Users\Roxana\OneDrive\ECG collected\P6 test\',nobeats,windowlength,smoothamount);
[rawtest7,btest7]=loadDat('C:\Users\Roxana\OneDrive\ECG collected\P7 test\',nobeats,windowlength,smoothamount);
[rawtest8,btest8]=loadDat('C:\Users\Roxana\OneDrive\ECG collected\P8 test\',nobeats,windowlength,smoothamount);
[rawtest9,btest9]=loadDat('C:\Users\Roxana\OneDrive\ECG collected\P9 test\',nobeats,windowlength,smoothamount);
[rawtest10,btest10]=loadDat('C:\Users\Roxana\OneDrive\ECG collected\P10 test\',nobeats,windowlength,smoothamount);
[rawtest11,btest11]=loadDat('C:\Users\Roxana\OneDrive\ECG collected\P11 test\',nobeats,windowlength,smoothamount);
[rawtest12,btest12]=loadDat('C:\Users\Roxana\OneDrive\ECG collected\P12 test\',nobeats,windowlength,smoothamount);
[rawtest13,btest13]=loadDat('C:\Users\Roxana\OneDrive\ECG collected\P13 test\',nobeats,windowlength,smoothamount);
[rawtest14,btest14]=loadDat('C:\Users\Roxana\OneDrive\ECG collected\P14 test\',nobeats,windowlength,smoothamount);
[rawtest15,btest15]=loadDat('C:\Users\Roxana\OneDrive\ECG collected\P15 test\',nobeats,windowlength,smoothamount);
[rawtest16,btest16]=loadDat('C:\Users\Roxana\OneDrive\ECG collected\P16 test\',nobeats,windowlength,smoothamount);
[rawtest17,btest17]=loadDat('C:\Users\Roxana\OneDrive\ECG collected\P17 test\',nobeats,windowlength,smoothamount);
[rawtest18,btest18]=loadDat('C:\Users\Roxana\OneDrive\ECG collected\P18 test\',nobeats,windowlength,smoothamount);
[rawtest19,btest19]=loadDat('C:\Users\Roxana\OneDrive\ECG collected\P19 test\',nobeats,windowlength,smoothamount);
if ACF_ON==0
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
    r19=beats19';
    
    t1=btest1';
    t2=btest2';
    t3=btest3';
    t4=btest4';
    t5=btest5';
    t6=btest6';
    t7=btest7';
    t8=btest8';
    t9=btest9';
    t10=btest10';
    t11=btest11';
    t12=btest12';
    t13=btest13';
    t14=btest14';
    t15=btest15';
    t16=btest16';
    t17=btest17';
    t18=btest18';
    t19=btest19';
   
else
    %compute autocorrelation for training
    r1=my_autocorr(beats1);
    r2=my_autocorr(beats2);
    r3=my_autocorr(beats3);
    r4=my_autocorr(beats4);
    r5=my_autocorr(beats5);
    r6=my_autocorr(beats6);
    r7=my_autocorr(beats7);
    r8=my_autocorr(beats8);
    r9=my_autocorr(beats9);
    r10=my_autocorr(beats10);
    r11=my_autocorr(beats11);
    r12=my_autocorr(beats12);
    r13=my_autocorr(beats13);
    r14=my_autocorr(beats14);
    r15=my_autocorr(beats15);
    r16=my_autocorr(beats16);
    r17=my_autocorr(beats17);
    r18=my_autocorr(beats18);
    r19=my_autocorr(beats19);
    %compute autocorrelation for testing
    t1=my_autocorr(btest1);
    t2=my_autocorr(btest2);
    t3=my_autocorr(btest3);
    t4=my_autocorr(btest4);
    t5=my_autocorr(btest5);
    t6=my_autocorr(btest6);
    t7=my_autocorr(btest7);
    t8=my_autocorr(btest8);
    t9=my_autocorr(btest9);
    t10=my_autocorr(btest10);
    t11=my_autocorr(btest11);
    t12=my_autocorr(btest12);
    t13=my_autocorr(btest13);
    t14=my_autocorr(btest14);
    t15=my_autocorr(btest15);
    t16=my_autocorr(btest16);
    t17=my_autocorr(btest17);
    t18=my_autocorr(btest18);
    t19=my_autocorr(btest19);
   
end

%define matrix for lda input
%define size for matrix
noTwindows=size(r1,2)+size(r2,2)+size(r3,2)+size(r4,2)+size(r5,2)+size(r6,2)+size(r7,2)+size(r8,2)+size(r9,2)+size(r10,2)+size(r11,2)+size(r12,2)+size(r13,2)+size(r14,2)+size(r15,2)+size(r16,2)+size(r17,2)+size(r18,2)+size(r19,2);
% noTwindows=noTwindows;
% noTwindows=noTwindows%total no of windows
s1=size(r1,2);
s2=s1+size(r2,2);
s3=s2+size(r3,2);
s4=s3+size(r4,2);
s5=s4+size(r5,2);
s6=s5+size(r6,2);
s7=s6+size(r7,2);
s8=s7+size(r8,2);
s9=s8+size(r9,2);
s10=s9+size(r10,2);
s11=s10+size(r11,2);
s12=s11+size(r12,2);
s13=s12+size(r13,2);
s14=s13+size(r14,2);
s15=s14+size(r15,2);
s16=s15+size(r16,2);
s17=s16+size(r17,2);
s18=s17+size(r18,2);
s19=s18+size(r19,2);

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
A1(s8+1:s9,1)=9;
A1(s9+1:s10,1)=10;
A1(s10+1:s11,1)=11;
A1(s11+1:s12,1)=12;
A1(s12+1:s13,1)=13;
A1(s13+1:s14,1)=14;
A1(s14+1:s15,1)=15;
A1(s15+1:s16,1)=16;
A1(s16+1:s17,1)=17;
A1(s17+1:s18,1)=18;
A1(s18+1:s19,1)=19;
%input windows into matrix from different people
A1(1:s1,2:(windowlength+1))=r1(1:windowlength,:)';
A1(s1+1:s2,2:(windowlength+1))=r2(1:windowlength,:)';
A1(s2+1:s3,2:(windowlength+1))=r3(1:windowlength,:)';
A1(s3+1:s4,2:(windowlength+1))=r4(1:windowlength,:)';
A1(s4+1:s5,2:(windowlength+1))=r5(1:windowlength,:)';
A1(s5+1:s6,2:(windowlength+1))=r6(1:windowlength,:)';
A1(s6+1:s7,2:(windowlength+1))=r7(1:windowlength,:)';
A1(s7+1:s8,2:(windowlength+1))=r8(1:windowlength,:)';
A1(s8+1:s9,2:(windowlength+1))=r9(1:windowlength,:)';
A1(s9+1:s10,2:(windowlength+1))=r10(1:windowlength,:)';
A1(s10+1:s11,2:(windowlength+1))=r11(1:windowlength,:)';
A1(s11+1:s12,2:(windowlength+1))=r12(1:windowlength,:)';
A1(s12+1:s13,2:(windowlength+1))=r13(1:windowlength,:)';
A1(s13+1:s14,2:(windowlength+1))=r14(1:windowlength,:)';
A1(s14+1:s15,2:(windowlength+1))=r15(1:windowlength,:)';
A1(s15+1:s16,2:(windowlength+1))=r16(1:windowlength,:)';
A1(s16+1:s17,2:(windowlength+1))=r17(1:windowlength,:)';
A1(s17+1:s18,2:(windowlength+1))=r18(1:windowlength,:)';
A1(s18+1:s19,2:(windowlength+1))=r19(1:windowlength,:)';


[mA1,mp] = compute_mapping(A1,'LDA',nofeatures); %do dim red
Mdl = fitcknn(mA1,A1(:,1),'NumNeighbors',5,'Standardize',1); %perform classification
%mA1=filter(1/8*ones(1,8),1,mA1); %smooth output by taking 3 samples for the moving average

%plot 3D figure after lda
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
scatter3(mA1(s8+1:s9,1),mA1(s8+1:s9,2),mA1(s8+1:s9,3),'s','MarkerEdgeColor','cyan')
scatter3(mA1(s9+1:s10,1),mA1(s9+1:s10,2),mA1(s9+1:s10,3),'s','MarkerEdgeColor','red')
scatter3(mA1(s10+1:s11,1),mA1(s10+1:s11,2),mA1(s10+1:s11,3),'s','MarkerEdgeColor','blue')
scatter3(mA1(s11+1:s12,1),mA1(s11+1:s12,2),mA1(s11+1:s12,3),'s','MarkerEdgeColor','green')
scatter3(mA1(s12+1:s13,1),mA1(s12+1:s13,2),mA1(s12+1:s13,3),'s','MarkerEdgeColor','black')
scatter3(mA1(s13+1:s14,1),mA1(s13+1:s14,2),mA1(s13+1:s14,3),'s','MarkerEdgeColor','yellow')
scatter3(mA1(s14+1:s15,1),mA1(s14+1:s15,2),mA1(s14+1:s15,3),'*','MarkerEdgeColor','black')
scatter3(mA1(s15+1:s16,1),mA1(s15+1:s16,2),mA1(s15+1:s16,3),'*','MarkerEdgeColor','red')
scatter3(mA1(s16+1:s17,1),mA1(s16+1:s17,2),mA1(s16+1:s17,3),'*','MarkerEdgeColor','blue')
scatter3(mA1(s17+1:s18,1),mA1(s17+1:s18,2),mA1(s17+1:s18,3),'*','MarkerEdgeColor','black')
scatter3(mA1(s18+1:s19,1),mA1(s18+1:s19,2),mA1(s18+1:s19,3),'*','MarkerEdgeColor','cyan')

legend('class1','class2','class3','class4','class5','class6','class7','class8','class9','class10','class11','class12','class13','class14','class15','class16','class17','class18','class19')


%compute mean and standard deviation for each class
%mu is for each class, stddev is for each class for each feature(matrix)
%and normSTD is the std dev for each class(second norm)
classWindows=[size(r1,2);size(r2,2);size(r3,2);size(r4,2);size(r5,2);size(r6,2);size(r7,2);size(r8,2);size(r9,2);size(r10,2);size(r11,2);size(r12,2);size(r13,2);size(r14,2);size(r15,2);size(r16,2);size(r17,2);size(r18,2);size(r19,2)];
% classWindows=[classWindows;size(r15,2)];
%matrix with number of windows per class
[mu,stddev,normSTD]=MAndSTD(nofeatures,noclasses,mA1,classWindows);
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
    if j==9
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
   
    for i=1:noclasses
        [label,score,cost,correctMatrix(j,i),correct2Mat(j,i),totalAccepted(j,i),percAcc(j,i),correctBatch(j,i),totalBatch(j,i)]=kNNV2(noclasses,Y,Mdl,i,mu,stddev,3,normSTD);
    end
end
% xlswrite('C:\Users\Roxana\Desktop\table1.xlsx',correctMatrix)
% xlswrite('C:\Users\Roxana\Desktop\tableB.xlsx',correctBatch)
% xlswrite('C:\Users\Roxana\Desktop\tableT.xlsx',totalBatch)