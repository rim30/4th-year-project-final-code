%perform PCA with 10 features
[mappedA,mapping] = compute_mapping(A(:,2:151),'PCA',20);
recA = reconstruct_data(mappedA, mapping);
Mdl = fitcknn(recA,A(:,1),'NumNeighbors',5,'Standardize',1);%build kNN