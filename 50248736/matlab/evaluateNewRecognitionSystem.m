function [conf] = evaluateNewRecognitionSystem(scores)
% Evaluates the recognition system for all test-images and returns the confusion matrix

	load('vision.mat');
    load('vision_test.mat');
	traintest=load('../data/traintest.mat');
    mapping=traintest.mapping;
	% TODO Implement your code here
    test_imagenames=traintest.test_imagenames;
    test_labels=traintest.test_labels;
    l=length(test_imagenames);
    [max_values, max_indices] = max(scores);
    c=0;
    conf_mat=zeros(8,8);
    for i=1:l
        %wordMapName=strcat('../data/',test_imagenames{i});
        %wordMap=wordMap.wordMap;
        disp(i);
        
        if(test_labels(i)==max_indices(i))
            disp('classified successfully');
            c=c+1;
        end
        %test_index=find(contains(mapping,test_label));
        %guess_index=find(contains(mapping,guessedImage));
        test_index=test_labels(i);
        guess_index=max_indices(i);
        a=conf_mat(test_labels(i),max_indices(i));
        conf_mat(test_index,guess_index)=a+1;
    end
    disp(c);
    conf=conf_mat;
end