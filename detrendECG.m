[p,s,mu] = polyfit(tm',lead1,6);
y = polyval(p,tm',[],mu);

ECG_data = lead1 - y;        % Detrend data

figure
plot(t,ECG_data')
grid on
ax = axis;
axis([ax(1:2) -1.2 1.2])
title('Detrended ECG Signal')
xlabel('Samples')
ylabel('Voltage(mV)')
legend('Detrended ECG Signal')