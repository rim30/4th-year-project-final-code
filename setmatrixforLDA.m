classes=18;
nosamples=350;
% nosamples=100;
classsamples=100;
%apply autocorrelation on windows
r1=calcautocorr(beats1,size(beats1,2)-1);
r2=calcautocorr(beats2,size(beats2,2)-1);
r3=calcautocorr(beats3,size(beats3,2)-1);
r4=calcautocorr(beats4,size(beats4,2)-1);
r5=calcautocorr(beats5,size(beats5,2)-1);
r6=calcautocorr(beats6,size(beats6,2)-1);
r7=calcautocorr(beats7,size(beats7,2)-1);
r8=calcautocorr(beats8,size(beats8,2)-1);
r9=calcautocorr(beats9,size(beats9,2)-1);
r10=calcautocorr(beats10,size(beats10,2)-1);
r11=calcautocorr(beats11,size(beats11,2)-1);
r12=calcautocorr(beats12,size(beats12,2)-1);
r13=calcautocorr(beats13,size(beats13,2)-1);
r14=calcautocorr(beats14,size(beats14,2)-1);
r15=calcautocorr(beats15,size(beats15,2)-1);
r16=calcautocorr(beats16,size(beats16,2)-1);
r17=calcautocorr(beats17,size(beats17,2)-1);
r18=calcautocorr(beats18,size(beats18,2)-1);
% r1=makeanr(beats1);
% r2=makeanr(beats2);
% r3=makeanr(beats3);
% r4=makeanr(beats4);
% r5=makeanr(beats5);
% r6=makeanr(beats6);
% r7=makeanr(beats7);
% r8=makeanr(beats8);
% r9=makeanr(beats9);
% r10=makeanr(beats10);
% r11=makeanr(beats11);
% r12=makeanr(beats12);
% r13=makeanr(beats13);
% r14=makeanr(beats14);
% r15=makeanr(beats15);
% r16=makeanr(beats16);
% r17=makeanr(beats17);
% r18=makeanr(beats18);

%define matrix for lda input
A=zeros(classes*classsamples,nosamples+1);
%set labels
for i=1:1:classsamples
    A(i,1)=1; %person1
    A(i+classsamples,1)=2; %person 2
    A(i+2*classsamples,1)=3; %person 3
    A(i+3*classsamples,1)=4; %person4
    A(i+4*classsamples,1)=5; %person5
    A(i+5*classsamples,1)=6; %person6
    A(i+6*classsamples,1)=7; %person7
    A(i+7*classsamples,1)=8; %person8
    A(i+8*classsamples,1)=9; %person9
    A(i+9*classsamples,1)=10; %person10
    A(i+10*classsamples,1)=11; %person11
    A(i+11*classsamples,1)=12; %person12
    A(i+12*classsamples,1)=13; %person13
    A(i+13*classsamples,1)=14; %person14
    A(i+14*classsamples,1)=15; %person15
    A(i+15*classsamples,1)=16; %person16
    A(i+16*classsamples,1)=17; %person17
    A(i+17*classsamples,1)=18; %person18
end

%input windows into matrix from different people
for i=1:1:classsamples
    A(i,2:(nosamples+1))=r1(1:nosamples,i);
    A(i+classsamples,2:(nosamples+1))=r2(1:nosamples,i);
    A(i+2*classsamples,2:(nosamples+1))=r3(1:nosamples,i);
    A(i+3*classsamples,2:(nosamples+1))=r4(1:nosamples,i);
    A(i+4*classsamples,2:(nosamples+1))=r5(1:nosamples,i);
    A(i+5*classsamples,2:(nosamples+1))=r6(1:nosamples,i);
    A(i+6*classsamples,2:(nosamples+1))=r7(1:nosamples,i);
    A(i+7*classsamples,2:(nosamples+1))=r8(1:nosamples,i);
    A(i+8*classsamples,2:(nosamples+1))=r9(1:nosamples,i);
    A(i+9*classsamples,2:(nosamples+1))=r10(1:nosamples,i);
    A(i+10*classsamples,2:(nosamples+1))=r11(1:nosamples,i);
    A(i+11*classsamples,2:(nosamples+1))=r12(1:nosamples,i);
    A(i+12*classsamples,2:(nosamples+1))=r13(1:nosamples,i);
    A(i+13*classsamples,2:(nosamples+1))=r14(1:nosamples,i);
    A(i+14*classsamples,2:(nosamples+1))=r15(1:nosamples,i);
    A(i+15*classsamples,2:(nosamples+1))=r16(1:nosamples,i);
    A(i+16*classsamples,2:(nosamples+1))=r17(1:nosamples,i);
     A(i+17*classsamples,2:(nosamples+1))=r18(1:nosamples,i);
end

