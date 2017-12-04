function [wordMap] = getVisualWords(img, filterBank, dictionary)
% Compute visual words mapping for the given image using the dictionary of visual words.

% Inputs:
% 	img: Input RGB image of dimension (h, w, 3)
% 	filterBank: a cell array of N filters
% Output:
%   wordMap: WordMap matrix of same size as the input image (h, w)

    % TODO Implement your code here
    filterResponses=extractFilterResponses(img,filterBank);
    [a,b,c]=size(img);
    wordMap=zeros(a,b);
	filterResponses=reshape(filterResponses,a*b,[]);
	dictionary=dictionary';
	s=[a,b];
	for i=1:a*b
		[x,y]=min(pdist2(filterResponses(i,:),dictionary));
		[I,J] = ind2sub(s,i);
		wordMap(I,J)=y;
	end

end
