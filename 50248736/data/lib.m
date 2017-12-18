%lib.m
mapping={'centerforarts','commons','crosbyhall','hayeshall','healthsciencelibrary','lasalle','studentunion'};
%storing image paths
count=0;
all_imagenames={};
all_labels=[];
train_imagenames = {};
test_imagenames = {};
train_labels = [];
test_labels = [];
files = dir('centerforarts\*.jpg');
% Loop through each
for id = 1:length(files)
	count= count+1;
    % Get the file name (minus the extension)
    [~, f] = fileparts(files(id).name);
		files(id).name = strcat('centerforarts/',files(id).name);
		all_imagenames{count} = files(id).name;
		all_labels(count) = 1;
		% st = strcat('crosbyhall\',st);
		% st
		% files(id).name
		% st = st(1:15)

      % end
end
%%%===
files = dir('commons\*.jpg');
% Loop through each
for id = 1:length(files)
	count= count+1;
    % Get the file name (minus the extension)
    [~, f] = fileparts(files(id).name);
		files(id).name = strcat('commons/',files(id).name);
		all_imagenames{count} = files(id).name;
		all_labels(count) = 2;
		% st = strcat('crosbyhall\',st);
		% st
		% files(id).name
		% st = st(1:15)

      % end
end
%%%===
files = dir('crosbyhall\*.jpg');
% Loop through each
for id = 1:length(files)
	count= count+1;
    % Get the file name (minus the extension)
    [~, f] = fileparts(files(id).name);
		files(id).name = strcat('crosbyhall/',files(id).name);
		all_imagenames{count} = files(id).name;
		all_labels(count) = 3;
		% st = strcat('crosbyhall\',st);
		% st
		% files(id).name
		% st = st(1:15)

      % end
end
%%%===
files = dir('hayeshall\*.jpg');
% Loop through each
for id = 1:length(files)
	count= count+1;
    % Get the file name (minus the extension)
    [~, f] = fileparts(files(id).name);
		files(id).name = strcat('hayeshall/',files(id).name);
		all_imagenames{count} = files(id).name;
		all_labels(count) = 4;
		% st = strcat('crosbyhall\',st);
		% st
		% files(id).name
		% st = st(1:15)

      % end
end
%%%===
files = dir('healthsciencelibrary\*.jpg');
% Loop through each
for id = 1:length(files)
	count= count+1;
    % Get the file name (minus the extension)
    [~, f] = fileparts(files(id).name);
		files(id).name = strcat('healthsciencelibrary/',files(id).name);
		all_imagenames{count} = files(id).name;
		all_labels(count) = 5;
		% st = strcat('crosbyhall\',st);
		% st
		% files(id).name
		% st = st(1:15)

      % end
end
%%%===
files = dir('lasalle\*.jpg');
% Loop through each
for id = 1:length(files)
	count= count+1;
    % Get the file name (minus the extension)
    [~, f] = fileparts(files(id).name);
		files(id).name = strcat('lasalle/',files(id).name);
		all_imagenames{count} = files(id).name;
		all_labels(count) = 6;
		% st = strcat('crosbyhall\',st);
		% st
		% files(id).name
		% st = st(1:15)

      % end
end
files = dir('studentunion\*.jpg');
% Loop through each
for id = 1:length(files)
	count= count+1;
    % Get the file name (minus the extension)
    [~, f] = fileparts(files(id).name);
		files(id).name = strcat('studentunion/',files(id).name);
		all_imagenames{count} = files(id).name;
		all_labels(count) = 7;
		% st = strcat('crosbyhall\',st);
		% st
		% files(id).name
		% st = st(1:15)

      % end
end
all_imagenames = all_imagenames';
all_labels = all_labels';
train_imagenames(1:60)= all_imagenames(1:60);
train_imagenames(61:120)= all_imagenames(77:136);
train_imagenames(121:180)= all_imagenames(153:212);
train_imagenames(181:240)= all_imagenames(229:288);
train_imagenames(241:300)= all_imagenames(305:364);
train_imagenames(301:360)= all_imagenames(381:440);
train_imagenames(361:420)= all_imagenames(457:516);
train_labels(1:60)= all_labels(1:60);
train_labels(61:120)= all_labels(77:136);
train_labels(121:180)= all_labels(153:212);
train_labels(181:240)= all_labels(229:288);
train_labels(241:300)= all_labels(305:364);
train_labels(301:360)= all_labels(381:440);
train_labels(361:420)= all_labels(457:516);

test_imagenames(1:16)= all_imagenames(61:76);
test_imagenames(17:32)= all_imagenames(137:152);
test_imagenames(33:48)= all_imagenames(213:228);
test_imagenames(49:64)= all_imagenames(289:304);
test_imagenames(65:80)= all_imagenames(365:380);
test_imagenames(81:96)= all_imagenames(441:456);
test_imagenames(97:112)= all_imagenames(517:532);

test_labels(1:16)= 1;
test_labels(17:32)= 2;
test_labels(33:48)= 3;
test_labels(49:64)= 4;
test_labels(65:80)= 5;
test_labels(81:96)= 6;
test_labels(97:112)= 7;

train_imagenames =train_imagenames';
test_imagenames = test_imagenames';
train_labels = train_labels';
test_labels = test_labels';

save traintest.mat all_imagenames all_labels  train_imagenames test_imagenames train_labels test_labels ;
