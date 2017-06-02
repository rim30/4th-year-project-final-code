function r = makeanr(beats)
    r=zeros(length(beats(:,1)),100);
    for i=1:1:length(beats(:,1))
        r(i,:)=interp1(beats(i,:),linspace(1,length(beats(1,:)),100));
    end
end