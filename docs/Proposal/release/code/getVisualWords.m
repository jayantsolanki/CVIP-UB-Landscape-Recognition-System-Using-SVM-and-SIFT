function [wordMap] = getVisualWords(img, dictionary)
% Compute visual words mapping for the given image using the dictionary of visual words.

% Inputs:
% 	img: Input RGB image of dimension (h, w, 3)
% Output:
%   wordMap: WordMap matrix of same size as the input image (h, w)

    % TODO Implement your code here
    % filterResponses=extractFilterResponses(img,filterBank);
    [loc,filteredImage]= vl_phow(single(img), 'step', 3, 'sizes', 8,'color','hsv');

    [a,b,c]=size(img);
    % wordMap=zeros(a,b);
    wordMap=[];
	% filterResponses=reshape(filteredImage,a*b,[]);
	% dictionary=dictionary';
	% s=[a,b];
	% for i=1:a*b
	% 	[x,y]=min(pdist2(filterResponses(i,:),dictionary));
	% 	[I,J] = ind2sub(s,i);
	% 	wordMap(I,J)=y;
	% end
	% size(dictionary)
	% size(filteredImage)
	wordMap=knnsearch(dictionary,double(filteredImage'));

end
