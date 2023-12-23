% Specify the folder containing the CSV files
%folderPath = 'G:\New folder\bidmc-ppg-and-respiration-dataset-1.0.0\bidmc-ppg-and-respiration-dataset-1.0.0\bdd';  % Replace with the actual path to your folder

% Get a list of all CSV files in the folder
%csvFiles = dir(fullfile(folderPath, '*.csv'));

% Iterate over each CSV file
%for fileIndex = 1:length(csvFiles)
    % Construct the full path to the current CSV file
    %currentCSVFilePath = fullfile(folderPath, csvFiles(fileIndex).name);

    % Read the CSV file
   % data = readtable(currentCSVFilePath);

    % Display the contents of the CSV file in the command window
  %  fprintf('Contents of CSV file %s:\n', csvFiles(fileIndex).name);
 %   disp(data);
%end% Specify the folder containing the CSV files
folderPath = 'G:\New folder\bidmc-ppg-and-respiration-dataset-1.0.0\bidmc-ppg-and-respiration-dataset-1.0.0\bdd';  % Replace with the actual path to your folder

% Get a list of all CSV files in the folder
%csvFiles = dir(fullfile(folderPath, '*.csv'));

% Initialize variables to store x and y data
%xData = [];
%yData = [];

% Iterate over each CSV file
%for fileIndex = 1:length(csvFiles)
    % Construct the full path to the current CSV file
    %currentCSVFilePath = fullfile(folderPath, csvFiles(fileIndex).name);

    % Read the CSV file
    %data = readtable(currentCSVFilePath);

    % Display the contents of the CSV file in the command window
    %fprintf('Contents of CSV file %s:\n', csvFiles(fileIndex).name);
    %disp(data);

    % Assuming the first column is the x-axis data and the second column is the y-axis data
    % Replace 'XColumnName' and 'YColumnName' with the actual column names in your files
    %xColumnName = 'data';
   % yColumnName = 'data';

    % Extract x and y data from the table
  %  xData = [xData; data.(xColumnName)];
 %   yData = [yData; data.(yColumnName)];
%end

% Plot the combined data
%figure;
%plot(xData, yData);
%xlabel('X-axis Label'); % Replace with your x-axis label
%ylabel('Y-axis Label'); % Replace with your y-axis label
%title('Combined Plot from Multiple CSV Files');








% Specify the folder containing the CSV files
folderPath = 'G:\New folder\bidmc-ppg-and-respiration-dataset-1.0.0\bidmc-ppg-and-respiration-dataset-1.0.0\bdd';

% Get a list of all CSV files in the folder
csvFiles = dir(fullfile(folderPath, 'blood_pressure.csv'));

% Initialize variables to store x and y data
xData = [];
yData = [];

% Iterate over each CSV file
for fileIndex = 1:length(csvFiles)
    % Construct the full path to the current CSV file
    currentCSVFilePath = fullfile(folderPath, csvFiles(fileIndex).name);

    % Read the CSV file
    data = readtable(currentCSVFilePath);

    % Display the contents of the CSV file in the command window
    fprintf('Contents of CSV file %s:\n', csvFiles(fileIndex).name);
    disp(data);

    % Assuming the first column is the x-axis data and the second column is the y-axis data
    % Replace 'XColumnName' and 'YColumnName' with the actual column names in your files
    xCo= 'XColumnName';  % Replace with the actual column name for x data
    yCo = 'YColumnName';  % Replace with the actual column name for y data

    % Extract x and y data from the table
    xData = [xData; data.(xCo)];
    yData = [yData; data.(yCo)];

    % Plot the data for each file
    figure;
    plot(data.(xColumnName), data.(yCo));
    title(['Plot for ', csvFiles(fileIndex).name]);
    xlabel('X-axis Label');  % Replace with the actual label for the x-axis
    ylabel('Y-axis Label');  % Replace with the actual label for the y-axis
    grid on;
end

% Now, xData and yData contain the concatenated data from all CSV files
% You can perform further analysis or visualization using these arrays

