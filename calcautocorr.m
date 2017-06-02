function rsignal=calcautocorr(signal,lag)
for i=1:1:size(signal,1)
%rsignal(:,i)=autocorr(signal(i,:)',lag);
rsignal(:,i)=my_autocorr(signal(i,:)');

end


% %uncomment to plot autocorrelation function for each window
% for i=1:1:size(rsignal,2)
% plot(rsignal(:,i))
% hold on
% end

end