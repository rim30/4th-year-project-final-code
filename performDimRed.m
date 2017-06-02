[mA,mp] = compute_mapping(A(:,2:350),'PCA',40); %perform PCA on ACF matrix and keep 40 most imp features
A1=[A(:,1) mA]; %build matrix with classes
[mA2,mp2] = compute_mapping(A1,'LDA',2); %perform LDA on ACF from PCA and keep most imp 3 features
recA1=reconstruct_data(mA2,mp2); %reconstruct data from LDA space
recA2=reconstruct_data(recA1,mp); %reconstruct data from PCA space