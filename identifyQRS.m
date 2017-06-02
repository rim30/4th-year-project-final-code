[~,locs_Rwave] = findpeaks(ECG_data,'MinPeakHeight',0.5,'MinPeakDistance',200); %find locs of R wave
ECG_inverted = -ECG_data;
[~,locs_Swave] = findpeaks(ECG_inverted,'MinPeakHeight',0.15,'MinPeakDistance',200);%find locs of Swave
% figure
% hold on
% plot(t,ECG_data)
% plot(locs_Rwave,ECG_data(locs_Rwave),'rv','MarkerFaceColor','r')
% plot(locs_Swave,ECG_data(locs_Swave),'rs','MarkerFaceColor','b')
% % axis([0 1850 -1.1 1.1])
% grid on
% legend('ECG Signal','R-waves','S-waves')
% xlabel('Samples')
% ylabel('Voltage(mV)')
% title('R-wave and S-wave in Noisy ECG Signal')
smoothECG = sgolayfilt(ECG_data,7,21);
[~,min_locs] = findpeaks(-smoothECG,'MinPeakDistance',40);

% Peaks between -0.2mV and -0.5mV
locs_Qwave = min_locs(smoothECG(min_locs)>-0.17 & smoothECG(min_locs)<-0.11);

figure
hold on
plot(t,smoothECG);
plot(locs_Qwave,smoothECG(locs_Qwave),'rs','MarkerFaceColor','g')
plot(locs_Rwave,smoothECG(locs_Rwave),'rv','MarkerFaceColor','r')
plot(locs_Swave,smoothECG(locs_Swave),'rs','MarkerFaceColor','b')
grid on
title('Thresholding Peaks in Signal')
xlabel('Samples')
ylabel('Voltage(mV)')
ax = axis;
legend('Smooth ECG signal','Q-wave','R-wave','S-wave')