function [dictionary] = getSIFTandDictionary(imPaths)
% Creates the filterBank and dictionary of visual words by clustering using kmeans.

% Inputs:
%   imPaths: Cell array of strings containing the full path to an image (or relative path wrt the working directory.
% Outputs:
%   dictionary: a dictionary of visual words from the filter responses using k-means.
   % filterResponses=cell(1,numel(length(imPaths)));
   % filterResponses=[];
    alpha=120;

    K=200;
    T=length(imPaths);%total length of traning sets
  sampledData = zeros(T,alpha,384);%stores the filter response on alpha pixels of T images


   parfor_progress(T);
   % parfor im=1:T % finding filter responses of T training images
   parfor i=1:T
       % disp(i);
       img=imread(imPaths{i});
       %[x y z]=size(img);
       if ndims(img) <= 2
           img=repmat(img,[1,1,3]);
       end
%        img_new=imresize(img,[28 28]);
        %[loc,siftFeatures]= vl_dsift(single(imgray));%,'color','rgb');
        [loc,siftFeatures]=vl_phow(single(img), 'step', 3, 'sizes', 8,'color','hsv');
        %loc=loc';
          
       siftFeatures=siftFeatures';
       
        [x,y]=size(siftFeatures);
       randPix=randperm(x,alpha);
        [h w]=size(randPix); 
        randArray=siftFeatures(randPix,:);
      sampledData(i,:,:) = randArray
      parfor_progress;
   end    
  parfor_progress(0);
  sampledData=reshape(sampledData,T*alpha,[]);%reshaping into alpha*T,3F format
   % dictionary= kmeans(sampledData, K, EmptyAction,drop);
    h = waitbar(0,'2/2 process started, calculating k-means clusters');
  [~,dictionary] = kmeans(double(sampledData), K, 'EmptyAction','drop');
   close(h)
   %[center, values] = vl_kmeans(double(sampledData), K);
   %dictionary = values;
  %dictionary=sampledData;
    %disp(dictionary);
   % disp(size(imPaths 160 1
    
     
end
