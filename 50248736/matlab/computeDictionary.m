% Computes filter bank and dictionary, and saves it in dictionary.mat 

function computeDictionary()

    load('../data/traintest.mat'); 
    %train_imagenames=traintest.test_imagenames;

	interval= 1;
	train_imagenames = train_imagenames(1:interval:end);
    %test_imagenames = test_imagenames(1:interval:end);
	%[filterBank,dictionary] = getFilterBankAndDictionary(strcat(['../data/'],train_imagenames));
    [dictionary]=getSIFTandDictionary1(strcat(['../data/'],train_imagenames));
   % filterBank=createFilterBank();
     %[filterBank,dictionary] = getFilterBankAndDictionary(strcat(['../data/'],test_imagenames));
	save('SIFTdictionaryA500K200.mat','dictionary'); 

end
