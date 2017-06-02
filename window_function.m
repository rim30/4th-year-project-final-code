function [windowedSignal]=window_function(signal,wlen)
%this function splits the signal into a fixed length window batches with no
%overlap with wlen the window length                       
nosplits=floor(length(signal)/wlen);
outsig=zeros(nosplits,wlen);
for i=1:nosplits
    j=i-1;
    outsig(i,:)=signal(j*wlen+1:(j+1)*wlen);
    j=j+1;
end
windowedSignal=outsig;
end