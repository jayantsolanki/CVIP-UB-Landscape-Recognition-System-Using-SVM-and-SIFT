function [dictionary] = getSIFTandDictionary1(imPaths)
% Creates the filterBank and dictionary of visual words by clustering using kmeans.

% Inputs:
%   imPaths: Cell array of strings containing the full path to an image (or relative path wrt the working directory.
% Outputs:
%   filterBank: N filters created using createFilterBank()
%   dictionary: a dictionary of visual words from the filter responses using k-means.

 % filterBank  = createFilterBank();
   % filterResponses=cell(1,numel(length(imPaths)));
   % filterResponses=[];
    a=150;
    K=200;
    sampledData=[];
    % TODO Implement your code here
   for i=1:length(imPaths)
       disp(i);
       img=imread(imPaths{i});
       %[x y z]=size(img);
       if ndims(img) <= 2
           img=repmat(img,[1,1,3]);
       end
    
       img_new=imresize(img,[28 28]);
        %[loc,siftFeatures]= vl_dsift(single(imgray));%,'color','rgb');
        [loc,siftFeatures]=vl_phow(single(img_new), 'step', 3, 'sizes', 8,'color','hsv');
        %loc=loc';
          
       siftFeatures=siftFeatures';
       
%         [x,y]=size(siftFeatures);
%        randPix=randperm(x,a);
%         [h w]=size(randPix); 
%         randArray=siftFeatures(randPix,:);
%         disp(size(siftFeatures));
%         disp(size(randArray));
        
        
        %randArray=randPerm(filterImage,a);
        %sampledData=[sampledData,randArray];
        %disp(size(sampledData));
       % sampledData=cat(1,sampledData,randArray);
       
       sampledData=cat(1,sampledData,siftFeatures);
   end    
     
   % dictionary= kmeans(sampledData, K, EmptyAction,drop);
  [~,dictionary] = kmeans(double(sampledData), K, 'EmptyAction','drop');
   %[center, values] = vl_kmeans(double(sampledData), K);
   %dictionary = values;
  %dictionary=sampledData;
    %disp(dictionary);
   % disp(size(imPaths 160 1
    
     
end
