clear all
%model parameters
rng(1)
nobeats=1;%no beats per window
windowlength=200;%no samples per window
smoothamount=4;
noclasses=20;%number of classes analysed
nofeatures=25;%no features used for dimensionality reduction
ACF_ON=0;%1 for autocorrelation function, 0 otherwise
load_personal_data
%define size for matrix
s1train=ceil(2/3*size(r1,2)); s1test=size(r1,2)-s1train;
s2train=ceil(2/3*size(r2,2)); s2test=size(r2,2)-s2train;
s3train=ceil(2/3*size(r3,2)); s3test=size(r3,2)-s3train;
s4train=ceil(2/3*size(r4,2)); s4test=size(r4,2)-s4train;
s5train=ceil(2/3*size(r5,2)); s5test=size(r5,2)-s5train;
s6train=ceil(2/3*size(r6,2)); s6test=size(r6,2)-s6train;
s7train=ceil(2/3*size(r7,2)); s7test=size(r7,2)-s7train;
s8train=ceil(2/3*size(r8,2)); s8test=size(r8,2)-s8train;
s9train=ceil(2/3*size(r9,2)); s9test=size(r9,2)-s9train;
%s10train=ceil(2/3*size(r10,2)); s10test=size(r10,2)-s10train;
s11train=ceil(2/3*size(r11,2)); s11test=size(r11,2)-s11train;
s12train=ceil(2/3*size(r12,2)); s12test=size(r12,2)-s12train;
s13train=ceil(2/3*size(r13,2)); s13test=size(r13,2)-s13train;
s14train=ceil(2/3*size(r14,2)); s14test=size(r14,2)-s14train;
s15train=ceil(2/3*size(r15,2)); s15test=size(r15,2)-s15train;
s16train=ceil(2/3*size(r16,2)); s16test=size(r16,2)-s16train;
s17train=ceil(2/3*size(r17,2)); s17test=size(r17,2)-s17train;
s18train=ceil(2/3*size(r18,2)); s18test=size(r18,2)-s18train;
s19train=ceil(2/3*size(r19,2)); s19test=size(r19,2)-s19train;
s20train=ceil(2/3*size(r20,2)); s20test=size(r20,2)-s20train;

noTwindows=s1train+s2train+s3train+s4train+s5train+s6train+s7train+s8train+s9train;%total no of windows
noTwindows=noTwindows+s11train+s12train+s13train+s14train+s15train+s16train+s17train+s18train+s19train+s20train;
s1=s1train; s1t=s1test;
s2=s1+s2train; s22=s1t+s2test;
s3=s2+s3train; s33=s22+s3test;
s4=s3+s4train; s44=s33+s4test;
s5=s4+s5train; s55=s44+s5test;
s6=s5+s6train; s66=s55+s6test;
s7=s6+s7train; s77=s66+s7test;
s8=s7+s8train; s88=s77+s8test;
s9=s8+s9train; s99=s88+s9test;
% s10=s9+s10train; s100=s99+s10test;
% s11=s10+s11train; s110=s100+s11test;
s11=s9+s11train; s110=s99+s11test;
s12=s11+s12train; s120=s110+s12test;
s13=s12+s13train; s130=s120+s13test;
s14=s13+s14train; s140=s130+s14test;
s15=s14+s15train; s150=s140+s15test;
s16=s15+s16train; s160=s150+s16test;
s17=s16+s17train; s170=s160+s17test;
s18=s17+s18train; s180=s170+s18test;
s19=s18+s19train; s190=s180+s19test;
s20=s19+s20train; s200=s190+s20test;
%stest=[s1t s22 s33 s44 s55 s66 s77 s88 s99 s100 s110 s120 s130 s140 s150 s160 s170 s180 s190 s200];%vector with sizes of testing data
stest=[s1t s22 s33 s44 s55 s66 s77 s88 s99 s110 s120 s130 s140 s150 s160 s170 s180 s190 s200];%vector with sizes of testing data

%build matrix for training
X=zeros(noTwindows,windowlength);
Y=zeros(noTwindows,1);


%input windows into matrix from different people
X(1:s1,:)=r1(1:windowlength,1:s1train)';
X(s1+1:s2,:)=r2(1:windowlength,1:s2train)';
X(s2+1:s3,:)=r3(1:windowlength,1:s3train)';
X(s3+1:s4,:)=r4(1:windowlength,1:s4train)';
X(s4+1:s5,:)=r5(1:windowlength,1:s5train)';
X(s5+1:s6,:)=r6(1:windowlength,1:s6train)';
X(s6+1:s7,:)=r7(1:windowlength,1:s7train)';
X(s7+1:s8,:)=r8(1:windowlength,1:s8train)';
X(s8+1:s9,:)=r9(1:windowlength,1:s9train)';
% X(s9+1:s10,:)=r10(1:windowlength,1:s10train)';
% X(s10+1:s11,:)=r11(1:windowlength,1:s11train)';
X(s9+1:s11,:)=r11(1:windowlength,1:s11train)';
X(s11+1:s12,:)=r12(1:windowlength,1:s12train)';
X(s12+1:s13,:)=r13(1:windowlength,1:s13train)';
X(s13+1:s14,:)=r14(1:windowlength,1:s14train)';
X(s14+1:s15,:)=r15(1:windowlength,1:s15train)';
X(s15+1:s16,:)=r16(1:windowlength,1:s16train)';
X(s16+1:s17,:)=r17(1:windowlength,1:s17train)';
X(s17+1:s18,:)=r18(1:windowlength,1:s18train)';
X(s18+1:s19,:)=r19(1:windowlength,1:s19train)';
X(s19+1:s20,:)=r20(1:windowlength,1:s20train)';


[mX,mp] = compute_mapping(X,'PCA',nofeatures); %do dim red
%set vector with sizes of each person's windows to build label vector
%s=[s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 s16 s17 s18 s19 s20];
s=[s1 s2 s3 s4 s5 s6 s7 s8 s9 s11 s12 s13 s14 s15 s16 s17 s18 s19 s20];
Y1=zeros(1,size(X,1));
Y2=zeros(1,size(X,1));
Y3=zeros(1,size(X,1));
Y4=zeros(1,size(X,1));
Y5=zeros(1,size(X,1));
Y6=zeros(1,size(X,1));
Y7=zeros(1,size(X,1));
Y8=zeros(1,size(X,1));
Y9=zeros(1,size(X,1));
% Y10=zeros(1,size(X,1));
Y11=zeros(1,size(X,1));
Y12=zeros(1,size(X,1));
Y13=zeros(1,size(X,1));
Y14=zeros(1,size(X,1));
Y15=zeros(1,size(X,1));
Y16=zeros(1,size(X,1));
Y17=zeros(1,size(X,1));
Y18=zeros(1,size(X,1));
Y19=zeros(1,size(X,1));
Y20=zeros(1,size(X,1));
Y1(1:s1)=1;
Y2(s1+1:s2)=1;
Y3(s2+1:s3)=1;
Y4(s3+1:s4)=1;
Y5(s4+1:s5)=1;
Y6(s5+1:s6)=1;
Y7(s6+1:s7)=1;
Y8(s7+1:s8)=1;
Y9(s8+1:s9)=1;
% Y10(s9+1:s10)=1;
% Y11(s10+1:s11)=1;
Y11(s9+1:s11)=1;
Y12(s11+1:s12)=1;
Y13(s12+1:s13)=1;
Y14(s13+1:s14)=1;
Y15(s14+1:s15)=1;
Y16(s15+1:s16)=1;
Y17(s16+1:s17)=1;
Y18(s17+1:s18)=1;
Y19(s18+1:s19)=1;
Y20(s19+1:s20)=1;
%build SVM model
kernelfunc='RBF';
boxconstr=inf;
kconst=2;%constant to scale kernel scale where ks is the optimum found for each model
%ks=[1.9321    2.3137    2.5181    2.2512    2.7629    2.2843    1.9653    1.7945    2.0017    2.6493    2.0854    2.7238    1.7114    3.3623    2.1847    2.6038    2.9132    2.5043    2.0509    1.8579];

SVMModel1 = fitcsvm(mX,Y1,'Standardize',true,'KernelFunction',kernelfunc,'KernelScale','auto','BoxConstraint',boxconstr); %build svm model
SVMModel2 = fitcsvm(mX,Y2,'Standardize',true,'KernelFunction',kernelfunc,'KernelScale','auto','BoxConstraint',boxconstr); %build svm model
SVMModel3 = fitcsvm(mX,Y3,'Standardize',true,'KernelFunction',kernelfunc,'KernelScale','auto','BoxConstraint',boxconstr); %build svm model
SVMModel4 = fitcsvm(mX,Y4,'Standardize',true,'KernelFunction',kernelfunc,'KernelScale','auto','BoxConstraint',boxconstr); %build svm model
SVMModel5 = fitcsvm(mX,Y5,'Standardize',true,'KernelFunction',kernelfunc,'KernelScale','auto','BoxConstraint',boxconstr); %build svm model
SVMModel6 = fitcsvm(mX,Y6,'Standardize',true,'KernelFunction',kernelfunc,'KernelScale','auto','BoxConstraint',boxconstr); %build svm model
SVMModel7 = fitcsvm(mX,Y7,'Standardize',true,'KernelFunction',kernelfunc,'KernelScale','auto','BoxConstraint',boxconstr); %build svm model
SVMModel8 = fitcsvm(mX,Y8,'Standardize',true,'KernelFunction',kernelfunc,'KernelScale','auto','BoxConstraint',boxconstr); %build svm model
SVMModel9 = fitcsvm(mX,Y9,'Standardize',true,'KernelFunction',kernelfunc,'KernelScale','auto','BoxConstraint',boxconstr); %build svm model
%SVMModel10 = fitcsvm(mX,Y10,'Standardize',true,'KernelFunction',kernelfunc,'KernelScale','auto','BoxConstraint',boxconstr); %build svm model
SVMModel11 = fitcsvm(mX,Y11,'Standardize',true,'KernelFunction',kernelfunc,'KernelScale','auto','BoxConstraint',boxconstr); %build svm model
SVMModel12 = fitcsvm(mX,Y12,'Standardize',true,'KernelFunction',kernelfunc,'KernelScale','auto','BoxConstraint',boxconstr); %build svm model
SVMModel13 = fitcsvm(mX,Y13,'Standardize',true,'KernelFunction',kernelfunc,'KernelScale','auto','BoxConstraint',boxconstr); %build svm model
SVMModel14 = fitcsvm(mX,Y14,'Standardize',true,'KernelFunction',kernelfunc,'KernelScale','auto','BoxConstraint',boxconstr); %build svm model
SVMModel15 = fitcsvm(mX,Y15,'Standardize',true,'KernelFunction',kernelfunc,'KernelScale','auto','BoxConstraint',boxconstr); %build svm model
SVMModel16= fitcsvm(mX,Y16,'Standardize',true,'KernelFunction',kernelfunc,'KernelScale','auto','BoxConstraint',boxconstr); %build svm model
SVMModel17 = fitcsvm(mX,Y17,'Standardize',true,'KernelFunction',kernelfunc,'KernelScale','auto','BoxConstraint',boxconstr); %build svm model
SVMModel18 = fitcsvm(mX,Y18,'Standardize',true,'KernelFunction',kernelfunc,'KernelScale','auto','BoxConstraint',boxconstr); %build svm model
SVMModel19 = fitcsvm(mX,Y19,'Standardize',true,'KernelFunction',kernelfunc,'KernelScale','auto','BoxConstraint',boxconstr); %build svm model
SVMModel20 = fitcsvm(mX,Y20,'Standardize',true,'KernelFunction',kernelfunc,'KernelScale','auto','BoxConstraint',boxconstr); %build svm model

%build testing matrix, starting with selecting the test data
t1=r1(:,s1train:size(r1,2));
t2=r2(:,s2train:size(r2,2));
t3=r3(:,s3train:size(r3,2));
t4=r4(:,s4train:size(r4,2));
t5=r5(:,s5train:size(r5,2));
t6=r6(:,s6train:size(r6,2));
t7=r7(:,s7train:size(r7,2));
t8=r8(:,s8train:size(r8,2));
t9=r9(:,s9train:size(r9,2));
% t10=r10(:,s10train:size(r10,2));
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
% [X10,Y10]=buildTestMatrix(t10,windowlength,1,size(t10,2),mp); 
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

%Ytest=[Y1;Y2;Y3;Y4;Y5;Y6;Y7;Y8;Y9;Y10;Y11;Y12;Y13;Y14;Y15;Y16;Y17;Y18;Y19;Y20];
Ytest=[Y1;Y2;Y3;Y4;Y5;Y6;Y7;Y8;Y9;Y11;Y12;Y13;Y14;Y15;Y16;Y17;Y18;Y19;Y20];
%predict labels using SVM model
predictions1=predict(SVMModel1,Ytest);
predictions2=predict(SVMModel2,Ytest);
predictions3=predict(SVMModel3,Ytest);
predictions4=predict(SVMModel4,Ytest);
predictions5=predict(SVMModel5,Ytest);
predictions6=predict(SVMModel6,Ytest);
predictions7=predict(SVMModel7,Ytest);
predictions8=predict(SVMModel8,Ytest);
predictions9=predict(SVMModel9,Ytest);
% predictions10=predict(SVMModel10,Ytest);
predictions11=predict(SVMModel11,Ytest);
predictions12=predict(SVMModel12,Ytest);
predictions13=predict(SVMModel13,Ytest);
predictions14=predict(SVMModel14,Ytest);
predictions15=predict(SVMModel15,Ytest);
predictions16=predict(SVMModel16,Ytest);
predictions17=predict(SVMModel17,Ytest);
predictions18=predict(SVMModel18,Ytest);
predictions19=predict(SVMModel19,Ytest);
predictions20=predict(SVMModel20,Ytest);
%average 3 predictions at a time
nopred=3;
avgpred1=filter(1/nopred*ones(1,nopred),1,predictions1);
avgpred2=filter(1/nopred*ones(1,nopred),1,predictions2);
avgpred3=filter(1/nopred*ones(1,nopred),1,predictions3);
avgpred4=filter(1/nopred*ones(1,nopred),1,predictions4);
avgpred5=filter(1/nopred*ones(1,nopred),1,predictions5);
avgpred6=filter(1/nopred*ones(1,nopred),1,predictions6);
avgpred7=filter(1/nopred*ones(1,nopred),1,predictions7);
avgpred8=filter(1/nopred*ones(1,nopred),1,predictions8);
avgpred9=filter(1/nopred*ones(1,nopred),1,predictions9);
% avgpred10=filter(1/nopred*ones(1,nopred),1,predictions10);
avgpred11=filter(1/nopred*ones(1,nopred),1,predictions11);
avgpred12=filter(1/nopred*ones(1,nopred),1,predictions12);
avgpred13=filter(1/nopred*ones(1,nopred),1,predictions13);
avgpred14=filter(1/nopred*ones(1,nopred),1,predictions14);
avgpred15=filter(1/nopred*ones(1,nopred),1,predictions15);
avgpred16=filter(1/nopred*ones(1,nopred),1,predictions16);
avgpred17=filter(1/nopred*ones(1,nopred),1,predictions17);
avgpred18=filter(1/nopred*ones(1,nopred),1,predictions18);
avgpred19=filter(1/nopred*ones(1,nopred),1,predictions19);
avgpred20=filter(1/nopred*ones(1,nopred),1,predictions20);
%compute false positives and false negatives for class 1
thereshold=0.3;
falseneg1=sum(avgpred1(1:stest(1))<thereshold);
falseneg1=falseneg1/stest(1);
falsepos1=sum(avgpred1(stest(1)+1:stest(19))<thereshold);
falsepos1=1-falsepos1/(stest(19)-stest(1)-1);

%compute false pos and false neg for the other classes
[falseneg2 falsepos2]=falsePosNeg2(predictions2,stest,2,thereshold);
[falseneg3 falsepos3]=falsePosNeg2(predictions3,stest,3,thereshold);
[falseneg4 falsepos4]=falsePosNeg2(predictions4,stest,4,thereshold);
[falseneg5 falsepos5]=falsePosNeg2(predictions5,stest,5,thereshold);
[falseneg6 falsepos6]=falsePosNeg2(predictions6,stest,6,thereshold);
[falseneg7 falsepos7]=falsePosNeg2(predictions7,stest,7,thereshold);
[falseneg8 falsepos8]=falsePosNeg2(predictions8,stest,8,thereshold);
[falseneg9 falsepos9]=falsePosNeg2(predictions9,stest,9,thereshold);
% [falseneg10 falsepos10]=falsePosNeg(predictions10,stest,10,thereshold);
[falseneg11 falsepos11]=falsePosNeg2(predictions11,stest,10,thereshold);
[falseneg12 falsepos12]=falsePosNeg2(predictions12,stest,11,thereshold);
[falseneg13 falsepos13]=falsePosNeg2(predictions13,stest,12,thereshold);
[falseneg14 falsepos14]=falsePosNeg2(predictions14,stest,13,thereshold);
[falseneg15 falsepos15]=falsePosNeg2(predictions15,stest,14,thereshold);
[falseneg16 falsepos16]=falsePosNeg2(predictions16,stest,15,thereshold);
[falseneg17 falsepos17]=falsePosNeg2(predictions17,stest,16,thereshold);
[falseneg18 falsepos18]=falsePosNeg2(predictions18,stest,17,thereshold);
[falseneg19 falsepos19]=falsePosNeg2(predictions19,stest,18,thereshold);
[falseneg20 falsepos20]=falsePosNeg2(predictions20,stest,19,thereshold);
% falseneg=[falseneg1, falseneg2, falseneg3, falseneg4, falseneg5,falseneg6, falseneg7, falseneg8, falseneg9, falseneg10];
% falseneg=[falseneg, falseneg11, falseneg12, falseneg13, falseneg14, falseneg15,falseneg16, falseneg17, falseneg18, falseneg19, falseneg20];
% falsepos=[falsepos1, falsepos2, falsepos3, falsepos4, falsepos5,falsepos6, falsepos7, falsepos8, falsepos9, falsepos10];
% falsepos=[falsepos, falsepos11, falsepos12, falsepos13, falsepos14, falsepos15,falsepos16, falsepos17, falsepos18, falsepos19, falsepos20];

falseneg=[falseneg1, falseneg2, falseneg3, falseneg4, falseneg5,falseneg6, falseneg7, falseneg8, falseneg9];
falseneg=[falseneg, falseneg11, falseneg12, falseneg13, falseneg14, falseneg15,falseneg16, falseneg17, falseneg18, falseneg19, falseneg20];
falsepos=[falsepos1, falsepos2, falsepos3, falsepos4, falsepos5,falsepos6, falsepos7, falsepos8, falsepos9];
falsepos=[falsepos, falsepos11, falsepos12, falsepos13, falsepos14, falsepos15,falsepos16, falsepos17, falsepos18, falsepos19, falsepos20];

%%uncomment just for falseneg computations
% %set vector with sizes of each person's windows to build label vector
% s=[s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 s16 s17 s18 s19 s20];
% falseneg_mat1=zeros(1,20);
% size(falseneg_mat1)
% for i=1:20
% choice=i;
% Y(:,1)=0;%set 0 everywhere
% if choice==1
%     Y(1:s(1),1)=1;
% else
%     Y(s(choice-1)+1:s(choice),1)=1;%set 1 for class we are interested in
% end
% 
% SVMModel = fitcsvm(mX,Y,'Standardize',true,'KernelFunction','RBF','KernelScale','auto'); %build svm model
% 
% %build testing matrix
% t1=r1(:,s1train:size(r1,2));
% t2=r2(:,s2train:size(r2,2));
% t3=r3(:,s3train:size(r3,2));
% t4=r4(:,s4train:size(r4,2));
% t5=r5(:,s5train:size(r5,2));
% t6=r6(:,s6train:size(r6,2));
% t7=r7(:,s7train:size(r7,2));
% t8=r8(:,s8train:size(r8,2));
% t9=r9(:,s9train:size(r9,2));
% t10=r10(:,s10train:size(r10,2));
% t11=r11(:,s11train:size(r11,2));
% t12=r12(:,s12train:size(r12,2));
% t13=r13(:,s13train:size(r13,2));
% t14=r14(:,s14train:size(r14,2));
% t15=r15(:,s15train:size(r15,2));
% t16=r16(:,s16train:size(r16,2));
% t17=r17(:,s17train:size(r17,2));
% t18=r18(:,s18train:size(r18,2));
% t19=r19(:,s19train:size(r19,2));
% t20=r20(:,s20train:size(r20,2));
% 
% 
% t=[t1';t2';t3';t4';t5';t6';t7';t8';t9';t10';t11';t12';t13';t14';t15';t16';t17';t18';t19';t20'];
% if choice==1
%     newt=t1';
% else
%     newt=t(stest(choice-1)+1: stest(choice),:);
% end
% [Xtest,Ytest]=buildTestMatrix(newt',windowlength,1,size(newt',2),mp); 
% 
% predictions=predict(SVMModel,Ytest);
% totalpred=length(predictions);
% falsepos=0;
% falseneg=0;
% for k=1:totalpred
%     if (predictions(k)==0)
%         falseneg=falseneg+1;
%     end
% end
% 
% falseneg=falseneg/totalpred;
% falseneg_mat1(i)=falseneg;
% 
% end      
% 
% 
