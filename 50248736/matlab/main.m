img=imread('..\data\art_gallery\sun_akdxvnqeibphzzfu.jpg');
imgray=rgb2gray(img);
%script to use vlfeat
run('vlfeat-0.9.20-bin\vlfeat-0.9.20\toolbox\vl_setup.m');

 points = detectSURFFeatures(imgray);
 [features, valid_points] = extractFeatures(imgray, points);

%[locations, SIFT_features] = vl_dsift(single(imgray));
%[locations1, SIFT_features1] = vl_phow(single(img),'color','hsv');

%-----using SIFT features getSIFTandDictionary1
%getSIFTandDictionary1
computeDictionary();


%----to compute mat files
batchToVisualWords();

%imageHist=getImageFeatures(wordMap,150);

%using SIFT
 buildRecognitionSystem();
 buildTestRecognitionSystem();
 sun_ahzqoumuvnpunhlb


%using KNN
% conf=evaluateRecognitionSystem();
% disp(conf);
% accurracy=trace(conf)/sum(conf(:)) * 100;
% disp(accurracy);


%using SVM (vlfeat)
%[scores,predicted_categories]=classify_SVM();
%conf=evaluateNewRecognitionSystem(scores);
%disp(conf);
%accurracy=trace(conf)/sum(conf(:)) * 100;
%disp(accurracy);
%figure;
%plot(imageHist);

load('vision.mat');
load('vision_test.mat');
%using fitecoc MATLAB
t = templateSVM('Standardize',1);
%t = templateNaiveBayes('DistributionNames','kernel');
%t=templateKNN('NumNeighbors',5,'Standardize',1)
MDL=fitcecoc(train_features',train_labels,'Learners',t);
[predicted_labels,val]=predict(MDL, test_features');
conf=confusionmat(test_labels,predicted_labels);
disp(conf);
accurracy=trace(conf)/sum(conf(:)) * 100;
disp(accurracy);
