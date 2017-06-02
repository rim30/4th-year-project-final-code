function [rr] = my_autocorr(vec)
rsignal=zeros(size(vec,1),size(vec,2));
for i=1:size(vec,1)
    v=vec(i,:);
    ac=xcorr(v); %compute autocorrelation
    ac=ac(ceil(length(ac)/2):length(ac))/max(ac); %normalise autocorrelation
    rsignal(i,:)=ac;
end
rr=rsignal'; 
    
end