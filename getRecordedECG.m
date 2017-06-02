function rawsignal=getRecordedECG(folder)
%folder='C:\Users\Roxana\Desktop\ECG collected\Person 1\';
%files = dir('C:\ECG Data Manager\ecgdata\1\*.dat'); %get all files from directory with .dat extension
files = dir(strcat(folder,'*.dat')); %get all files from directory with .dat extension
filenames={files.name}'; %keep only the names
time=30;
rawsignal=zeros(size(filenames,1),4500); %define matrix to store 30s windows read / WAS 4500
for i=1:size(filenames)
    fid=fopen(strcat(folder,filenames{i}),'r'); %open each .dat file
    f=fread(fid,2*360*time,'ubit16'); %read the .dat file
    start=min(find(f(200:300)>0))+200; %find when signal starts to be measured
    sigy=f(start:start+4499);
    %sigy=filterECG(sigy,4,3,74,150); %myline
    %sigy=sigy(301:length(sigy)); %myline
    rawsignal(i,:)=sigy; %keep data between start and start+4499 samples
    fclose(fid);
end


% %try to split data as in the ecg viewer
% raw1=zeros(3,1500);
% i=1;
% while i<4
% raw1(i,:)=rawsignal(1,i*1500-1499:1500*i);
% i=i+1;
% end
% %plot first signal the same as in official heal force software
% figure
% subplot(3,1,1)
% plot(raw1(1,:))
% subplot(3,1,2)
% plot(raw1(2,:))
% subplot(3,1,3)
% plot(raw1(3,:))
end