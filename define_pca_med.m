function [X,s,Y]=define_pca_med(r1,r2,r3,r4,r5,r6,r7,r8,r9,r10,r11,r12,r13,r14,r15,r16,r17,r18,outchoice,windowlength);
%outchoice is the person we want out, it's a number i.e. 3
%define matrix for lda input

%define size for matrix
s1train=size(r1,2); 
s2train=size(r2,2); 
s3train=size(r3,2); 
s4train=size(r4,2); 
s5train=size(r5,2); 
s6train=size(r6,2); 
s7train=size(r7,2); 
s8train=size(r8,2);
s9train=size(r9,2); 
s10train=size(r10,2); 
s11train=size(r11,2); 
s12train=size(r12,2); 
s13train=size(r13,2); 
s14train=size(r14,2); 
s15train=size(r15,2); 
s16train=size(r16,2); 
s17train=size(r17,2); 
s18train=size(r18,2);

noTwindows=s1train+s2train+s3train+s4train+s5train+s6train+s7train+s8train+s9train;%total no of windows
noTwindows=noTwindows+s10train+s11train+s12train+s13train+s14train+s15train+s16train+s17train+s18train;
s1=s1train;
s2=s1+s2train;
s3=s2+s3train;
s4=s3+s4train;
s5=s4+s5train;
s6=s5+s6train;
s7=s6+s7train;
s8=s7+s8train;
s9=s8+s9train;
s10=s9+s10train;
s11=s10+s11train;
s12=s11+s12train;
s13=s12+s13train;
s14=s13+s14train;
s15=s14+s15train;
s16=s15+s16train;
s17=s16+s17train;
s18=s17+s18train;
%build matrix for training
A=zeros(noTwindows,windowlength+1);

%set labels
A(1:s1,1)=1;
A(s1+1:s2,1)=2;
A(s2+1:s3,1)=3;
A(s3+1:s4,1)=4;
A(s4+1:s5,1)=5;
A(s5+1:s6,1)=6;
A(s6+1:s7,1)=7;
A(s7+1:s8,1)=8;
A(s8+1:s9,1)=9;
A(s9+1:s10,1)=10;
A(s10+1:s11,1)=11;
A(s11+1:s12,1)=12;
A(s12+1:s13,1)=13;
A(s13+1:s14,1)=14;
A(s14+1:s15,1)=15;
A(s15+1:s16,1)=16;
A(s16+1:s17,1)=17;
A(s17+1:s18,1)=18;
%input windows into matrix from different people
A(1:s1,2:(windowlength+1))=r1(1:windowlength,1:s1train)';
A(s1+1:s2,2:(windowlength+1))=r2(1:windowlength,1:s2train)';
A(s2+1:s3,2:(windowlength+1))=r3(1:windowlength,1:s3train)';
A(s3+1:s4,2:(windowlength+1))=r4(1:windowlength,1:s4train)';
A(s4+1:s5,2:(windowlength+1))=r5(1:windowlength,1:s5train)';
A(s5+1:s6,2:(windowlength+1))=r6(1:windowlength,1:s6train)';
A(s6+1:s7,2:(windowlength+1))=r7(1:windowlength,1:s7train)';
A(s7+1:s8,2:(windowlength+1))=r8(1:windowlength,1:s8train)';
A(s8+1:s9,2:(windowlength+1))=r9(1:windowlength,1:s9train)';
A(s9+1:s10,2:(windowlength+1))=r10(1:windowlength,1:s10train)';
A(s10+1:s11,2:(windowlength+1))=r11(1:windowlength,1:s11train)';
A(s11+1:s12,2:(windowlength+1))=r12(1:windowlength,1:s12train)';
A(s12+1:s13,2:(windowlength+1))=r13(1:windowlength,1:s13train)';
A(s13+1:s14,2:(windowlength+1))=r14(1:windowlength,1:s14train)';
A(s14+1:s15,2:(windowlength+1))=r15(1:windowlength,1:s15train)';
A(s15+1:s16,2:(windowlength+1))=r16(1:windowlength,1:s16train)';
A(s16+1:s17,2:(windowlength+1))=r17(1:windowlength,1:s17train)';
A(s17+1:s18,2:(windowlength+1))=r18(1:windowlength,1:s18train)';

stupidsize=size(A,1);
preservedA=A;
for i=1:size(A,1)
    if(A(i,1)==outchoice)
        A(i,:)=-1000;
    end
end
ncol = size(A, 2);
A(A < -800) = [];
A = reshape(A, [], ncol);

X=A(:,2:(windowlength+1)); %get rid of labels

%set vector with sizes of each person's windows to build label vector
s=[s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 s16 s17 s18];

%build label vector 
Y1=zeros(1,stupidsize);
Y2=zeros(1,stupidsize);
Y3=zeros(1,stupidsize);
Y4=zeros(1,stupidsize);
Y5=zeros(1,stupidsize);
Y6=zeros(1,stupidsize);
Y7=zeros(1,stupidsize);
Y8=zeros(1,stupidsize);
Y9=zeros(1,stupidsize);
Y10=zeros(1,stupidsize);
Y11=zeros(1,stupidsize);
Y12=zeros(1,stupidsize);
Y13=zeros(1,stupidsize);
Y14=zeros(1,stupidsize);
Y15=zeros(1,stupidsize);
Y16=zeros(1,stupidsize);
Y17=zeros(1,stupidsize);
Y18=zeros(1,stupidsize);

Y1(1:s1)=1;
Y2(s1+1:s2)=1;
Y3(s2+1:s3)=1;
Y4(s3+1:s4)=1;
Y5(s4+1:s5)=1;
Y6(s5+1:s6)=1;
Y7(s6+1:s7)=1;
Y8(s7+1:s8)=1;
Y9(s8+1:s9)=1;
Y10(s9+1:s10)=1;
Y11(s10+1:s11)=1;
Y12(s11+1:s12)=1;
Y13(s12+1:s13)=1;
Y14(s13+1:s14)=1;
Y15(s14+1:s15)=1;
Y16(s15+1:s16)=1;
Y17(s16+1:s17)=1;
Y18(s17+1:s18)=1;



for i=1:size(preservedA,1)
    if(preservedA(i,1)==outchoice)
        Y1(i)=-1000;
        Y2(i)=-1000;
        Y3(i)=-1000;
        Y4(i)=-1000;
        Y5(i)=-1000;
        Y6(i)=-1000;
        Y7(i)=-1000;
        Y8(i)=-1000;
        Y9(i)=-1000;
        Y10(i)=-1000;
        Y11(i)=-1000;
        Y12(i)=-1000;
        Y13(i)=-1000;
        Y14(i)=-1000;
        Y15(i)=-1000;
        Y16(i)=-1000;
        Y17(i)=-1000;
        Y18(i)=-1000;
    end
end


Y1(Y1 < -800) = [];
Y2(Y2 < -800) = [];
Y3(Y3 < -800) = [];
Y4(Y4 < -800) = [];
Y5(Y5 < -800) = [];
Y6(Y6 < -800) = [];
Y7(Y7 < -800) = [];
Y8(Y8 < -800) = [];
Y9(Y9 < -800) = [];
Y10(Y10 < -800) = [];
Y11(Y11 < -800) = [];
Y12(Y12 < -800) = [];
Y13(Y13 < -800) = [];
Y14(Y14 < -800) = [];
Y15(Y15 < -800) = [];
Y16(Y16 < -800) = [];
Y17(Y17 < -800) = [];
Y18(Y18 < -800) = [];
Y=[Y1;Y2;Y3;Y4;Y5;Y6;Y7;Y8;Y9;Y10;Y11;Y12;Y13;Y14;Y15;Y16;Y17;Y18];
end