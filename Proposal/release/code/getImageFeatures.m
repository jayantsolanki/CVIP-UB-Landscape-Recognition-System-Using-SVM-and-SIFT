function [h] = getImageFeatures(wordMap, dictionarySize)
% Compute histogram of visual words
% Inputs:
% 	wordMap: WordMap matrix of size (h, w)
% 	dictionarySize: the number of visual words, dictionary size
% Output:
%   h: vector of histogram of visual words of size dictionarySize (l1-normalized, ie. sum(h(:)) == 1)

	% TODO Implement your code here
	% [a,b]=size(wordMap);
	% wordMap=reshape(wordMap,a*b,1);
	[h,bins]=histcounts(wordMap,dictionarySize);% with bins size of dictionarySize
	% h=h(1).Values;
	% h=h/sum(h(:));
	h=h/norm(h,1);% we did this to normlise the data sets
	% % sum(h(:))%L1 normalised
	% % size(h)
	% wordMap;
	h=h';
	% size(h);
	assert(numel(h) == dictionarySize);

end