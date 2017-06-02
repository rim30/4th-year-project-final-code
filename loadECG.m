function [tm,signal,lead1,Fs,labels,t]=loadECG(ECGmatrix)
[tm,signal,Fs,labels]=rdmat(ECGmatrix);
lead1=signal(:,1);
%lead2=signal(:,2);
t = 1:length(lead1);
% figure
% plot(t,lead1)
% title('Signal with a Trend')
% xlabel('Samples');
% ylabel('Voltage(mV)')
% legend('Noisy ECG Signal')
% grid on
end
