function [conf] = evaluateRecognitionSystem()
% Evaluates the recognition system for all test-images and returns the confusion matrix

	load('vision.mat');
	load('../data/traintest.mat');
	t = templateSVM('Standardize',1);
	MDL=fitcecoc(train_features',train_labels,'Learners',t);
	% TODO Implement your code here
	source = '../data/';
	[T,~]=size(test_imagenames);
	% predicted_labels=zeros(T,1);
	test_features = [];
	disp('Generating wordMap for the Test Images');
	parfor_progress(T);
	for i=1:T
		imagename=[source, test_imagenames{i}];
		wordmap=guessImage(imagename);
		test_features = cat(2,test_features, wordmap);
		% predicted_labels(i,1);
		% fprintf('[My Guess]:%s.\n',mapping{predicted_labels(i,1)});
		% fprintf('[Real Label]:%s.\n',mapping{test_labels(i)});
		parfor_progress;
	end
  	parfor_progress(0);
	[predicted_labels,val]=predict(MDL, test_features');
	conf=confusionmat(test_labels,predicted_labels);
	disp(conf);
	accurracy=trace(conf)/sum(conf(:)) * 100;
	disp(accurracy);

	disp("prediction done");
	figure
	heatmap(conf)
	% [C,order] = confusionmat(test_labels,predicted_labels)%confusion matrix creation
	% accuracy=trace(C)/sum(C(:))

end