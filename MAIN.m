% Specify the folder containing the CSV files
folderPathCSV = 'G:\New folder\bidmc-ppg-and-respiration-dataset-1.0.0\bidmc-ppg-and-respiration-dataset-1.0.0\bidmc_csv1';
folderPathText = 'G:\New folder\bidmc-ppg-and-respiration-dataset-1.0.0\bidmc-ppg-and-respiration-dataset-1.0.0\bidmc_csv1'; 


csvFiles = dir(fullfile(folderPathCSV, '*.csv'));
textFiles = dir(fullfile(folderPathText, '*.txt'));


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

        % Analyze respiratory signal
        if contains(lower(currentSection), 'resp')
            abnormalBreathing = analyzeRespiratorySignal(currentData);
            fprintf('Abnormal Breathing Detected: %d occurrences\n', abnormalBreathing);

            % Identify potential diseases based on abnormal breathing
            diseaseName = identifyDisease(abnormalBreathing);
            fprintf('Potential Disease: %s\n', diseaseName);
        end

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

% ...

function abnormalBreathing = analyzeRespiratorySignal(respSignal)
    % This is a simplistic analysis for illustration purposes
    % You may need domain-specific knowledge for a more accurate analysis
    
    % Example: Count the number of times respiratory rate exceeds a threshold
    threshold = 20; % Adjust as needed
    abnormalBreathing = sum(respSignal > threshold);
end

function diseaseName = identifyDisease(abnormalBreathingCount)
    % This is a simplistic identification for illustration purposes
    % You may need domain-specific knowledge for a more accurate identification
    
    if abnormalBreathingCount > 10
        diseaseName = 'Potential Respiratory Disorder';
    else
        diseaseName = 'No Significant Disease Detected';
    end
end
