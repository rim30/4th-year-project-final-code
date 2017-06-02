%load .dat files for one person and put them in rawsignal(ECG 30s window,samples)

function [rawsignal,beats]=loadDat(folder,nobeats,windowlength,smoothamount)
rawsignal=getRecordedECG(folder);
% if normalise==1
%     max=prctile(rawsignal',98);
%     min=prctile(rawsignal',2);
%     diff=max-min;
%     rawsignal=(rawsignal'-min)./diff;
%     rawsignal=rawsignal';
% end
%run('getRecordedECG.m')
wl=windowlength;
% pr1=rawsignal(randperm(length(rawsignal(:,1))),:); %randomly permute the windows
% pr2=pr1(randperm(length(pr1(:,1))),:); %randomly permute the windows
% pr3=pr2(randperm(length(pr2(:,1))),:); %randomly permute the windows
% pr4=pr3(randperm(length(pr3(:,1))),:); %randomly permute the windows
% pr=pr4(randperm(length(pr4(:,1))),:); %randomly permute the windows
pr=rawsignal;
threshold=0.2;
windowsi=[]; %each row will be a window of 1 beat length interpolated to 200 samples
for i=1:size(rawsignal,1)
    window_beatsi = Split_device (pr(i,:),nobeats,windowlength,threshold);
    windowsi=[windowsi;window_beatsi];
end
a=any(windowsi'<-80);
beats=windowsi(find(a<1),:);

beats=filter(1/smoothamount*ones(1,smoothamount),1,beats);
end