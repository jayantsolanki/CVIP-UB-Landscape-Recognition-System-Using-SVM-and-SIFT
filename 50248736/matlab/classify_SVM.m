function [scores,predicted_categories]=classify_SVM()

load('vision.mat');
load('vision_test.mat');
lambda = 1e-06;
scores = [];
categories=unique(train_labels);
num=length(categories);
for i = 1:8
    
    matching_indices = (categories(i) == train_labels);
    matching_indices = double(matching_indices);
    for j = 1: size(train_labels, 1)
        if(matching_indices(j) == 0)
            matching_indices(j) = -1;
        end
    end
    
    [w, b] = vl_svmtrain(train_features, matching_indices, lambda);
    
    disp(size(w));
    disp(size(b));
    
    
    scores = [scores; (w' * test_features + b) ];
end

[max_values, max_indices] = max(scores);
predicted_categories = categories(max_indices');

end