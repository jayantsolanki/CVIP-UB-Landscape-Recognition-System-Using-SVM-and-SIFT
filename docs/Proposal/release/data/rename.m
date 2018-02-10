% Get all PDF files in the current folder
files = dir('*.jpg');
% Loop through each
symbols = ['a':'z' 'A':'Z'];
length(files)
for id = 1:length(files)
    % Get the file name (minus the extension)
    [~, f] = fileparts(files(id).name);
      % Convert to number
      num = str2double(f);
      % if ~isnan(num)
      % If numeric, rename
		MAX_ST_LENGTH = 16;
		stLength = randi(MAX_ST_LENGTH);
		nums = randi(numel(symbols), 16);
		st = symbols(nums);
		% files(id).name = strcat('crosbyhall\',files(id).name);
		% st = strcat('crosbyhall\',st);
		% st
		% files(id).name
		% st = st(1:15)
        movefile(files(id).name, sprintf('%s.jpg', st(1:15)));
      % end
end