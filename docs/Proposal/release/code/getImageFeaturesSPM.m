function [h] = getImageFeaturesSPM(layerNum, wordMap, dictionarySize)
% Compute histogram of visual words using SPM method
% Inputs:
%   layerNum: Number of layers (L+1)
%   wordMap: WordMap matrix of size (h, w)
%   dictionarySize: the number of visual words, dictionary size
% Output:
%   h: histogram of visual words of size {dictionarySize * (4^layerNum - 1)/3} (l1-normalized, ie. sum(h(:)) == 1)

    % TODO Implement your code here
    %for layer 3, L=2 so
    [a,b]=size(wordMap);
    k=dictionarySize*((4^(layerNum)-1)/3); %dimension of the resultant histogram vector after the histogram vectors for each layer is calculated
    h=zeros(k,1);%creating the zero filled array of kx1 dimension
    width=b/(2^(layerNum-1));
    height=a/(2^(layerNum-1));
    % figure
    count=1;
    % hi=0;
    if layerNum==3
    	for i=1:4
    		for j=1:4
    			[histo,bins]=histcounts(wordMap((i-1)*height+1:i*height,(j-1)*width+1:j*width),dictionarySize);%spliting image and calculating the histogram of it
    			% imagesc(wordMap((i-1)*height+1:i*height,(j-1)*width+1:j*width));
				% histo=histo/norm(histo,1);% we did this to normlise the data sets
				% size(histo);
				histo=histo';
				h(dictionarySize*(count-1)+1:dictionarySize*count,1)=histo/2;%weighted
				count=count+1;
    			
    			% pause
    		end
    	end
    	% plot(h)

    	%for layer 1
    	% h(dictionarySize*16+1:dictionarySize*17,1)=(h(1:dictionarySize*1,1)+h(dictionarySize*1+1:dictionarySize*2,1)+h(dictionarySize*4+1:dictionarySize*5,1)+h(dictionarySize*5+1:dictionarySize*6,1))/2;
    	% h(dictionarySize*17+1:dictionarySize*18,1)=(h(dictionarySize*2+1:dictionarySize*3,1)+h(dictionarySize*3+1:dictionarySize*4,1)+h(dictionarySize*6+1:dictionarySize*7,1)+h(dictionarySize*7+1:dictionarySize*8,1))/2;
    	% h(dictionarySize*18+1:dictionarySize*19,1)=(h(dictionarySize*8+1:dictionarySize*9,1)+h(dictionarySize*9+1:dictionarySize*10,1)+h(dictionarySize*12+1:dictionarySize*13,1)+h(dictionarySize*13+1:dictionarySize*14,1))/2;
    	% h(dictionarySize*19+1:dictionarySize*20,1)=(h(dictionarySize*10+1:dictionarySize*11,1)+h(dictionarySize*11+1:dictionarySize*12,1)+h(dictionarySize*14+1:dictionarySize*15,1)+h(dictionarySize*15+1:dictionarySize*16,1))/2;
    	%for layer 0
    	% h(dictionarySize*20+1:dictionarySize*21,1)=histcounts(wordMap,dictionarySize)/4;
    	width=b/(2^(layerNum-2));
    	height=a/(2^(layerNum-2));
    	for i=1:2
    		for j=1:2
    			[histo,bins]=histcounts(wordMap((i-1)*height+1:i*height,(j-1)*width+1:j*width),dictionarySize);%spliting image and calculating the histogram of it
    			% imagesc(wordMap((i-1)*height+1:i*height,(j-1)*width+1:j*width));
				% histo=histo/norm(histo,1);% we did this to normlise the data sets
				% size(histo);
				histo=histo';
				h(dictionarySize*(count-1)+1:dictionarySize*count,1)=histo/4;%weighted
				count=count+1;
    			
    			% pause
    		end
    	end
        h(dictionarySize*20+1:dictionarySize*21,1)=histcounts(wordMap,dictionarySize)/4;
    	h=h/norm(h,1);
    end
    % hold




end