function [rawsignal,beats,nonfilter]=loadmedicalECG(fileN,nobeats,sampleskept,windowlength,start)
% sampleskept=20000;
% nobeats=5;
%fileN has to be a mat file ie '16265m'
[tm,signal,lead,Fs,labels,t]=loadECG(fileN); %load ECG signal
 person=lead(start:start+sampleskept); %keep only a portion of the data
rawsignal=person;
nonfilter=rawsignal;
rawsignal=filterECG(person,2,1,40,128); %filter signal
threshold=0.2;
beats = Split_device (rawsignal',nobeats,windowlength,threshold); %split ecg into windows and perform interpolation
end
