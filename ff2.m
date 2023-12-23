% Specify the folder containing the CSV files
folderPathCSV = 'G:\New folder\bidmc-ppg-and-respiration-dataset-1.0.0\bidmc-ppg-and-respiration-dataset-1.0.0\bdd';
folderPathText = 'G:\New folder\bidmc-ppg-and-respiration-dataset-1.0.0\bidmc-ppg-and-respiration-dataset-1.0.0\bdd'; % Replace with the actual path to your text files

% Get a list of all CSV files in the folder
csvFiles = dir(fullfile(folderPathCSV, '*.csv'));
textFiles = dir(fullfile(folderPathText, '*.% Specify the folder containing the CSV files'))
folderPath = 'G:\New folder\bidmc-ppg-and-respiration-dataset-1.0.0\bidmc-ppg-and-respiration-dataset-1.0.0\bdd';

% Get a list of all CSV files in the folder
csvFiles = dir(fullfile(folderPath, '*.csv'));

% Iterate over each CSV file
for fileIndex = 1:length(csvFiles)
    % Construct the full path to the current CSV file
    currentCSVFilePath = fullfile(folderPath, csvFiles(fileIndex).name);

    % Read the CSV file
    data = readtable(currentCSVFilePath);

    % Display the modified variable names
    disp('Modified Variable Names:');
    disp(data.Properties.VariableNames);

    % Replace spaces in variable names
    data.Properties.VariableNames = matlab.lang.makeValidName(data.Properties.VariableNames);

    % Access the columns with the modified names
    timeColumn = data.Time;
    pulseColumn = data.Pulse;
    bloodPressureColumn = data.Blood_Pressure;

    % Plot blood pressure and pulse against time
    figure;
    plot(timeColumn, bloodPressureColumn, 'r-', 'LineWidth', 2, 'DisplayName', 'Blood Pressure');
    hold on;
    plot(timeColumn, pulseColumn, 'b-', 'LineWidth', 2, 'DisplayName', 'Pulse');
    xlabel('Time (s)');
    ylabel('Value');
    title('Blood Pressure and Pulse Over Time');
    legend('show');
    grid on;

    % Display the contents of the CSV file in the command window
    fprintf('Contents of CSV file %s:\n', csvFiles(fileIndex).name);
    disp(data);
end
% Specify the folder containing the CSV files
folderPath = 'G:\New folder\bidmc-ppg-and-respiration-dataset-1.0.0\bidmc-ppg-and-respiration-dataset-1.0.0\bdd';

% Get a list of all CSV files in the folder
csvFiles = dir(fullfile(folderPath, '*.csv'));

% Iterate over each CSV file
for fileIndex = 1:length(csvFiles)
    % Construct the full path to the current CSV file
    currentCSVFilePath = fullfile(folderPath, csvFiles(fileIndex).name);

    % Read the CSV file
    data = readtable(currentCSVFilePath);

    % Display the modified variable names
    disp('Modified Variable Names:');
    disp(data.Properties.VariableNames);

    % Replace spaces in variable names
    data.Properties.VariableNames = matlab.lang.makeValidName(data.Properties.VariableNames);

    % Access the columns with the modified names
    timeColumn = data.Time;
    pulseColumn = data.Pulse;
    bloodPressureColumn = data.Blood_Pressure;

    % Plot blood pressure and pulse against time
    figure;
    plot(timeColumn, bloodPressureColumn, 'r-', 'LineWidth', 2, 'DisplayName', 'Blood Pressure');
    hold on;
    plot(timeColumn, pulseColumn, 'b-', 'LineWidth', 2, 'DisplayName', 'Pulse');
    xlabel('Time (s)');
    ylabel('Value');
    title('Blood Pressure and Pulse Over Time');
    legend('show');
    grid on;

    % Display the contents of the CSV file in the command window
    fprintf('Contents of CSV file %s:\n', csvFiles(fileIndex).name);
    disp(data);
end
txt'));

% Initialize a structure to store results
results = struct('fileIndex', [], 'sections', struct('section', '', 'timeDomainPlots', [], 'frequencyDomainPlots', [], 'patientInfo', ''));

% Iterate over each CSV file
for fileIndex = 1:length(csvFiles)
    % Construct the full path to the current CSV file
    currentCSVFilePath = fullfile(folderPathCSV, csvFiles(fileIndex).name);

    % Read the CSV file
    data = readtable(currentCSVFilePath);

    % Get the unique sections in the CSV file
    sections = unique(data.Properties.VariableNames);

    % Initialize structure to store results for the current file
    fileResults = struct('fileIndex', fileIndex, 'sections', struct('section', '', 'timeDomainPlots', [], 'frequencyDomainPlots', [], 'patientInfo', ''));

    % Iterate over each section
    for i = 1:length(sections)
        % Extract data columns for the current section
        currentSection = sections{i};
        currentData = data.(currentSection);

        % Create a new figure for each section
        figure;

        % Plot the data for the current section in the time domain
        subplot(1, 2, 1);
        for j = 1:size(currentData, 2)
            plot(currentData(:, j));
            hold on;
        end
        title(sprintf('%s - Time Domain', currentSection));
        xlabel('Sample Number');
        ylabel('Amplitude');
        legend('Signal 1', 'Signal 2', 'Signal 3', 'Signal 4', 'Signal 5'); % Adjust as needed

        % Plot the data for the current section in the frequency domain
        subplot(1, 2, 2);
        for j = 1:size(currentData, 2)
            % Perform FFT and plot the magnitude spectrum
            fft_result = fft(currentData(:, j));
            f = linspace(0, 1, length(fft_result)) * (1 / 2);  % Frequency axis
            plot(f, abs(fft_result));
            hold on;
        end
        title(sprintf('%s - Frequency Domain', currentSection));
        xlabel('Frequency (Hz)');
        ylabel('Magnitude');
        legend('Signal 1', 'Signal 2', 'Signal 3', 'Signal 4', 'Signal 5'); % Adjust as needed

        % Display patient information at the bottom of the figure
        infoText = sprintf('Age: %s, Gender: %s, Location: %s', ageMatch{1}, genderMatch{1}, locationMatch{1});
        annotation('textbox', [0, 0, 1, 0.05], 'String', infoText, 'EdgeColor', 'none', 'HorizontalAlignment', 'center');

        % Store results for the current section
        fileResults.sections(i).section = currentSection;
        fileResults.sections(i).timeDomainPlots = gcf;
        fileResults.sections(i).frequencyDomainPlots = gcf;
        fileResults.sections(i).patientInfo = infoText;

        % Display results for the current section
        disp(fileResults.sections(i));
    end

    % Store results for the current file
    results(fileIndex) = fileResults;
end
