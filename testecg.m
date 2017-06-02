%this function will assess if the user is making good contact with the
%device and if the ecg shape is similar to what we expect
%3s windows will be inputted to the function in the form of vector signal
function ecg_test(signal):
l=length(signal)
for i=1:10:l
    %check if signal is non-zero in 10 sample chunks
    if all(signal(i:i+9))!=1
        Disp('No contact, please put your fingers on the metal pads properly!')
        

end