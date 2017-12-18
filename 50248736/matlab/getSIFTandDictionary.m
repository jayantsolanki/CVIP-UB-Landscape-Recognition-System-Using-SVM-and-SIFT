function [dictionary] = getSIFTandDictionary(imPaths)
% Creates the filterBank and dictionary of visual words by clustering using kmeans.

% Inputs:
%   imPaths: Cell array of strings containing the full path to an image (or relative path wrt the working directory.
% Outputs:
%   filterBank: N filters created using createFilterBank()
%   dictionary: a dictionary of visual words from the filter responses using k-means.

 % filterBank  = createFilterBank();
   % filterResponses=cell(1,numel(length(imPaths)));
   % filterResponses=[];
    a=120;
    K=140;
    sampledData=[];
    % TODO Implement your code here
   for i=1:length(imPaths)
       disp(i);
       img=imread(imPaths{i});
       %[x y z]=size(img);
       if ndims(img) <= 2
           img=repmat(img,[1,1,3]);
       end
       %img=im2double(img);
       %img=imread('..\data\library\sun_bikkrgtvixmjwoas.jpg');
        %filterImage=extractFilterResponses(img,filterBank);
        %[r c p] = size(filterImage);
        %filterImage2=reshape(filterImage,[r*c p]);
        imgray=rgb2gray(img);
        %[loc,siftFeatures]= vl_dsift(single(imgray));%,'color','rgb');
        %loc=loc';
        
        
         points = detectSURFFeatures(imgray);
         [features, valid_points] = extractFeatures(imgray, points);
        
%         siftFeatures=siftFeatures';
        [x,y]=size(features);
        disp(x);
        disp(y);
       randPix=randperm(x*y,a);
        [h w]=size(randPix); 
        randArray=features(randPix);
        %randArray=randPerm(filterImage,a);
        sampledData=[sampledData;randArray];
       % sampledData=cat(1,sampledData,randArray);
   end    
     
   % dictionary= kmeans(sampledData, K, EmptyAction,drop);
    dictionary = kmeans(sampledData, K, 'EmptyAction','drop');
   % [center, values] = vl_kmeans(double(sampledData), K);
  %  dictionary = center';
  %dictionary=sampledData;
    %disp(dictionary);
   % disp(size(imPaths 160 1
    
     

end
