%get .dat files, split into 5 beat windows and perform interpolation, and
%put everything into a matrix

%load .dat files for one person and put them in rawsignal(ECG 30s window,samples)
folder='C:\Users\Roxana\Desktop\ECG collected\Person0\';
rawsignal=getRecordedECG(folder);
%run('getRecordedECG.m')
threshold=0.2;
windowsi=[]; %each row will be a window of 1 beat length interpolated to 200 samples
for i=1:size(rawsignal,1)
    window_beatsi = Split_device (rawsignal(i,:),5,1000,threshold);
    windowsi=[windowsi;window_beatsi];
end
 a=any(windowsi'<-80);
beats=windowsi(find(a<1),:);
plot(beats')
% 
%split each ECG file into windows of 5 beats each
% windows=[]; %each row will be a window of 1 beat length interpolated to 200 samples
% for i=1:size(rawsignal,1)
%     window_beats = Split_device (rawsignal(i,:),1,200,0.75);
%     windows=[windows;window_beats];
% end

% %concatenate each 5 consecutive beats into one window
% windows5beats=[];
% for i=1:5:size(windows,1)-4
%     concwindow=[windows(i,:) windows(i+1,:) windows(i+2,:) windows(i+3,:) windows(i+4,:)];
%     windows5beats=[windows5beats; concwindow];
% end


% for i=1:size(windows5beats,1)
%     windowmean=mean(windows5beats(i,:));
%     windowstd=std(windows5beats(i,:));
%     for j=1:size(windows5beats,2)
%         if (windows5beats(i,j)<-50)
%             windows5beats(i,j)=0;
%         end
%     end
% end

