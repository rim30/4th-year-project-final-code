%load rawsignals and split into beats
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
