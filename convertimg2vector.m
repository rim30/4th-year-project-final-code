
[FileName, PathName] = uigetfile('C:\Users\Roxana\OneDrive\ECGproject\images\*.jpg', 'Select an image file:');
File = fullfile(PathName, FileName);
A  = imread(File);%get photo as a matrix
A1=zeros(1,size(A,2)); %define vector with ECG values
for i=1:size(A,2)
    f=mean(find(A(:,i,1)<80));
    if ~isnan(f)  
        A1(i)=f;
    else
        A1(i)=A1(i-1);
    end
end

A1=size(A,1)-A1;%ECG values from image read
figure
vec=A1-mean(A1);
vec=vec/max(vec);
plot(vec)