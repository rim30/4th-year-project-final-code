
%load train data
ACF_ON=0; %use autocorrelation function
[rawsignal1,beats1]=loadDat('C:\Users\Roxana\OneDrive\ECG collected\Person 1\',nobeats,windowlength,smoothamount);
[rawsignal2,beats2]=loadDat('C:\Users\Roxana\OneDrive\ECG collected\Person 2\',nobeats,windowlength,smoothamount);
[rawsignal3,beats3]=loadDat('C:\Users\Roxana\OneDrive\ECG collected\Person 3\',nobeats,windowlength,smoothamount);
[rawsignal4,beats4]=loadDat('C:\Users\Roxana\OneDrive\ECG collected\Person 4\',nobeats,windowlength,smoothamount);
[rawsignal5,beats5]=loadDat('C:\Users\Roxana\OneDrive\ECG collected\Person 5\',nobeats,windowlength,smoothamount);
[rawsignal6,beats6]=loadDat('C:\Users\Roxana\OneDrive\ECG collected\Person 6\',nobeats,windowlength,smoothamount);
[rawsignal7,beats7]=loadDat('C:\Users\Roxana\OneDrive\ECG collected\Person 7\',nobeats,windowlength,smoothamount);
[rawsignal8,beats8]=loadDat('C:\Users\Roxana\OneDrive\ECG collected\Person 8\',nobeats,windowlength,smoothamount);
[rawsignal9,beats9]=loadDat('C:\Users\Roxana\OneDrive\ECG collected\Person 9\',nobeats,windowlength,smoothamount);
[rawsignal10,beats10]=loadDat('C:\Users\Roxana\OneDrive\ECG collected\Person 10\',nobeats,windowlength,smoothamount);
[rawsignal11,beats11]=loadDat('C:\Users\Roxana\OneDrive\ECG collected\Person 11\',nobeats,windowlength,smoothamount);
[rawsignal12,beats12]=loadDat('C:\Users\Roxana\OneDrive\ECG collected\Person 12\',nobeats,windowlength,smoothamount);
[rawsignal13,beats13]=loadDat('C:\Users\Roxana\OneDrive\ECG collected\Person 13\',nobeats,windowlength,smoothamount);
[rawsignal14,beats14]=loadDat('C:\Users\Roxana\OneDrive\ECG collected\Person 14\',nobeats,windowlength,smoothamount);
[rawsignal15,beats15]=loadDat('C:\Users\Roxana\OneDrive\ECG collected\Person 15\',nobeats,windowlength,smoothamount);
[rawsignal16,beats16]=loadDat('C:\Users\Roxana\OneDrive\ECG collected\Person 16\',nobeats,windowlength,smoothamount);
[rawsignal17,beats17]=loadDat('C:\Users\Roxana\OneDrive\ECG collected\Person 17\',nobeats,windowlength,smoothamount);
[rawsignal18,beats18]=loadDat('C:\Users\Roxana\OneDrive\ECG collected\Person 18\',nobeats,windowlength,smoothamount);
[rawsignal19,beats19]=loadDat('C:\Users\Roxana\OneDrive\ECG collected\Person 19\',nobeats,windowlength,smoothamount);
[rawsignal20,beats20]=loadDat('C:\Users\Roxana\OneDrive\ECG collected\Person 20\',nobeats,windowlength,smoothamount);

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
    r20=beats20';
   
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
    r20=my_autocorr(beats20);
end
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
s10train=ceil(2/3*size(r10,2)); s10test=size(r10,2)-s10train;
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
noTwindows=noTwindows+s10train+s11train+s12train+s13train+s14train+s15train+s16train+s17train+s18train+s19train+s20train;

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
s19=s18+s19train;
s20=s19+s20train;

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
A1(s19+1:s20,1)=20;
%input windows into matrix from different people
A1(1:s1,2:(windowlength+1))=r1(1:windowlength,1:s1train)';
A1(s1+1:s2,2:(windowlength+1))=r2(1:windowlength,1:s2train)';
A1(s2+1:s3,2:(windowlength+1))=r3(1:windowlength,1:s3train)';
A1(s3+1:s4,2:(windowlength+1))=r4(1:windowlength,1:s4train)';
A1(s4+1:s5,2:(windowlength+1))=r5(1:windowlength,1:s5train)';
A1(s5+1:s6,2:(windowlength+1))=r6(1:windowlength,1:s6train)';
A1(s6+1:s7,2:(windowlength+1))=r7(1:windowlength,1:s7train)';
A1(s7+1:s8,2:(windowlength+1))=r8(1:windowlength,1:s8train)';
A1(s8+1:s9,2:(windowlength+1))=r9(1:windowlength,1:s9train)';
A1(s9+1:s10,2:(windowlength+1))=r10(1:windowlength,1:s10train)';
A1(s10+1:s11,2:(windowlength+1))=r11(1:windowlength,1:s11train)';
A1(s11+1:s12,2:(windowlength+1))=r12(1:windowlength,1:s12train)';
A1(s12+1:s13,2:(windowlength+1))=r13(1:windowlength,1:s13train)';
A1(s13+1:s14,2:(windowlength+1))=r14(1:windowlength,1:s14train)';
A1(s14+1:s15,2:(windowlength+1))=r15(1:windowlength,1:s15train)';
A1(s15+1:s16,2:(windowlength+1))=r16(1:windowlength,1:s16train)';
A1(s16+1:s17,2:(windowlength+1))=r17(1:windowlength,1:s17train)';
A1(s17+1:s18,2:(windowlength+1))=r18(1:windowlength,1:s18train)';
A1(s18+1:s19,2:(windowlength+1))=r19(1:windowlength,1:s19train)';
A1(s19+1:s20,2:(windowlength+1))=r20(1:windowlength,1:s20train)';

%perform lda
