% % load fisheriris
% % inds = ~strcmp(species,'setosa');
% % X = meas(inds,3:4);
% % y = species(inds);
% % 
% % SVMModel = fitcsvm(X,y);
% 
% % load fisheriris
% % X = meas(:,1:2);
% % y = ones(size(X,1),1);
% 
% load fisheriris
% X = meas(:,3:4);
% Y = species;
% 
% SVMModels = cell(3,1);
% classes = unique(Y);
% rng(1); % For reproducibility
% 
% for j = 1:numel(classes)
%     indx = strcmp(Y,classes(j)); % Create binary classes for each classifier
%     disp(indx);
%     disp(size(indx));
%     SVMModels{j} = fitcsvm(X,indx,'ClassNames',[false true],'Standardize',true,...
%         'KernelFunction','rbf','BoxConstraint',1);
% end
% 
% d = 0.02;
% [x1Grid,x2Grid] = meshgrid(min(X(:,1)):d:max(X(:,1)),...
%     min(X(:,2)):d:max(X(:,2)));
% xGrid = [x1Grid(:),x2Grid(:)];
% N = size(xGrid,1);
% Scores = zeros(N,numel(classes));
% 
% for j = 1:numel(classes);
%     [~,score] = predict(SVMModels{j},xGrid);
%     Scores(:,j) = score(:,2); % Second column contains positive-class scores
% end
% 
% [~,maxScore] = max(Scores,[],2);


load fisheriris
X = meas;
Y = species;