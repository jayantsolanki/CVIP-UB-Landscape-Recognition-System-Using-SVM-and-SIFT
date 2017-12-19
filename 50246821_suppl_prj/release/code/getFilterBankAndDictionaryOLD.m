function [filterBank, dictionary] = getFilterBankAndDictionary(imPaths)
% Creates the filterBank and dictionary of visual words by clustering using kmeans.

% Inputs:
%   imPaths: Cell array of strings containing the full path to an image (or relative path wrt the working directory.
% Outputs:
%   filterBank: N filters created using createFilterBank()
%   dictionary: a dictionary of visual words from the filter responses using k-means.

    filterBank  = createFilterBank();

    % TODO Implement your code here
    % h = waitbar(0,'1/2 process started, findind 3F filters');
    T=length(imPaths);%total length of traning sets
    alpha=150;%decding value of alpha
    clusters=200;
    filter_Responses=zeros(T,alpha,60);%stores the filter response on alpha pixels of T images
    parfor_progress(T);
    parfor im=1:T % finding filter responses of T training images
	    img=imread(imPaths{im});
	    % imshow(img);
	    filterResponses=extractFilterResponses(img,filterBank);
	    [a,b,c]=size(img);
	    filterResponses=reshape(filterResponses,a*b,[]);
	    filter_Responses(im,:,:)=filterResponses(randperm(a*b,alpha),:);%optimised here, no loops required, finding alpha random pixels
	    parfor_progress;
	    % waitbar(im/T,h,sprintf('%d% / %d filtered image generated',im,T))%waitbar, random stuff
	end
	% close(h)
	parfor_progress(0);
	filter_Responses=reshape(filter_Responses,T*alpha,[]);%reshaping into alpha*T,3F format
    % size(filterResponses);
    h = waitbar(0,'2/2 process started, calculating k-means clusters');
    [~, dictionary] = kmeans(filter_Responses, clusters, 'EmptyAction','drop');
    dictionary=dictionary';
    close(h)

end
