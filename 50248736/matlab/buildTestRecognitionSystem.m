function buildTestRecognitionSystem()
% Creates vision_test.mat. Generates testing features for all of the testing images.

	load('SIFTdictionaryTestK180.mat');
	load('../data/traintest.mat');
    %filterBank  = createFilterBank();
    h=[];
    dictionarySize=size(dictionary,1);

	% TODO create train_features
    l = length(test_imagenames);
    for i=1:l
        wordMapName=strcat('../data/',strrep(test_imagenames{i},'.jpg','.mat'));
        disp(i);
        
        wordMap=load(wordMapName);
        wordMap=wordMap.wordMap;
        %disp(wordMap);
        h1=getImageFeaturesSPM(3, wordMap, dictionarySize);
        h=cat(2,h,h1);
    end
    test_features=h;
	save('vision_test.mat', 'dictionary', 'test_features', 'test_labels');

end