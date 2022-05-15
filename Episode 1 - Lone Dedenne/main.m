%% Introduction
%{
Corresponding video for this Episode here:
[VIDEO LINK NOT YET AVAILABLE]

To summarize, we observe the rate of Lone Dedenne (when Dedenne-GX is the
only Basic Pokemon card in the opening hand) and compare the rate
mathematically calculated in Pokemath Episode 2:
https://www.youtube.com/watch?v=Leyh4uuT95U
The theoretical rate is determined to be 3.93%

%}

%% Start of Code
% Clears the workspace so data from past runs do not affect the current run
% Also clears the Command Window so everything looks nicer :)
clear, clc;

tic % Starts the "stopwatch" for displaying elapsed time


%% Setting Up
AmountOfGamesToTest = 10;
% I've set this to 10 so if you accidentally run the code, it'll resolve quickly
% For actual analysis, set this to at least Sone million games (1000000)

% For now, the starting deck will be manually hard-coded; Will build a tool "later" to take PTCGO exports --> code-friendly inputs
StartingDeck = ["Dedenne-GX", "Dragapult V", "Dragapult V", "Dragapult V", "Dragapult V", "Jirachi", "Jirachi", "Jirachi", "Jirachi", "Galarian Zigzagoon", "Galarian Zigzagoon", "Giratina", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60"];

CombinedOutputMatrix = string(zeros(AmountOfGamesToTest, 63));
LoneDedenneCount = 0;


%% Main Loop
for c = 1:AmountOfGamesToTest

    [MulliganCount, AmountOfBasicsInHand, Hand, PrizeCards, Deck] = ObtainOpeningHand(StartingDeck);
    % The ObtainOpeningHand function generates the following:
    %   MulliganCount - The amount of mulligans before obtaining a legal opening hand
    %   AmountOfBasicsInHand - The amount of Basic Pokemon cards in the opening hand
    %   Hand - Matrix containing the opening hand (all elements are strings)
    %   PrizeCards - Matrix containing the Prize Cards (all elements are strings)
    %   Deck - Matrix containing the Deck (all elements are strings)
    
    % The amount of "specific card" (ie: Dedenne-GX) in the opening hand
    SpecificCardCount = length(find(Hand == "Dedenne-GX"));

    if (AmountOfBasicsInHand == SpecificCardCount)
        % Triggers whenever all of the Basic Pokemon cards in our opening hand are Dedenne-GX
        LoneDedenneCount = LoneDedenneCount + 1;
    end
    
    % Generate the current row (ie: this "test" game) of the Output Matrix
    CurrentOutputMatrix = [MulliganCount AmountOfBasicsInHand SpecificCardCount Hand PrizeCards Deck];

    % Adds the current "test game" to the CombinedOutputMatrix
    % The Combined OutputMatrix can be thought as our record of opening hands
    CombinedOutputMatrix(c,:) = CurrentOutputMatrix;

end


%% Display of Results
% % fprintf("Here's the final result! \n")
% % disp(CombinedOutputMatrix)

fprintf("A total of %s Lone Dedenne's occured in %s games! :( \n", string(LoneDedenneCount), string(AmountOfGamesToTest))
fprintf("That's %s percent of all games! \n", string(LoneDedenneCount*100/AmountOfGamesToTest))


%% Export to Excel
% Writing a .xls file of the CombinedOutputMatrix. Note that this will not work when test more than 600 or so games due to the large size of the matrix
% % writematrix(CombinedOutputMatrix, 'COM.xls')

% Excel equation to verify Lone Dedenne
% =IF(AND(C1=1, D1=1), 1, 0)


%% End of Code
toc % Ends the "stopwatch" for displaying elapsed time