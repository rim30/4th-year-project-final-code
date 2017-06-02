function [beatnum,period] = draftSplit(ts)
if not(isrow(ts))
    ts=ts';
end
%wl is window length
%ts is input signal

ts=ts-mean(ts);

whatsleft=ts;
% M = movstd(ts,7);%movind standard deviation of signal ts for each 10 samples
% % m=smooth(M.^2,5,'moving');
% m=M;
% sm=std(m);
% locsm=find(m>1.2*sm);

[pks,locs]=findpeaks(whatsleft); %find all maxima points in the waveform
s=std(whatsleft); %calculate standard deviation of the waveform
whatsleft2=whatsleft.*(abs(whatsleft)<2*s);% set 0 everywhere where the value of the peak is <2std
s=std(whatsleft2);%calculate new std for maxima vector
pos=find((pks>-0.2*s)); %find all maxima positions which are > than 3 std (i.e. R points)
locs=locs(pos); %get the locations in the original waveform of the maxima points
pks=pks(pos);
% posy=[];
% for i=1:1:length(locs)
%     if any(locs(i)==locsm)
%         posy=[posy i];
%     end
% end
% locs=locs(posy);
% pks=pks(posy); %get the values of the peaks from the original waveform
ll=locs-circshift(locs,1); %calculate difference bewteen location of peak(i) and location of peak(i+1) to see if they are the same or its due to noise
ll=ll(2:length(ll)); %get rid of first value as it's useless
posgroups=find(ll>20); %find the beginning of the group when a new peak appears (difference >40)
if not(isempty(posgroups))
    newgps2=[0 posgroups]; %concatenate 0 at the beginning of the previous array in order to use it in the loop
    lengthgps=posgroups-circshift(posgroups,1); %calculate the lengths of each group of peaks
    lengthgps(1)=posgroups(1); %set length of first group to be the position of the first group
    maxpks=zeros(1,length(lengthgps)); %create a new vector which will contain all maxima
    locs2=zeros(1,length(lengthgps)); %create a new vector which will contain the positions of the maximna 
    
    for i=1:1:length(lengthgps)
        for j=1:1:lengthgps(i)
            maxpks(i)=max(maxpks(i),pks(newgps2(i)+j)); %keep only the highest peaks, ignore noise
        end
    end
    for i=1:1:length(lengthgps)
        for j=1:1:lengthgps(i)
            if(pks(newgps2(i)+j)==maxpks(i))
                locs2(i)=locs(newgps2(i)+j); %find the positions of the peaks
            end
        end
    end 
    
    beatnum=length(locs2); %calculate the number of peaks/beats
%     beatlength=floor(length(ts)/(2*beatnum)); %calculate the length of the beat
%     windowlength=wl*beatlength;
%     beats=zeros(beatnum-wl,2*windowlength+1); %define matrix to hold information about each beat
%     for i=(ceil(wl/2)):1:(beatnum-ceil(wl/2))
%         index_min=max(1,locs2(i+1)-windowlength); %make sure not below 1
%         index_max=min(length(whatsleft),locs2(i+1)+windowlength);
%         beats(i-ceil(wl/2)+1,:)=interp1(whatsleft(index_min:index_max),linspace(1,index_max-index_min,2*windowlength+1));%insert values into the beat matrix
%     end
% else
%     beats=[];
end
%beats=(beats'-mean(beats'))'; 
period=length(ts)/beatnum;
end