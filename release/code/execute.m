%I = imread('..\data\ice_skating\sun_advbapyfkehgemjf.jpg');
%[filterBank]=createFilterBank();
%filterResponses=extractFilterResponses(I,filterBank);
%[a,b,c]=size(I);
%monty=reshape(filterResponses,a,b,3,20);
%montage(monty,'Size',[4,5]);

%1.2

%load('../data/traintest.mat');
%[filterBank,dictionary]=getFilterBankandDictionary(all_imagenames);
computeDictionary
delete(gcp('nocreate'))
batchToVisualWords(3)
