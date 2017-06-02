function signalout=filterECG(signalin,order,lfreq,hfreq,Fs)
[B,A] = butter(order,[lfreq hfreq]/(Fs/2)); %apply butterworth filter
signalout=filter(B,A,signalin); %get data minus smoothing
end