function [conf] = evaluateRecognitionSystem()
% Evaluates the recognition system for all test-images and returns the confusion matrix

	load('vision.mat');
	load('../data/traintest.mat');

	% TODO Implement your code here
	source = '../data/';
	[T,~]=size(test_imagenames);
	predicted_labels=zeros(T,1);
	for i=1:T
		imagename=[source, test_imagenames{i}];
		predicted_labels(i,1)=guessImage(imagename);
		predicted_labels(i,1);
		fprintf('[My Guess]:%s.\n',mapping{predicted_labels(i,1)});
		fprintf('[Real Label]:%s.\n',mapping{test_labels(i)});
	end
	[C,order] = confusionmat(test_labels,predicted_labels)%confusion matrix creation
	accuracy=trace(C)/sum(C(:))

end