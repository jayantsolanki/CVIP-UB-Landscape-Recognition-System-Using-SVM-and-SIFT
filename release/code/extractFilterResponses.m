function [filterResponses] = extractFilterResponses(img, filterBank)
% Extract filter responses for the given image.
% Inputs: 
%   img:                a 3-channel RGB image with width W and height H
%   filterBank:         a cell array of N filters
% Outputs:
%   filterResponses:    a W x H x N*3 matrix of filter responses


% TODO Implement your code here
%[filterbank]=createFilterBank() % getting 4 types of filters on 5 different scales
% ice_skating\sun_advbapyfkehgemjf.jpg
[M,N,ch]=size(img);
if ch<3
	img=cat(3, img,img,img);%converting into 3 channel image if the image is single channel grayscale
end
img=double(img);%converting into double format
img=img/255;
 img=RGB2Lab(img);%converting the RGB colorspace into Lab format
%img=rgb2hsv(img);%using hsv
[filterCount,r]=size(filterBank);%getting size of the total filters
filterResponses=zeros(M,N,3*filterCount);%creating an zero array of size MxNx3filterCount
count=1;
for i = 1:3:3*filterCount-2
	% filterResponses(:,:,i)=imfilter(img, filterBank{i});
	filterResponses(:,:,i)=imfilter(img(:,:,1), filterBank{count});%applying same filter on all three channels
	filterResponses(:,:,i+1)=imfilter(img(:,:,2), filterBank{count});
	filterResponses(:,:,i+2)=imfilter(img(:,:,3), filterBank{count});
	count=count+1;
end

end
