
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

%define matrix for lda input

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
