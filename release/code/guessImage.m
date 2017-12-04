function guessedImage = guessImage( imagename ) 
% Given a path to a scene image, guess what scene it is
% Input:
%   imagename - path to the image
	warning('off','all');%warning suppress

	fprintf('[Loading..]\n');
	load('vision.mat');
	load('../data/traintest.mat','mapping');

	% image = im2double(imread(imagename));

	% imshow(image);
	fprintf('[Getting Visual Words..]\n');
	%wordMap = getVisualWords(image, filterBank, dictionary);
	load(strrep(imagename,'.jpg','.mat'), 'wordMap');
	h = getImageFeaturesSPM(3, wordMap, size(dictionary,2));
	%h = getImageFeatures(wordMap, size(dictionary,2));%no SP
	distances = distanceToSet(h, train_features);
	[~,nnI] = max(distances);
	% guessedImage = mapping{train_labels(nnI)};
	guessedImage = train_labels(nnI);
	% fprintf('[My Guess]:%s.\n',guessedImage);

	% figure(1);
	% imshow(image);
	% title('image to classify')

end
