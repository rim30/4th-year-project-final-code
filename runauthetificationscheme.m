ecg5people %load ecg waveforms for all classes(18),split into beats and windows
setmatrixforLDA %perform autocorrelation on each window and build matrix for lda
[mA,mp] = compute_mapping(A,'LDA',5); %do dim red down to 5 dimensions
Mdl = fitcknn(mA,A(:,1),'NumNeighbors',5,'Standardize',1); %perform classification
plot_scatterplot(100,mA,1,2) %scatter plot
computeMeanandSTD %compute matrix with mean and std dev of each class for each feature
[X1,Y1]=buildTestMatrix(r1,350,101,60,mp); %build matrix for testing
[label,score,cost,correct,correct2,newY,sumyes]=runkNN(18,Y1,Mdl,1,mu,stddev); %compute classification for training data class 1
