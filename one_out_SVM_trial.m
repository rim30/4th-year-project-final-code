clear all
%model parameters
rng(1)%for replicability 
nobeats=1;%no beats per window
windowlength=200;%no samples per window
wlen=200;
smoothamount=4;
noclasses=19;%number of classes analysed
nofeatures=25;%no features used for dimensionality reduction
ACF_ON=0;%1 for autocorrelation function, 0 otherwise
ACF_on=0;
load_personal_data

final_matrix=zeros(19,1);
for k=2:19
    outchoice=k%the person we want to test for
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
    if k==19
        rout=r19;
    end
    if k==20
        rout=r20;
    end

%define matrix for pca and perform dim red
[X,s,Y]=define_pca(r1,r2,r3,r4,r5,r6,r7,r8,r9,r10,r11,r12,r13,r14,r15,r16,r17,r18,r19,r20,outchoice,windowlength);
[mX,mp] = compute_mapping(X,'PCA',nofeatures); %do dim red
mX=real(mX);
mp.M=real(mp.M);



%build SVM model
kernelfunc='RBF';
boxconstr=inf;
SVMModel1 = fitcsvm(mX,Y(1,:),'Standardize',true,'KernelFunction',kernelfunc,'KernelScale','auto','BoxConstraint',boxconstr); %build svm model
% SVMModel2 = fitcsvm(mX,Y(2,:),'Standardize',true,'KernelFunction',kernelfunc,'KernelScale','auto','BoxConstraint',boxconstr); %build svm model
% SVMModel3 = fitcsvm(mX,Y(3,:),'Standardize',true,'KernelFunction',kernelfunc,'KernelScale','auto','BoxConstraint',boxconstr); %build svm model
% SVMModel4 = fitcsvm(mX,Y(4,:),'Standardize',true,'KernelFunction',kernelfunc,'KernelScale','auto','BoxConstraint',boxconstr); %build svm model
% SVMModel5 = fitcsvm(mX,Y(5,:),'Standardize',true,'KernelFunction',kernelfunc,'KernelScale','auto','BoxConstraint',boxconstr); %build svm model
% SVMModel6 = fitcsvm(mX,Y(6,:),'Standardize',true,'KernelFunction',kernelfunc,'KernelScale','auto','BoxConstraint',boxconstr); %build svm model
% SVMModel7 = fitcsvm(mX,Y(7,:),'Standardize',true,'KernelFunction',kernelfunc,'KernelScale','auto','BoxConstraint',boxconstr); %build svm model
% SVMModel8 = fitcsvm(mX,Y(8,:),'Standardize',true,'KernelFunction',kernelfunc,'KernelScale','auto','BoxConstraint',boxconstr); %build svm model
% SVMModel9 = fitcsvm(mX,Y(9,:),'Standardize',true,'KernelFunction',kernelfunc,'KernelScale','auto','BoxConstraint',boxconstr); %build svm model
% SVMModel10 = fitcsvm(mX,Y(10,:),'Standardize',true,'KernelFunction',kernelfunc,'KernelScale','auto','BoxConstraint',boxconstr); %build svm model
% SVMModel11 = fitcsvm(mX,Y(11,:),'Standardize',true,'KernelFunction',kernelfunc,'KernelScale','auto','BoxConstraint',boxconstr); %build svm model
% SVMModel12 = fitcsvm(mX,Y(12,:),'Standardize',true,'KernelFunction',kernelfunc,'KernelScale','auto','BoxConstraint',boxconstr); %build svm model
% SVMModel13 = fitcsvm(mX,Y(13,:),'Standardize',true,'KernelFunction',kernelfunc,'KernelScale','auto','BoxConstraint',boxconstr); %build svm model
% SVMModel14 = fitcsvm(mX,Y(14,:),'Standardize',true,'KernelFunction',kernelfunc,'KernelScale','auto','BoxConstraint',boxconstr); %build svm model
% SVMModel15 = fitcsvm(mX,Y(15,:),'Standardize',true,'KernelFunction',kernelfunc,'KernelScale','auto','BoxConstraint',boxconstr); %build svm model
% SVMModel16=  fitcsvm(mX,Y(16,:),'Standardize',true,'KernelFunction',kernelfunc,'KernelScale','auto','BoxConstraint',boxconstr); %build svm model
% SVMModel17 = fitcsvm(mX,Y(17,:),'Standardize',true,'KernelFunction',kernelfunc,'KernelScale','auto','BoxConstraint',boxconstr); %build svm model
% SVMModel18 = fitcsvm(mX,Y(18,:),'Standardize',true,'KernelFunction',kernelfunc,'KernelScale','auto','BoxConstraint',boxconstr); %build svm model
% SVMModel19 = fitcsvm(mX,Y(19,:),'Standardize',true,'KernelFunction',kernelfunc,'KernelScale','auto','BoxConstraint',boxconstr); %build svm model
% SVMModel20 = fitcsvm(mX,Y(20,:),'Standardize',true,'KernelFunction',kernelfunc,'KernelScale','auto','BoxConstraint',boxconstr); %build svm model

%build testing matrix, starting with selecting the test data
t1=r1;
t2=r2;
t3=r3;
t4=r4;
t5=r5;
t6=r6;
t7=r7;
t8=r8;
t9=r9;
t10=r10;
t11=r11;
t12=r12;
t13=r13;
t14=r14;
t15=r15;
t16=r16;
t17=r17;
t18=r18;
t19=r19;
t20=r20;

%build matrix for testing Y(in the reduced space), X normal space
[X1,Yt1]=buildTestMatrix(t1,windowlength,1,size(t1,2),mp); 
[X2,Yt2]=buildTestMatrix(t2,windowlength,1,size(t2,2),mp); 
[X3,Yt3]=buildTestMatrix(t3,windowlength,1,size(t3,2),mp); 
[X4,Yt4]=buildTestMatrix(t4,windowlength,1,size(t4,2),mp); 
[X5,Yt5]=buildTestMatrix(t5,windowlength,1,size(t5,2),mp); 
[X6,Yt6]=buildTestMatrix(t6,windowlength,1,size(t6,2),mp); 
[X7,Yt7]=buildTestMatrix(t7,windowlength,1,size(t7,2),mp); 
[X8,Yt8]=buildTestMatrix(t8,windowlength,1,size(t8,2),mp); 
[X9,Yt9]=buildTestMatrix(t9,windowlength,1,size(t9,2),mp); 
[X10,Yt10]=buildTestMatrix(t10,windowlength,1,size(t10,2),mp); 
[X11,Yt11]=buildTestMatrix(t11,windowlength,1,size(t11,2),mp); 
[X12,Yt12]=buildTestMatrix(t12,windowlength,1,size(t12,2),mp); 
[X13,Yt13]=buildTestMatrix(t13,windowlength,1,size(t13,2),mp); 
[X14,Yt14]=buildTestMatrix(t14,windowlength,1,size(t14,2),mp); 
[X15,Yt15]=buildTestMatrix(t15,windowlength,1,size(t15,2),mp); 
[X16,Yt16]=buildTestMatrix(t16,windowlength,1,size(t16,2),mp); 
[X17,Yt17]=buildTestMatrix(t17,windowlength,1,size(t17,2),mp); 
[X18,Yt18]=buildTestMatrix(t18,windowlength,1,size(t18,2),mp); 
[X19,Yt19]=buildTestMatrix(t19,windowlength,1,size(t19,2),mp); 
[X20,Yt20]=buildTestMatrix(t20,windowlength,1,size(t20,2),mp); 
if (outchoice==2)
    Ytest1=[Yt2];
end
if (outchoice==3)
    Ytest1=[Yt3];
end
if (outchoice==4)
    Ytest1=[Yt4];
end
if (outchoice==5)
    Ytest1=[Yt5];
end
if (outchoice==6)
    Ytest1=[Yt6];
end
if (outchoice==7)
    Ytest1=[Yt7];
end
if (outchoice==8)
    Ytest1=[Yt8];
end
if (outchoice==9)
    Ytest1=[Yt9];
end
if (outchoice==10)
    Ytest1=[Yt10];
end
if (outchoice==11)
    Ytest1=[Yt11];
end
if (outchoice==12)
    Ytest1=[Yt12];
end
if (outchoice==13)
    Ytest1=[Yt13];
end
if (outchoice==14)
    Ytest1=[Yt14];
end
if (outchoice==15)
    Ytest1=[Yt15];
end
if (outchoice==16)
    Ytest1=[Yt16];
end
if (outchoice==17)
    Ytest1=[Yt17];
end
if (outchoice==18)
    Ytest1=[Yt18];
end
if (outchoice==19)
    Ytest1=[Yt19];
end
if (outchoice==20)
    Ytest1=[Yt20];
end

%predict labels using SVM model
predictions1=predict(SVMModel1,Ytest1);
%average 3 predictions at a time
nopred=3;
avgpred1=filter(1/nopred*ones(1,nopred),1,predictions1);

%compute false positives and false negatives for class 1
thereshold=0.3;
falsepos1=sum(avgpred1<thereshold);
falsepos1=1-falsepos1/(size(avgpred1,1));
final_matrix(k-1)=falsepos1;
end