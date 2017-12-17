% SVMModel = fitcsvm(X,Y,'Standardize',true,'KernelFunction','RBF',...
%     'KernelScale','auto');
%function [scores,predicted_categories]=classify_SVM_matlab()

load('vision.mat');
load('vision_test.mat');
lambda = 1e-06;

scores = [];
categories=unique(train_labels);
num=length(categories);
N=size(test_labels,1);


SVMModels = cell(num,1);
rng(1); % For reproducibility
train_features=train_features';
for j = 1:numel(categories)
    matching_indices = (categories(j) == train_labels);
    matching_indices = double(matching_indices);
    for i = 1: size(train_labels, 1)
        if(matching_indices(i) == 0)
            matching_indices(i) = -1;
        end
    end
  % disp(matching_indices);
    %indx = (train_labels==categories(j)); % Create binary classes for each classifier
    disp(size(matching_indices));
    SVMModels{j} = fitcsvm(train_features,matching_indices,'ClassNames',[false true],'Standardize',true,...
        'KernelFunction','rbf','BoxConstraint',1);
    %SVMModels{j}=svmtrain(train_features,matching_indices);
   
end


%Scores = zeros(N,numel(categories));
Scores=[];

for j = 1:numel(classes)
    [a,score] = predict(SVMModels{j},test_features');
  % group=svmclassify(SVMModels{j},test_features');
   %disp(size(group));
   disp(a);
   disp(score);
   disp('----------------------------');
   Scores=cat(1,Scores,score(:,1));
    %disp(size(score));
    %Scores(:,j) = score(:,1); % Second column contains positive-class scores
  
    %first-column is coming positive
end

[~,maxScore] = max(Scores,[],2);
predicted_categories = categories(maxScore);

%[max_values, max_indices] = max(scores);
%predicted_categories = categories(max_indices');

disp(maxScore);
%end