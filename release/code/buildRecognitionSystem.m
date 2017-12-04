function buildRecognitionSystem()
% Creates vision.mat. Generates training features for all of the training images.

	load('dictionary.mat');
	load('../data/traintest.mat');
	warning('off','all');%warning suppress

	% TODO create train_features
	filterBank = filterBank;
	dictionary = dictionary;
	source = '../data/';
	[~,dictionarySize]=size(dictionary);
     %k=dictionarySize*((4^(1)-1)/3); % no SPM
    k=dictionarySize*((4^(3)-1)/3); %dimension of the resultant histogram vector after the histogram vectors for each layer is calculated
	[T,~]=size(train_imagenames);
	train_features=zeros(k,T);
	h = waitbar(0,'Finding histograms');
	for i=1:T
	    fprintf('Converting to visual words histogram %s\n', strrep(train_imagenames{i},'.jpg','.mat'));
	    load([source, strrep(train_imagenames{i},'.jpg','.mat')], 'wordMap');
	    train_features(:,i)=getImageFeaturesSPM(3,wordMap,dictionarySize);
	    %train_features(:,i)=getImageFeatures(wordMap,dictionarySize);
	    waitbar(i/T,h,sprintf('%d% / %d histograms generated',i,T))%waitbar, random stuff
	end
	close(h);

	save('vision.mat', 'filterBank', 'dictionary', 'train_features', 'train_labels');

end
