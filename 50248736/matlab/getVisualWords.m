function [wordMap] = getVisualWords(img, filterBank, dictionary)
% Compute visual words mapping for the given image using the dictionary of visual words.

% Inputs:
% 	img: Input RGB image of dimension (h, w, 3)
% 	filterBank: a cell array of N filters
% Output:
%   wordMap: WordMap matrix of same size as the input image (h, w)

    % TODO Implement your code here
    if ndims(img) <= 2
           img=repmat(img,[1,1,3]);
    end
   % filteredImage=extractFilterResponses(img,filterBank);
   % [r,c,p]=size(filteredImage);
    
    %wordMap=ones(r,c);
    wordMap=[];
    [loc,filteredImage]= vl_phow(single(img), 'step', 3, 'sizes', 8,'color','hsv');
    %imgray=rgb2gray(img);
    %[loc,filteredImage]=vl_dsift(single(imgray));
        loc=loc';
      %  filteredImage=filteredImage';
        [x,y]=size(filteredImage);
    %img_new=reshape(filteredImage,[r*c p]);
    
    %dist=pdist2(img_new,dictionary);
    mn_dist=knnsearch(dictionary,filteredImage');
   % wordMap=reshape(mn_dist,[size(img,1) size(img,2)]);
   wordMap=mn_dist;
   % wordMap=reshape(mn_dist, [r c]);
end
