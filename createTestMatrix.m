function [X,Y]=createTestMatrix(perImp,signal,windowlength,mp1,mp2,mp3,mp4,mp5,mp6,mp7,mp8)
%perImp is impersonated person, integer between 1 and 8
if perImp==1
    [X,Y]=buildTestMatrix(signal,windowlength,1,size(signal,2),mp1);
end
if perImp==2
    [X,Y]=buildTestMatrix(signal,windowlength,1,size(signal,2),mp2);
end
if perImp==3
    [X,Y]=buildTestMatrix(signal,windowlength,1,size(signal,2),mp3);
end
if perImp==4
    [X,Y]=buildTestMatrix(signal,windowlength,1,size(signal,2),mp4);
end
if perImp==5
    [X,Y]=buildTestMatrix(signal,windowlength,1,size(signal,2),mp5);
end
if perImp==6
    [X,Y]=buildTestMatrix(signal,windowlength,1,size(signal,2),mp6);
end
if perImp==7
    [X,Y]=buildTestMatrix(signal,windowlength,1,size(signal,2),mp7);
end
if perImp==8
    [X,Y]=buildTestMatrix(signal,windowlength,1,size(signal,2),mp8);
end


end